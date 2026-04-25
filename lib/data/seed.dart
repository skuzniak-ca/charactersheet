import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import 'database.dart';

const _uuid = Uuid();

class _SeedStat {
  final String name;
  final String abbr;
  const _SeedStat(this.name, this.abbr);
}

class _SeedSkill {
  final String name;
  final String? linkedStatAbbr;
  const _SeedSkill(this.name, [this.linkedStatAbbr]);
}

class _SeedUniverse {
  final String name;
  final String playGroup;
  final List<_SeedStat> stats;
  final List<String> resourceTracks;
  final List<String> currencies;
  final List<_SeedSkill> skills;

  const _SeedUniverse({
    required this.name,
    required this.stats,
    required this.resourceTracks,
    required this.currencies,
    required this.skills,
  }) : playGroup = '';
}

const _seedUniverses = <_SeedUniverse>[
  _SeedUniverse(
    name: 'Dungeons & Dragons 5e',
    stats: [
      _SeedStat('Strength', 'STR'),
      _SeedStat('Dexterity', 'DEX'),
      _SeedStat('Constitution', 'CON'),
      _SeedStat('Intelligence', 'INT'),
      _SeedStat('Wisdom', 'WIS'),
      _SeedStat('Charisma', 'CHA'),
    ],
    resourceTracks: ['Hit Points'],
    currencies: ['Copper', 'Silver', 'Electrum', 'Gold', 'Platinum'],
    skills: [
      _SeedSkill('Acrobatics', 'DEX'),
      _SeedSkill('Animal Handling', 'WIS'),
      _SeedSkill('Arcana', 'INT'),
      _SeedSkill('Athletics', 'STR'),
      _SeedSkill('Deception', 'CHA'),
      _SeedSkill('History', 'INT'),
      _SeedSkill('Insight', 'WIS'),
      _SeedSkill('Intimidation', 'CHA'),
      _SeedSkill('Investigation', 'INT'),
      _SeedSkill('Medicine', 'WIS'),
      _SeedSkill('Nature', 'INT'),
      _SeedSkill('Perception', 'WIS'),
      _SeedSkill('Performance', 'CHA'),
      _SeedSkill('Persuasion', 'CHA'),
      _SeedSkill('Religion', 'INT'),
      _SeedSkill('Sleight of Hand', 'DEX'),
      _SeedSkill('Stealth', 'DEX'),
      _SeedSkill('Survival', 'WIS'),
    ],
  ),
  _SeedUniverse(
    name: 'Pathfinder 2e',
    stats: [
      _SeedStat('Strength', 'STR'),
      _SeedStat('Dexterity', 'DEX'),
      _SeedStat('Constitution', 'CON'),
      _SeedStat('Intelligence', 'INT'),
      _SeedStat('Wisdom', 'WIS'),
      _SeedStat('Charisma', 'CHA'),
    ],
    resourceTracks: ['Hit Points'],
    currencies: ['Copper', 'Silver', 'Gold', 'Platinum'],
    skills: [
      _SeedSkill('Acrobatics', 'DEX'),
      _SeedSkill('Arcana', 'INT'),
      _SeedSkill('Athletics', 'STR'),
      _SeedSkill('Crafting', 'INT'),
      _SeedSkill('Deception', 'CHA'),
      _SeedSkill('Diplomacy', 'CHA'),
      _SeedSkill('Intimidation', 'CHA'),
      _SeedSkill('Medicine', 'WIS'),
      _SeedSkill('Nature', 'WIS'),
      _SeedSkill('Occultism', 'INT'),
      _SeedSkill('Performance', 'CHA'),
      _SeedSkill('Religion', 'WIS'),
      _SeedSkill('Society', 'INT'),
      _SeedSkill('Stealth', 'DEX'),
      _SeedSkill('Survival', 'WIS'),
      _SeedSkill('Thievery', 'DEX'),
    ],
  ),
];

Future<void> seedDefaultUniversesIfEmpty(AppDatabase db) async {
  final existing = await db.select(db.universes).get();
  if (existing.isNotEmpty) return;
  for (final s in _seedUniverses) {
    await _createUniverseFromSeed(db, s);
  }
}

Future<void> _createUniverseFromSeed(AppDatabase db, _SeedUniverse s) async {
  final universeId = _uuid.v4();
  await db.transaction(() async {
    await db.into(db.universes).insert(UniversesCompanion.insert(
          id: universeId,
          name: s.name,
          playGroup: Value(s.playGroup),
        ));

    final statIdByAbbr = <String, String>{};
    for (var i = 0; i < s.stats.length; i++) {
      final id = _uuid.v4();
      await db.into(db.statDefs).insert(StatDefsCompanion.insert(
            id: id,
            universeId: universeId,
            name: s.stats[i].name,
            abbreviation: Value(s.stats[i].abbr),
            orderIndex: i,
          ));
      statIdByAbbr[s.stats[i].abbr] = id;
    }

    for (var i = 0; i < s.resourceTracks.length; i++) {
      await db.into(db.resourceTrackDefs).insert(ResourceTrackDefsCompanion.insert(
            id: _uuid.v4(),
            universeId: universeId,
            name: s.resourceTracks[i],
            orderIndex: i,
          ));
    }

    for (var i = 0; i < s.currencies.length; i++) {
      await db.into(db.currencyDefs).insert(CurrencyDefsCompanion.insert(
            id: _uuid.v4(),
            universeId: universeId,
            name: s.currencies[i],
            orderIndex: i,
          ));
    }

    for (var i = 0; i < s.skills.length; i++) {
      final linked = s.skills[i].linkedStatAbbr;
      await db.into(db.skillDefs).insert(SkillDefsCompanion.insert(
            id: _uuid.v4(),
            universeId: universeId,
            name: s.skills[i].name,
            linkedStatId: linked != null ? Value(statIdByAbbr[linked]) : const Value(null),
            orderIndex: i,
          ));
    }
  });
}
