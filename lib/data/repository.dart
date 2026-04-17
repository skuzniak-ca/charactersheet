import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'database.dart';

const _uuid = Uuid();

class UniverseWithDefs {
  final Universe universe;
  final List<StatDef> stats;
  final List<ResourceTrackDef> resourceTracks;
  final List<CurrencyDef> currencies;
  final List<SkillDef> skills;

  const UniverseWithDefs({
    required this.universe,
    required this.stats,
    required this.resourceTracks,
    required this.currencies,
    required this.skills,
  });
}

class UniverseDraft {
  String name;
  String playGroup;
  List<StatDraft> stats;
  List<TrackDraft> tracks;
  List<TrackDraft> currencies;
  List<SkillDraft> skills;

  UniverseDraft({
    this.name = '',
    this.playGroup = '',
    List<StatDraft>? stats,
    List<TrackDraft>? tracks,
    List<TrackDraft>? currencies,
    List<SkillDraft>? skills,
  })  : stats = stats ?? [],
        tracks = tracks ?? [],
        currencies = currencies ?? [],
        skills = skills ?? [];
}

class StatDraft {
  String id;
  String name;
  String abbreviation;
  StatDraft({String? id, this.name = '', this.abbreviation = ''})
      : id = id ?? _uuid.v4();
}

class TrackDraft {
  String id;
  String name;
  TrackDraft({String? id, this.name = ''}) : id = id ?? _uuid.v4();
}

class SkillDraft {
  String id;
  String name;
  String? linkedStatId;
  SkillDraft({String? id, this.name = '', this.linkedStatId})
      : id = id ?? _uuid.v4();
}

class CharacterRepository {
  final AppDatabase db;
  CharacterRepository(this.db);

  Stream<List<Universe>> watchActiveUniverses() {
    return (db.select(db.universes)
          ..where((u) => u.isArchived.equals(false))
          ..orderBy([(u) => OrderingTerm(expression: u.name)]))
        .watch();
  }

  Stream<List<Universe>> watchArchivedUniverses() {
    return (db.select(db.universes)
          ..where((u) => u.isArchived.equals(true))
          ..orderBy([(u) => OrderingTerm(expression: u.name)]))
        .watch();
  }

  Stream<List<Character>> watchCharactersByUniverse(String universeId) {
    return (db.select(db.characters)
          ..where((c) => c.universeId.equals(universeId))
          ..orderBy([(c) => OrderingTerm(expression: c.name)]))
        .watch();
  }

  Future<UniverseWithDefs?> getUniverseWithDefs(String id) async {
    final universe = await (db.select(db.universes)..where((u) => u.id.equals(id)))
        .getSingleOrNull();
    if (universe == null) return null;
    final stats = await (db.select(db.statDefs)
          ..where((s) => s.universeId.equals(id))
          ..orderBy([(s) => OrderingTerm(expression: s.orderIndex)]))
        .get();
    final tracks = await (db.select(db.resourceTrackDefs)
          ..where((s) => s.universeId.equals(id))
          ..orderBy([(s) => OrderingTerm(expression: s.orderIndex)]))
        .get();
    final currencies = await (db.select(db.currencyDefs)
          ..where((s) => s.universeId.equals(id))
          ..orderBy([(s) => OrderingTerm(expression: s.orderIndex)]))
        .get();
    final skills = await (db.select(db.skillDefs)
          ..where((s) => s.universeId.equals(id))
          ..orderBy([(s) => OrderingTerm(expression: s.orderIndex)]))
        .get();
    return UniverseWithDefs(
      universe: universe,
      stats: stats,
      resourceTracks: tracks,
      currencies: currencies,
      skills: skills,
    );
  }

  Future<String> createUniverseFromDraft(UniverseDraft draft) async {
    final id = _uuid.v4();
    await db.transaction(() async {
      await db.into(db.universes).insert(UniversesCompanion.insert(
            id: id,
            name: draft.name,
            playGroup: Value(draft.playGroup),
          ));
      await _writeDefs(id, draft);
    });
    return id;
  }

  Future<void> updateUniverseFromDraft(String id, UniverseDraft draft) async {
    await db.transaction(() async {
      await (db.update(db.universes)..where((u) => u.id.equals(id)))
          .write(UniversesCompanion(
        name: Value(draft.name),
        playGroup: Value(draft.playGroup),
      ));
      await (db.delete(db.statDefs)..where((s) => s.universeId.equals(id))).go();
      await (db.delete(db.resourceTrackDefs)..where((s) => s.universeId.equals(id))).go();
      await (db.delete(db.currencyDefs)..where((s) => s.universeId.equals(id))).go();
      await (db.delete(db.skillDefs)..where((s) => s.universeId.equals(id))).go();
      await _writeDefs(id, draft);
    });
  }

  Future<void> _writeDefs(String universeId, UniverseDraft draft) async {
    for (var i = 0; i < draft.stats.length; i++) {
      final s = draft.stats[i];
      await db.into(db.statDefs).insert(StatDefsCompanion.insert(
            id: s.id,
            universeId: universeId,
            name: s.name,
            abbreviation: Value(s.abbreviation),
            orderIndex: i,
          ));
    }
    for (var i = 0; i < draft.tracks.length; i++) {
      final t = draft.tracks[i];
      await db.into(db.resourceTrackDefs).insert(ResourceTrackDefsCompanion.insert(
            id: t.id,
            universeId: universeId,
            name: t.name,
            orderIndex: i,
          ));
    }
    for (var i = 0; i < draft.currencies.length; i++) {
      final c = draft.currencies[i];
      await db.into(db.currencyDefs).insert(CurrencyDefsCompanion.insert(
            id: c.id,
            universeId: universeId,
            name: c.name,
            orderIndex: i,
          ));
    }
    for (var i = 0; i < draft.skills.length; i++) {
      final s = draft.skills[i];
      await db.into(db.skillDefs).insert(SkillDefsCompanion.insert(
            id: s.id,
            universeId: universeId,
            name: s.name,
            linkedStatId: Value(s.linkedStatId),
            orderIndex: i,
          ));
    }
  }

  Future<void> deleteUniverseCascade(String id) async {
    await db.transaction(() async {
      final chars = await (db.select(db.characters)
            ..where((c) => c.universeId.equals(id)))
          .get();
      for (final c in chars) {
        if (c.imagePath != null) {
          final f = File(c.imagePath!);
          if (await f.exists()) await f.delete();
        }
      }
      await (db.delete(db.characters)..where((c) => c.universeId.equals(id))).go();
      await (db.delete(db.universes)..where((u) => u.id.equals(id))).go();
    });
  }

  Future<void> archiveUniverse(String id) async {
    await (db.update(db.universes)..where((u) => u.id.equals(id)))
        .write(const UniversesCompanion(isArchived: Value(true)));
  }

  Future<void> unarchiveUniverse(String id) async {
    await (db.update(db.universes)..where((u) => u.id.equals(id)))
        .write(const UniversesCompanion(isArchived: Value(false)));
  }
}
