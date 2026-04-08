import 'package:drift/drift.dart';

class Universes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get playGroup => text().withDefault(const Constant(''))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class StatDefs extends Table {
  TextColumn get id => text()();
  TextColumn get universeId =>
      text().references(Universes, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get abbreviation => text().withDefault(const Constant(''))();
  IntColumn get orderIndex => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class ResourceTrackDefs extends Table {
  TextColumn get id => text()();
  TextColumn get universeId =>
      text().references(Universes, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  IntColumn get orderIndex => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class CurrencyDefs extends Table {
  TextColumn get id => text()();
  TextColumn get universeId =>
      text().references(Universes, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  IntColumn get orderIndex => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class SkillDefs extends Table {
  TextColumn get id => text()();
  TextColumn get universeId =>
      text().references(Universes, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get linkedStatId => text().nullable()();
  IntColumn get orderIndex => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class Characters extends Table {
  TextColumn get id => text()();
  TextColumn get universeId =>
      text().references(Universes, #id, onDelete: KeyAction.restrict)();
  TextColumn get name => text()();
  TextColumn get race => text().withDefault(const Constant(''))();
  IntColumn get level => integer().withDefault(const Constant(1))();
  TextColumn get backstory => text().withDefault(const Constant(''))();
  TextColumn get imagePath => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('CharacterClass')
class CharacterClasses extends Table {
  TextColumn get id => text()();
  TextColumn get characterId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  TextColumn get className => text()();
  IntColumn get classLevel => integer().withDefault(const Constant(1))();
  IntColumn get orderIndex => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class StatValues extends Table {
  TextColumn get characterId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  TextColumn get statDefId =>
      text().references(StatDefs, #id, onDelete: KeyAction.cascade)();
  IntColumn get value => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {characterId, statDefId};
}

class ResourceValues extends Table {
  TextColumn get characterId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  TextColumn get resourceDefId =>
      text().references(ResourceTrackDefs, #id, onDelete: KeyAction.cascade)();
  IntColumn get current => integer().withDefault(const Constant(0))();
  IntColumn get maximum => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {characterId, resourceDefId};
}

class CurrencyValues extends Table {
  TextColumn get characterId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  TextColumn get currencyDefId =>
      text().references(CurrencyDefs, #id, onDelete: KeyAction.cascade)();
  IntColumn get amount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {characterId, currencyDefId};
}

class SkillValues extends Table {
  TextColumn get characterId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  TextColumn get skillDefId =>
      text().references(SkillDefs, #id, onDelete: KeyAction.cascade)();
  IntColumn get value => integer().withDefault(const Constant(0))();
  BoolColumn get proficient => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {characterId, skillDefId};
}

class InventoryItems extends Table {
  TextColumn get id => text()();
  TextColumn get characterId =>
      text().references(Characters, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  TextColumn get quality => text().withDefault(const Constant(''))();
  IntColumn get quantity => integer().withDefault(const Constant(1))();
  TextColumn get description => text().withDefault(const Constant(''))();
  BoolColumn get equipped => boolean().withDefault(const Constant(false))();
  TextColumn get category => text().withDefault(const Constant(''))();
  RealColumn get weight => real().withDefault(const Constant(0))();
  RealColumn get itemValue => real().withDefault(const Constant(0))();
  IntColumn get orderIndex => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
