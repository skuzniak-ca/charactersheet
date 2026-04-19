import 'dart:async';
import 'dart:convert';
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

class CharacterFull {
  final Character character;
  final Universe universe;
  final List<StatDef> statDefs;
  final List<ResourceTrackDef> resourceDefs;
  final List<CurrencyDef> currencyDefs;
  final List<SkillDef> skillDefs;
  final Map<String, int> statValues;
  final Map<String, ResourceValue> resourceValues;
  final Map<String, int> currencyValues;
  final Map<String, SkillValue> skillValues;
  final List<CharacterClass> classes;
  final List<InventoryItem> inventory;

  const CharacterFull({
    required this.character,
    required this.universe,
    required this.statDefs,
    required this.resourceDefs,
    required this.currencyDefs,
    required this.skillDefs,
    required this.statValues,
    required this.resourceValues,
    required this.currencyValues,
    required this.skillValues,
    required this.classes,
    required this.inventory,
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

  // ---- Characters ----

  Future<CharacterFull?> getCharacterFull(String id) async {
    final character = await (db.select(db.characters)..where((c) => c.id.equals(id)))
        .getSingleOrNull();
    if (character == null) return null;
    final universe = await (db.select(db.universes)
          ..where((u) => u.id.equals(character.universeId)))
        .getSingle();
    final defs = await getUniverseWithDefs(universe.id);
    final statVals = await (db.select(db.statValues)
          ..where((v) => v.characterId.equals(id)))
        .get();
    final resVals = await (db.select(db.resourceValues)
          ..where((v) => v.characterId.equals(id)))
        .get();
    final currVals = await (db.select(db.currencyValues)
          ..where((v) => v.characterId.equals(id)))
        .get();
    final skillVals = await (db.select(db.skillValues)
          ..where((v) => v.characterId.equals(id)))
        .get();
    final classes = await (db.select(db.characterClasses)
          ..where((c) => c.characterId.equals(id))
          ..orderBy([(c) => OrderingTerm(expression: c.orderIndex)]))
        .get();
    final inventory = await (db.select(db.inventoryItems)
          ..where((i) => i.characterId.equals(id))
          ..orderBy([(i) => OrderingTerm(expression: i.orderIndex)]))
        .get();
    return CharacterFull(
      character: character,
      universe: universe,
      statDefs: defs!.stats,
      resourceDefs: defs.resourceTracks,
      currencyDefs: defs.currencies,
      skillDefs: defs.skills,
      statValues: {for (final v in statVals) v.statDefId: v.value},
      resourceValues: {for (final v in resVals) v.resourceDefId: v},
      currencyValues: {for (final v in currVals) v.currencyDefId: v.amount},
      skillValues: {for (final v in skillVals) v.skillDefId: v},
      classes: classes,
      inventory: inventory,
    );
  }

  Future<String> createCharacter({
    required String universeId,
    required String name,
  }) async {
    final id = _uuid.v4();
    await db.into(db.characters).insert(CharactersCompanion.insert(
          id: id,
          universeId: universeId,
          name: name,
        ));
    return id;
  }

  Future<void> updateCharacter({
    required String id,
    required String name,
    required String race,
    required int level,
    required String backstory,
    String? imagePath,
    required String status,
    required String notes,
    required List<({String className, int level})> classes,
    required Map<String, int> statValues,
    required Map<String, ({int current, int maximum})> resourceValues,
    required Map<String, int> currencyValues,
    required Map<String, ({int value, bool proficient})> skillValues,
    required List<InventoryItemEntry> inventory,
  }) async {
    await db.transaction(() async {
      await (db.update(db.characters)..where((c) => c.id.equals(id))).write(
        CharactersCompanion(
          name: Value(name),
          race: Value(race),
          level: Value(level),
          backstory: Value(backstory),
          imagePath: Value(imagePath),
          status: Value(status),
          notes: Value(notes),
        ),
      );
      await (db.delete(db.characterClasses)..where((c) => c.characterId.equals(id))).go();
      for (var i = 0; i < classes.length; i++) {
        await db.into(db.characterClasses).insert(CharacterClassesCompanion.insert(
              id: _uuid.v4(),
              characterId: id,
              className: classes[i].className,
              classLevel: Value(classes[i].level),
              orderIndex: i,
            ));
      }
      await (db.delete(db.statValues)..where((v) => v.characterId.equals(id))).go();
      for (final e in statValues.entries) {
        await db.into(db.statValues).insert(StatValuesCompanion.insert(
              characterId: id,
              statDefId: e.key,
              value: Value(e.value),
            ));
      }
      await (db.delete(db.resourceValues)..where((v) => v.characterId.equals(id))).go();
      for (final e in resourceValues.entries) {
        await db.into(db.resourceValues).insert(ResourceValuesCompanion.insert(
              characterId: id,
              resourceDefId: e.key,
              current: Value(e.value.current),
              maximum: Value(e.value.maximum),
            ));
      }
      await (db.delete(db.currencyValues)..where((v) => v.characterId.equals(id))).go();
      for (final e in currencyValues.entries) {
        await db.into(db.currencyValues).insert(CurrencyValuesCompanion.insert(
              characterId: id,
              currencyDefId: e.key,
              amount: Value(e.value),
            ));
      }
      await (db.delete(db.skillValues)..where((v) => v.characterId.equals(id))).go();
      for (final e in skillValues.entries) {
        await db.into(db.skillValues).insert(SkillValuesCompanion.insert(
              characterId: id,
              skillDefId: e.key,
              value: Value(e.value.value),
              proficient: Value(e.value.proficient),
            ));
      }
      await (db.delete(db.inventoryItems)..where((i) => i.characterId.equals(id))).go();
      for (var i = 0; i < inventory.length; i++) {
        final it = inventory[i];
        await db.into(db.inventoryItems).insert(InventoryItemsCompanion.insert(
              id: it.id,
              characterId: id,
              name: it.name,
              quality: Value(it.quality),
              quantity: Value(it.quantity),
              description: Value(it.description),
              equipped: Value(it.equipped),
              category: Value(it.category),
              weight: Value(it.weight),
              itemValue: Value(it.value),
              orderIndex: i,
            ));
      }
    });
  }

  Future<void> deleteCharacter(String id) async {
    final c = await (db.select(db.characters)..where((c) => c.id.equals(id)))
        .getSingleOrNull();
    if (c?.imagePath != null) {
      final f = File(c!.imagePath!);
      if (await f.exists()) await f.delete();
    }
    await (db.delete(db.characters)..where((c) => c.id.equals(id))).go();
  }

  Future<String> duplicateCharacter(String id) async {
    final full = await getCharacterFull(id);
    if (full == null) throw StateError('Character not found');
    final newId = _uuid.v4();
    await db.transaction(() async {
      await db.into(db.characters).insert(CharactersCompanion.insert(
            id: newId,
            universeId: full.universe.id,
            name: '${full.character.name} (Copy)',
            race: Value(full.character.race),
            level: Value(full.character.level),
            backstory: Value(full.character.backstory),
            imagePath: Value(full.character.imagePath),
            status: Value(full.character.status),
            notes: Value(full.character.notes),
          ));
      for (var i = 0; i < full.classes.length; i++) {
        await db.into(db.characterClasses).insert(CharacterClassesCompanion.insert(
              id: _uuid.v4(),
              characterId: newId,
              className: full.classes[i].className,
              classLevel: Value(full.classes[i].classLevel),
              orderIndex: i,
            ));
      }
      for (final e in full.statValues.entries) {
        await db.into(db.statValues).insert(StatValuesCompanion.insert(
              characterId: newId,
              statDefId: e.key,
              value: Value(e.value),
            ));
      }
      for (final e in full.resourceValues.entries) {
        await db.into(db.resourceValues).insert(ResourceValuesCompanion.insert(
              characterId: newId,
              resourceDefId: e.key,
              current: Value(e.value.current),
              maximum: Value(e.value.maximum),
            ));
      }
      for (final e in full.currencyValues.entries) {
        await db.into(db.currencyValues).insert(CurrencyValuesCompanion.insert(
              characterId: newId,
              currencyDefId: e.key,
              amount: Value(e.value),
            ));
      }
      for (final e in full.skillValues.entries) {
        await db.into(db.skillValues).insert(SkillValuesCompanion.insert(
              characterId: newId,
              skillDefId: e.key,
              value: Value(e.value.value),
              proficient: Value(e.value.proficient),
            ));
      }
      for (var i = 0; i < full.inventory.length; i++) {
        final it = full.inventory[i];
        await db.into(db.inventoryItems).insert(InventoryItemsCompanion.insert(
              id: _uuid.v4(),
              characterId: newId,
              name: it.name,
              quality: Value(it.quality),
              quantity: Value(it.quantity),
              description: Value(it.description),
              equipped: Value(it.equipped),
              category: Value(it.category),
              weight: Value(it.weight),
              itemValue: Value(it.itemValue),
              orderIndex: i,
            ));
      }
    });
    return newId;
  }

  // ---- Import / Export ----

  Future<String> exportUniverseToJson(String id) async {
    final u = await getUniverseWithDefs(id);
    if (u == null) throw StateError('Universe not found');
    final data = {
      'schema': 1,
      'name': u.universe.name,
      'playGroup': u.universe.playGroup,
      'stats': u.stats
          .map((s) => {'name': s.name, 'abbreviation': s.abbreviation})
          .toList(),
      'resourceTracks': u.resourceTracks.map((t) => t.name).toList(),
      'currencies': u.currencies.map((c) => c.name).toList(),
      'skills': u.skills.map((s) {
        String? linkedAbbr;
        if (s.linkedStatId != null) {
          final m = u.stats.where((x) => x.id == s.linkedStatId);
          if (m.isNotEmpty) linkedAbbr = m.first.abbreviation;
        }
        return {'name': s.name, 'linkedStatAbbr': linkedAbbr};
      }).toList(),
    };
    return const JsonEncoder.withIndent('  ').convert(data);
  }

  Future<String> importUniverseFromJson(String jsonStr) async {
    final raw = json.decode(jsonStr) as Map<String, dynamic>;
    final draft = UniverseDraft(
      name: (raw['name'] as String?) ?? 'Imported Universe',
      playGroup: (raw['playGroup'] as String?) ?? '',
    );
    final stats = (raw['stats'] as List?) ?? const [];
    final abbrToId = <String, String>{};
    for (final s in stats) {
      final m = s as Map<String, dynamic>;
      final d = StatDraft(
        name: (m['name'] as String?) ?? '',
        abbreviation: (m['abbreviation'] as String?) ?? '',
      );
      draft.stats.add(d);
      if (d.abbreviation.isNotEmpty) abbrToId[d.abbreviation] = d.id;
    }
    for (final t in (raw['resourceTracks'] as List?) ?? const []) {
      draft.tracks.add(TrackDraft(name: t as String));
    }
    for (final c in (raw['currencies'] as List?) ?? const []) {
      draft.currencies.add(TrackDraft(name: c as String));
    }
    for (final s in (raw['skills'] as List?) ?? const []) {
      final m = s as Map<String, dynamic>;
      final linkedAbbr = m['linkedStatAbbr'] as String?;
      draft.skills.add(SkillDraft(
        name: (m['name'] as String?) ?? '',
        linkedStatId: linkedAbbr != null ? abbrToId[linkedAbbr] : null,
      ));
    }
    return createUniverseFromDraft(draft);
  }
}

class InventoryItemEntry {
  final String id;
  final String name;
  final String quality;
  final int quantity;
  final String description;
  final bool equipped;
  final String category;
  final double weight;
  final double value;

  const InventoryItemEntry({
    required this.id,
    required this.name,
    this.quality = '',
    this.quantity = 1,
    this.description = '',
    this.equipped = false,
    this.category = '',
    this.weight = 0,
    this.value = 0,
  });
}
