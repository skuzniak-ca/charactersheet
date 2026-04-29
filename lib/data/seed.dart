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
  _SeedUniverse(
    name: 'Call of Cthulhu 7e',
    stats: [
      _SeedStat('Strength', 'STR'),
      _SeedStat('Constitution', 'CON'),
      _SeedStat('Size', 'SIZ'),
      _SeedStat('Dexterity', 'DEX'),
      _SeedStat('Appearance', 'APP'),
      _SeedStat('Intelligence', 'INT'),
      _SeedStat('Power', 'POW'),
      _SeedStat('Education', 'EDU'),
    ],
    resourceTracks: ['Hit Points', 'Sanity', 'Magic Points', 'Luck'],
    currencies: ['Cash'],
    skills: [
      _SeedSkill('Accounting', 'EDU'),
      _SeedSkill('Anthropology', 'EDU'),
      _SeedSkill('Appraise', 'EDU'),
      _SeedSkill('Archaeology', 'EDU'),
      _SeedSkill('Charm', 'APP'),
      _SeedSkill('Climb', 'STR'),
      _SeedSkill('Credit Rating', 'APP'),
      _SeedSkill('Cthulhu Mythos', 'INT'),
      _SeedSkill('Disguise', 'APP'),
      _SeedSkill('Dodge', 'DEX'),
      _SeedSkill('Drive Auto', 'DEX'),
      _SeedSkill('Fast Talk', 'APP'),
      _SeedSkill('First Aid', 'DEX'),
      _SeedSkill('History', 'EDU'),
      _SeedSkill('Intimidate', 'POW'),
      _SeedSkill('Jump', 'STR'),
      _SeedSkill('Law', 'EDU'),
      _SeedSkill('Library Use', 'EDU'),
      _SeedSkill('Listen', 'POW'),
      _SeedSkill('Locksmith', 'DEX'),
      _SeedSkill('Mechanical Repair', 'DEX'),
      _SeedSkill('Medicine', 'EDU'),
      _SeedSkill('Natural World', 'EDU'),
      _SeedSkill('Navigate', 'INT'),
      _SeedSkill('Occult', 'EDU'),
      _SeedSkill('Persuade', 'APP'),
      _SeedSkill('Psychology', 'INT'),
      _SeedSkill('Ride', 'DEX'),
      _SeedSkill('Sleight of Hand', 'DEX'),
      _SeedSkill('Spot Hidden', 'POW'),
      _SeedSkill('Stealth', 'DEX'),
      _SeedSkill('Survival', 'INT'),
      _SeedSkill('Swim', 'STR'),
      _SeedSkill('Throw', 'DEX'),
      _SeedSkill('Track', 'INT'),
    ],
  ),
  _SeedUniverse(
    name: 'Vampire: The Masquerade 5e',
    stats: [
      _SeedStat('Strength', 'STR'),
      _SeedStat('Dexterity', 'DEX'),
      _SeedStat('Stamina', 'STA'),
      _SeedStat('Charisma', 'CHA'),
      _SeedStat('Manipulation', 'MAN'),
      _SeedStat('Composure', 'COM'),
      _SeedStat('Intelligence', 'INT'),
      _SeedStat('Wits', 'WIT'),
      _SeedStat('Resolve', 'RES'),
    ],
    resourceTracks: ['Health', 'Willpower', 'Hunger', 'Humanity'],
    currencies: [],
    skills: [
      _SeedSkill('Athletics', 'DEX'),
      _SeedSkill('Brawl', 'STR'),
      _SeedSkill('Craft', 'DEX'),
      _SeedSkill('Drive', 'DEX'),
      _SeedSkill('Firearms', 'DEX'),
      _SeedSkill('Larceny', 'DEX'),
      _SeedSkill('Melee', 'DEX'),
      _SeedSkill('Stealth', 'DEX'),
      _SeedSkill('Survival', 'WIT'),
      _SeedSkill('Animal Ken', 'COM'),
      _SeedSkill('Etiquette', 'COM'),
      _SeedSkill('Insight', 'WIT'),
      _SeedSkill('Intimidation', 'CHA'),
      _SeedSkill('Leadership', 'CHA'),
      _SeedSkill('Performance', 'CHA'),
      _SeedSkill('Persuasion', 'CHA'),
      _SeedSkill('Streetwise', 'MAN'),
      _SeedSkill('Subterfuge', 'MAN'),
      _SeedSkill('Academics', 'INT'),
      _SeedSkill('Awareness', 'WIT'),
      _SeedSkill('Finance', 'INT'),
      _SeedSkill('Investigation', 'INT'),
      _SeedSkill('Medicine', 'INT'),
      _SeedSkill('Occult', 'INT'),
      _SeedSkill('Politics', 'INT'),
      _SeedSkill('Science', 'INT'),
      _SeedSkill('Technology', 'INT'),
    ],
  ),
  _SeedUniverse(
    name: 'Cyberpunk RED',
    stats: [
      _SeedStat('Intelligence', 'INT'),
      _SeedStat('Reflexes', 'REF'),
      _SeedStat('Dexterity', 'DEX'),
      _SeedStat('Technique', 'TECH'),
      _SeedStat('Cool', 'COOL'),
      _SeedStat('Willpower', 'WILL'),
      _SeedStat('Luck', 'LUCK'),
      _SeedStat('Movement', 'MOVE'),
      _SeedStat('Body', 'BODY'),
      _SeedStat('Empathy', 'EMP'),
    ],
    resourceTracks: ['Hit Points', 'Humanity'],
    currencies: ['Eurodollars'],
    skills: [
      _SeedSkill('Athletics', 'DEX'),
      _SeedSkill('Brawling', 'DEX'),
      _SeedSkill('Concentration', 'WILL'),
      _SeedSkill('Conversation', 'EMP'),
      _SeedSkill('Education', 'INT'),
      _SeedSkill('Endurance', 'WILL'),
      _SeedSkill('Evasion', 'DEX'),
      _SeedSkill('First Aid', 'TECH'),
      _SeedSkill('Human Perception', 'EMP'),
      _SeedSkill('Local Expert', 'INT'),
      _SeedSkill('Perception', 'INT'),
      _SeedSkill('Persuasion', 'COOL'),
      _SeedSkill('Stealth', 'DEX'),
      _SeedSkill('Drive Land Vehicle', 'REF'),
      _SeedSkill('Handgun', 'REF'),
      _SeedSkill('Heavy Weapons', 'REF'),
      _SeedSkill('Shoulder Arms', 'REF'),
      _SeedSkill('Melee Weapon', 'DEX'),
      _SeedSkill('Pilot Air Vehicle', 'REF'),
      _SeedSkill('Cyberdeck Operation', 'INT'),
      _SeedSkill('Electronics/Security Tech', 'TECH'),
      _SeedSkill('Paramedic', 'TECH'),
      _SeedSkill('Wilderness Survival', 'INT'),
    ],
  ),
  _SeedUniverse(
    name: 'Star Wars (Genesys/FFG)',
    stats: [
      _SeedStat('Brawn', 'BR'),
      _SeedStat('Agility', 'AG'),
      _SeedStat('Intellect', 'INT'),
      _SeedStat('Cunning', 'CUN'),
      _SeedStat('Willpower', 'WIL'),
      _SeedStat('Presence', 'PR'),
    ],
    resourceTracks: ['Wound Threshold', 'Strain Threshold'],
    currencies: ['Credits'],
    skills: [
      _SeedSkill('Astrogation', 'INT'),
      _SeedSkill('Athletics', 'BR'),
      _SeedSkill('Charm', 'PR'),
      _SeedSkill('Coercion', 'WIL'),
      _SeedSkill('Computers', 'INT'),
      _SeedSkill('Cool', 'PR'),
      _SeedSkill('Coordination', 'AG'),
      _SeedSkill('Deception', 'CUN'),
      _SeedSkill('Discipline', 'WIL'),
      _SeedSkill('Leadership', 'PR'),
      _SeedSkill('Mechanics', 'INT'),
      _SeedSkill('Medicine', 'INT'),
      _SeedSkill('Negotiation', 'PR'),
      _SeedSkill('Perception', 'CUN'),
      _SeedSkill('Piloting (Planetary)', 'AG'),
      _SeedSkill('Piloting (Space)', 'AG'),
      _SeedSkill('Resilience', 'BR'),
      _SeedSkill('Skulduggery', 'CUN'),
      _SeedSkill('Stealth', 'AG'),
      _SeedSkill('Streetwise', 'CUN'),
      _SeedSkill('Survival', 'CUN'),
      _SeedSkill('Vigilance', 'WIL'),
    ],
  ),
  _SeedUniverse(
    name: 'Fate Core',
    stats: [],
    resourceTracks: ['Physical Stress', 'Mental Stress', 'Fate Points'],
    currencies: [],
    skills: [
      _SeedSkill('Athletics'),
      _SeedSkill('Burglary'),
      _SeedSkill('Contacts'),
      _SeedSkill('Crafts'),
      _SeedSkill('Deceive'),
      _SeedSkill('Drive'),
      _SeedSkill('Empathy'),
      _SeedSkill('Fight'),
      _SeedSkill('Investigate'),
      _SeedSkill('Lore'),
      _SeedSkill('Notice'),
      _SeedSkill('Physique'),
      _SeedSkill('Provoke'),
      _SeedSkill('Rapport'),
      _SeedSkill('Resources'),
      _SeedSkill('Shoot'),
      _SeedSkill('Stealth'),
      _SeedSkill('Will'),
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
