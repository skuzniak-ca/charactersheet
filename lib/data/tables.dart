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
