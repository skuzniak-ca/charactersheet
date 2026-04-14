// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UniversesTable extends Universes
    with TableInfo<$UniversesTable, Universe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UniversesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _playGroupMeta = const VerificationMeta(
    'playGroup',
  );
  @override
  late final GeneratedColumn<String> playGroup = GeneratedColumn<String>(
    'play_group',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isArchivedMeta = const VerificationMeta(
    'isArchived',
  );
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
    'is_archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    playGroup,
    isArchived,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'universes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Universe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('play_group')) {
      context.handle(
        _playGroupMeta,
        playGroup.isAcceptableOrUnknown(data['play_group']!, _playGroupMeta),
      );
    }
    if (data.containsKey('is_archived')) {
      context.handle(
        _isArchivedMeta,
        isArchived.isAcceptableOrUnknown(data['is_archived']!, _isArchivedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Universe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Universe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      playGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}play_group'],
      )!,
      isArchived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_archived'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UniversesTable createAlias(String alias) {
    return $UniversesTable(attachedDatabase, alias);
  }
}

class Universe extends DataClass implements Insertable<Universe> {
  final String id;
  final String name;
  final String playGroup;
  final bool isArchived;
  final DateTime createdAt;
  const Universe({
    required this.id,
    required this.name,
    required this.playGroup,
    required this.isArchived,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['play_group'] = Variable<String>(playGroup);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UniversesCompanion toCompanion(bool nullToAbsent) {
    return UniversesCompanion(
      id: Value(id),
      name: Value(name),
      playGroup: Value(playGroup),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
    );
  }

  factory Universe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Universe(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      playGroup: serializer.fromJson<String>(json['playGroup']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'playGroup': serializer.toJson<String>(playGroup),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Universe copyWith({
    String? id,
    String? name,
    String? playGroup,
    bool? isArchived,
    DateTime? createdAt,
  }) => Universe(
    id: id ?? this.id,
    name: name ?? this.name,
    playGroup: playGroup ?? this.playGroup,
    isArchived: isArchived ?? this.isArchived,
    createdAt: createdAt ?? this.createdAt,
  );
  Universe copyWithCompanion(UniversesCompanion data) {
    return Universe(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      playGroup: data.playGroup.present ? data.playGroup.value : this.playGroup,
      isArchived: data.isArchived.present
          ? data.isArchived.value
          : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Universe(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('playGroup: $playGroup, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, playGroup, isArchived, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Universe &&
          other.id == this.id &&
          other.name == this.name &&
          other.playGroup == this.playGroup &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt);
}

class UniversesCompanion extends UpdateCompanion<Universe> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> playGroup;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const UniversesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.playGroup = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UniversesCompanion.insert({
    required String id,
    required String name,
    this.playGroup = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Universe> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? playGroup,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (playGroup != null) 'play_group': playGroup,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UniversesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? playGroup,
    Value<bool>? isArchived,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return UniversesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      playGroup: playGroup ?? this.playGroup,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (playGroup.present) {
      map['play_group'] = Variable<String>(playGroup.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UniversesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('playGroup: $playGroup, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StatDefsTable extends StatDefs with TableInfo<$StatDefsTable, StatDef> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatDefsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _universeIdMeta = const VerificationMeta(
    'universeId',
  );
  @override
  late final GeneratedColumn<String> universeId = GeneratedColumn<String>(
    'universe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES universes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _abbreviationMeta = const VerificationMeta(
    'abbreviation',
  );
  @override
  late final GeneratedColumn<String> abbreviation = GeneratedColumn<String>(
    'abbreviation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    universeId,
    name,
    abbreviation,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stat_defs';
  @override
  VerificationContext validateIntegrity(
    Insertable<StatDef> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('universe_id')) {
      context.handle(
        _universeIdMeta,
        universeId.isAcceptableOrUnknown(data['universe_id']!, _universeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_universeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('abbreviation')) {
      context.handle(
        _abbreviationMeta,
        abbreviation.isAcceptableOrUnknown(
          data['abbreviation']!,
          _abbreviationMeta,
        ),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StatDef map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StatDef(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      universeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}universe_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      abbreviation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}abbreviation'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $StatDefsTable createAlias(String alias) {
    return $StatDefsTable(attachedDatabase, alias);
  }
}

class StatDef extends DataClass implements Insertable<StatDef> {
  final String id;
  final String universeId;
  final String name;
  final String abbreviation;
  final int orderIndex;
  const StatDef({
    required this.id,
    required this.universeId,
    required this.name,
    required this.abbreviation,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['universe_id'] = Variable<String>(universeId);
    map['name'] = Variable<String>(name);
    map['abbreviation'] = Variable<String>(abbreviation);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  StatDefsCompanion toCompanion(bool nullToAbsent) {
    return StatDefsCompanion(
      id: Value(id),
      universeId: Value(universeId),
      name: Value(name),
      abbreviation: Value(abbreviation),
      orderIndex: Value(orderIndex),
    );
  }

  factory StatDef.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatDef(
      id: serializer.fromJson<String>(json['id']),
      universeId: serializer.fromJson<String>(json['universeId']),
      name: serializer.fromJson<String>(json['name']),
      abbreviation: serializer.fromJson<String>(json['abbreviation']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'universeId': serializer.toJson<String>(universeId),
      'name': serializer.toJson<String>(name),
      'abbreviation': serializer.toJson<String>(abbreviation),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  StatDef copyWith({
    String? id,
    String? universeId,
    String? name,
    String? abbreviation,
    int? orderIndex,
  }) => StatDef(
    id: id ?? this.id,
    universeId: universeId ?? this.universeId,
    name: name ?? this.name,
    abbreviation: abbreviation ?? this.abbreviation,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  StatDef copyWithCompanion(StatDefsCompanion data) {
    return StatDef(
      id: data.id.present ? data.id.value : this.id,
      universeId: data.universeId.present
          ? data.universeId.value
          : this.universeId,
      name: data.name.present ? data.name.value : this.name,
      abbreviation: data.abbreviation.present
          ? data.abbreviation.value
          : this.abbreviation,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StatDef(')
          ..write('id: $id, ')
          ..write('universeId: $universeId, ')
          ..write('name: $name, ')
          ..write('abbreviation: $abbreviation, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, universeId, name, abbreviation, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatDef &&
          other.id == this.id &&
          other.universeId == this.universeId &&
          other.name == this.name &&
          other.abbreviation == this.abbreviation &&
          other.orderIndex == this.orderIndex);
}

class StatDefsCompanion extends UpdateCompanion<StatDef> {
  final Value<String> id;
  final Value<String> universeId;
  final Value<String> name;
  final Value<String> abbreviation;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const StatDefsCompanion({
    this.id = const Value.absent(),
    this.universeId = const Value.absent(),
    this.name = const Value.absent(),
    this.abbreviation = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StatDefsCompanion.insert({
    required String id,
    required String universeId,
    required String name,
    this.abbreviation = const Value.absent(),
    required int orderIndex,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       universeId = Value(universeId),
       name = Value(name),
       orderIndex = Value(orderIndex);
  static Insertable<StatDef> custom({
    Expression<String>? id,
    Expression<String>? universeId,
    Expression<String>? name,
    Expression<String>? abbreviation,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (universeId != null) 'universe_id': universeId,
      if (name != null) 'name': name,
      if (abbreviation != null) 'abbreviation': abbreviation,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StatDefsCompanion copyWith({
    Value<String>? id,
    Value<String>? universeId,
    Value<String>? name,
    Value<String>? abbreviation,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return StatDefsCompanion(
      id: id ?? this.id,
      universeId: universeId ?? this.universeId,
      name: name ?? this.name,
      abbreviation: abbreviation ?? this.abbreviation,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (universeId.present) {
      map['universe_id'] = Variable<String>(universeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (abbreviation.present) {
      map['abbreviation'] = Variable<String>(abbreviation.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatDefsCompanion(')
          ..write('id: $id, ')
          ..write('universeId: $universeId, ')
          ..write('name: $name, ')
          ..write('abbreviation: $abbreviation, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ResourceTrackDefsTable extends ResourceTrackDefs
    with TableInfo<$ResourceTrackDefsTable, ResourceTrackDef> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResourceTrackDefsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _universeIdMeta = const VerificationMeta(
    'universeId',
  );
  @override
  late final GeneratedColumn<String> universeId = GeneratedColumn<String>(
    'universe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES universes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, universeId, name, orderIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'resource_track_defs';
  @override
  VerificationContext validateIntegrity(
    Insertable<ResourceTrackDef> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('universe_id')) {
      context.handle(
        _universeIdMeta,
        universeId.isAcceptableOrUnknown(data['universe_id']!, _universeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_universeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ResourceTrackDef map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResourceTrackDef(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      universeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}universe_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $ResourceTrackDefsTable createAlias(String alias) {
    return $ResourceTrackDefsTable(attachedDatabase, alias);
  }
}

class ResourceTrackDef extends DataClass
    implements Insertable<ResourceTrackDef> {
  final String id;
  final String universeId;
  final String name;
  final int orderIndex;
  const ResourceTrackDef({
    required this.id,
    required this.universeId,
    required this.name,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['universe_id'] = Variable<String>(universeId);
    map['name'] = Variable<String>(name);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  ResourceTrackDefsCompanion toCompanion(bool nullToAbsent) {
    return ResourceTrackDefsCompanion(
      id: Value(id),
      universeId: Value(universeId),
      name: Value(name),
      orderIndex: Value(orderIndex),
    );
  }

  factory ResourceTrackDef.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResourceTrackDef(
      id: serializer.fromJson<String>(json['id']),
      universeId: serializer.fromJson<String>(json['universeId']),
      name: serializer.fromJson<String>(json['name']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'universeId': serializer.toJson<String>(universeId),
      'name': serializer.toJson<String>(name),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  ResourceTrackDef copyWith({
    String? id,
    String? universeId,
    String? name,
    int? orderIndex,
  }) => ResourceTrackDef(
    id: id ?? this.id,
    universeId: universeId ?? this.universeId,
    name: name ?? this.name,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  ResourceTrackDef copyWithCompanion(ResourceTrackDefsCompanion data) {
    return ResourceTrackDef(
      id: data.id.present ? data.id.value : this.id,
      universeId: data.universeId.present
          ? data.universeId.value
          : this.universeId,
      name: data.name.present ? data.name.value : this.name,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ResourceTrackDef(')
          ..write('id: $id, ')
          ..write('universeId: $universeId, ')
          ..write('name: $name, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, universeId, name, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResourceTrackDef &&
          other.id == this.id &&
          other.universeId == this.universeId &&
          other.name == this.name &&
          other.orderIndex == this.orderIndex);
}

class ResourceTrackDefsCompanion extends UpdateCompanion<ResourceTrackDef> {
  final Value<String> id;
  final Value<String> universeId;
  final Value<String> name;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const ResourceTrackDefsCompanion({
    this.id = const Value.absent(),
    this.universeId = const Value.absent(),
    this.name = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ResourceTrackDefsCompanion.insert({
    required String id,
    required String universeId,
    required String name,
    required int orderIndex,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       universeId = Value(universeId),
       name = Value(name),
       orderIndex = Value(orderIndex);
  static Insertable<ResourceTrackDef> custom({
    Expression<String>? id,
    Expression<String>? universeId,
    Expression<String>? name,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (universeId != null) 'universe_id': universeId,
      if (name != null) 'name': name,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ResourceTrackDefsCompanion copyWith({
    Value<String>? id,
    Value<String>? universeId,
    Value<String>? name,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return ResourceTrackDefsCompanion(
      id: id ?? this.id,
      universeId: universeId ?? this.universeId,
      name: name ?? this.name,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (universeId.present) {
      map['universe_id'] = Variable<String>(universeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResourceTrackDefsCompanion(')
          ..write('id: $id, ')
          ..write('universeId: $universeId, ')
          ..write('name: $name, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CurrencyDefsTable extends CurrencyDefs
    with TableInfo<$CurrencyDefsTable, CurrencyDef> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyDefsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _universeIdMeta = const VerificationMeta(
    'universeId',
  );
  @override
  late final GeneratedColumn<String> universeId = GeneratedColumn<String>(
    'universe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES universes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, universeId, name, orderIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currency_defs';
  @override
  VerificationContext validateIntegrity(
    Insertable<CurrencyDef> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('universe_id')) {
      context.handle(
        _universeIdMeta,
        universeId.isAcceptableOrUnknown(data['universe_id']!, _universeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_universeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CurrencyDef map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyDef(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      universeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}universe_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $CurrencyDefsTable createAlias(String alias) {
    return $CurrencyDefsTable(attachedDatabase, alias);
  }
}

class CurrencyDef extends DataClass implements Insertable<CurrencyDef> {
  final String id;
  final String universeId;
  final String name;
  final int orderIndex;
  const CurrencyDef({
    required this.id,
    required this.universeId,
    required this.name,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['universe_id'] = Variable<String>(universeId);
    map['name'] = Variable<String>(name);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  CurrencyDefsCompanion toCompanion(bool nullToAbsent) {
    return CurrencyDefsCompanion(
      id: Value(id),
      universeId: Value(universeId),
      name: Value(name),
      orderIndex: Value(orderIndex),
    );
  }

  factory CurrencyDef.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyDef(
      id: serializer.fromJson<String>(json['id']),
      universeId: serializer.fromJson<String>(json['universeId']),
      name: serializer.fromJson<String>(json['name']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'universeId': serializer.toJson<String>(universeId),
      'name': serializer.toJson<String>(name),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  CurrencyDef copyWith({
    String? id,
    String? universeId,
    String? name,
    int? orderIndex,
  }) => CurrencyDef(
    id: id ?? this.id,
    universeId: universeId ?? this.universeId,
    name: name ?? this.name,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  CurrencyDef copyWithCompanion(CurrencyDefsCompanion data) {
    return CurrencyDef(
      id: data.id.present ? data.id.value : this.id,
      universeId: data.universeId.present
          ? data.universeId.value
          : this.universeId,
      name: data.name.present ? data.name.value : this.name,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyDef(')
          ..write('id: $id, ')
          ..write('universeId: $universeId, ')
          ..write('name: $name, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, universeId, name, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyDef &&
          other.id == this.id &&
          other.universeId == this.universeId &&
          other.name == this.name &&
          other.orderIndex == this.orderIndex);
}

class CurrencyDefsCompanion extends UpdateCompanion<CurrencyDef> {
  final Value<String> id;
  final Value<String> universeId;
  final Value<String> name;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const CurrencyDefsCompanion({
    this.id = const Value.absent(),
    this.universeId = const Value.absent(),
    this.name = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrencyDefsCompanion.insert({
    required String id,
    required String universeId,
    required String name,
    required int orderIndex,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       universeId = Value(universeId),
       name = Value(name),
       orderIndex = Value(orderIndex);
  static Insertable<CurrencyDef> custom({
    Expression<String>? id,
    Expression<String>? universeId,
    Expression<String>? name,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (universeId != null) 'universe_id': universeId,
      if (name != null) 'name': name,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrencyDefsCompanion copyWith({
    Value<String>? id,
    Value<String>? universeId,
    Value<String>? name,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return CurrencyDefsCompanion(
      id: id ?? this.id,
      universeId: universeId ?? this.universeId,
      name: name ?? this.name,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (universeId.present) {
      map['universe_id'] = Variable<String>(universeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyDefsCompanion(')
          ..write('id: $id, ')
          ..write('universeId: $universeId, ')
          ..write('name: $name, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SkillDefsTable extends SkillDefs
    with TableInfo<$SkillDefsTable, SkillDef> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SkillDefsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _universeIdMeta = const VerificationMeta(
    'universeId',
  );
  @override
  late final GeneratedColumn<String> universeId = GeneratedColumn<String>(
    'universe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES universes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _linkedStatIdMeta = const VerificationMeta(
    'linkedStatId',
  );
  @override
  late final GeneratedColumn<String> linkedStatId = GeneratedColumn<String>(
    'linked_stat_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    universeId,
    name,
    linkedStatId,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'skill_defs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SkillDef> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('universe_id')) {
      context.handle(
        _universeIdMeta,
        universeId.isAcceptableOrUnknown(data['universe_id']!, _universeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_universeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('linked_stat_id')) {
      context.handle(
        _linkedStatIdMeta,
        linkedStatId.isAcceptableOrUnknown(
          data['linked_stat_id']!,
          _linkedStatIdMeta,
        ),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SkillDef map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SkillDef(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      universeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}universe_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      linkedStatId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}linked_stat_id'],
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $SkillDefsTable createAlias(String alias) {
    return $SkillDefsTable(attachedDatabase, alias);
  }
}

class SkillDef extends DataClass implements Insertable<SkillDef> {
  final String id;
  final String universeId;
  final String name;
  final String? linkedStatId;
  final int orderIndex;
  const SkillDef({
    required this.id,
    required this.universeId,
    required this.name,
    this.linkedStatId,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['universe_id'] = Variable<String>(universeId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || linkedStatId != null) {
      map['linked_stat_id'] = Variable<String>(linkedStatId);
    }
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  SkillDefsCompanion toCompanion(bool nullToAbsent) {
    return SkillDefsCompanion(
      id: Value(id),
      universeId: Value(universeId),
      name: Value(name),
      linkedStatId: linkedStatId == null && nullToAbsent
          ? const Value.absent()
          : Value(linkedStatId),
      orderIndex: Value(orderIndex),
    );
  }

  factory SkillDef.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SkillDef(
      id: serializer.fromJson<String>(json['id']),
      universeId: serializer.fromJson<String>(json['universeId']),
      name: serializer.fromJson<String>(json['name']),
      linkedStatId: serializer.fromJson<String?>(json['linkedStatId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'universeId': serializer.toJson<String>(universeId),
      'name': serializer.toJson<String>(name),
      'linkedStatId': serializer.toJson<String?>(linkedStatId),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  SkillDef copyWith({
    String? id,
    String? universeId,
    String? name,
    Value<String?> linkedStatId = const Value.absent(),
    int? orderIndex,
  }) => SkillDef(
    id: id ?? this.id,
    universeId: universeId ?? this.universeId,
    name: name ?? this.name,
    linkedStatId: linkedStatId.present ? linkedStatId.value : this.linkedStatId,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  SkillDef copyWithCompanion(SkillDefsCompanion data) {
    return SkillDef(
      id: data.id.present ? data.id.value : this.id,
      universeId: data.universeId.present
          ? data.universeId.value
          : this.universeId,
      name: data.name.present ? data.name.value : this.name,
      linkedStatId: data.linkedStatId.present
          ? data.linkedStatId.value
          : this.linkedStatId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SkillDef(')
          ..write('id: $id, ')
          ..write('universeId: $universeId, ')
          ..write('name: $name, ')
          ..write('linkedStatId: $linkedStatId, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, universeId, name, linkedStatId, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SkillDef &&
          other.id == this.id &&
          other.universeId == this.universeId &&
          other.name == this.name &&
          other.linkedStatId == this.linkedStatId &&
          other.orderIndex == this.orderIndex);
}

class SkillDefsCompanion extends UpdateCompanion<SkillDef> {
  final Value<String> id;
  final Value<String> universeId;
  final Value<String> name;
  final Value<String?> linkedStatId;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const SkillDefsCompanion({
    this.id = const Value.absent(),
    this.universeId = const Value.absent(),
    this.name = const Value.absent(),
    this.linkedStatId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SkillDefsCompanion.insert({
    required String id,
    required String universeId,
    required String name,
    this.linkedStatId = const Value.absent(),
    required int orderIndex,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       universeId = Value(universeId),
       name = Value(name),
       orderIndex = Value(orderIndex);
  static Insertable<SkillDef> custom({
    Expression<String>? id,
    Expression<String>? universeId,
    Expression<String>? name,
    Expression<String>? linkedStatId,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (universeId != null) 'universe_id': universeId,
      if (name != null) 'name': name,
      if (linkedStatId != null) 'linked_stat_id': linkedStatId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SkillDefsCompanion copyWith({
    Value<String>? id,
    Value<String>? universeId,
    Value<String>? name,
    Value<String?>? linkedStatId,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return SkillDefsCompanion(
      id: id ?? this.id,
      universeId: universeId ?? this.universeId,
      name: name ?? this.name,
      linkedStatId: linkedStatId ?? this.linkedStatId,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (universeId.present) {
      map['universe_id'] = Variable<String>(universeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (linkedStatId.present) {
      map['linked_stat_id'] = Variable<String>(linkedStatId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SkillDefsCompanion(')
          ..write('id: $id, ')
          ..write('universeId: $universeId, ')
          ..write('name: $name, ')
          ..write('linkedStatId: $linkedStatId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharactersTable extends Characters
    with TableInfo<$CharactersTable, Character> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _universeIdMeta = const VerificationMeta(
    'universeId',
  );
  @override
  late final GeneratedColumn<String> universeId = GeneratedColumn<String>(
    'universe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES universes (id) ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _raceMeta = const VerificationMeta('race');
  @override
  late final GeneratedColumn<String> race = GeneratedColumn<String>(
    'race',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _backstoryMeta = const VerificationMeta(
    'backstory',
  );
  @override
  late final GeneratedColumn<String> backstory = GeneratedColumn<String>(
    'backstory',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    universeId,
    name,
    race,
    level,
    backstory,
    imagePath,
    status,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<Character> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('universe_id')) {
      context.handle(
        _universeIdMeta,
        universeId.isAcceptableOrUnknown(data['universe_id']!, _universeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_universeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('race')) {
      context.handle(
        _raceMeta,
        race.isAcceptableOrUnknown(data['race']!, _raceMeta),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('backstory')) {
      context.handle(
        _backstoryMeta,
        backstory.isAcceptableOrUnknown(data['backstory']!, _backstoryMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Character map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Character(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      universeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}universe_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      race: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}race'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      backstory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backstory'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CharactersTable createAlias(String alias) {
    return $CharactersTable(attachedDatabase, alias);
  }
}

class Character extends DataClass implements Insertable<Character> {
  final String id;
  final String universeId;
  final String name;
  final String race;
  final int level;
  final String backstory;
  final String? imagePath;
  final String status;
  final String notes;
  final DateTime createdAt;
  const Character({
    required this.id,
    required this.universeId,
    required this.name,
    required this.race,
    required this.level,
    required this.backstory,
    this.imagePath,
    required this.status,
    required this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['universe_id'] = Variable<String>(universeId);
    map['name'] = Variable<String>(name);
    map['race'] = Variable<String>(race);
    map['level'] = Variable<int>(level);
    map['backstory'] = Variable<String>(backstory);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['status'] = Variable<String>(status);
    map['notes'] = Variable<String>(notes);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CharactersCompanion toCompanion(bool nullToAbsent) {
    return CharactersCompanion(
      id: Value(id),
      universeId: Value(universeId),
      name: Value(name),
      race: Value(race),
      level: Value(level),
      backstory: Value(backstory),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      status: Value(status),
      notes: Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Character.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Character(
      id: serializer.fromJson<String>(json['id']),
      universeId: serializer.fromJson<String>(json['universeId']),
      name: serializer.fromJson<String>(json['name']),
      race: serializer.fromJson<String>(json['race']),
      level: serializer.fromJson<int>(json['level']),
      backstory: serializer.fromJson<String>(json['backstory']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'universeId': serializer.toJson<String>(universeId),
      'name': serializer.toJson<String>(name),
      'race': serializer.toJson<String>(race),
      'level': serializer.toJson<int>(level),
      'backstory': serializer.toJson<String>(backstory),
      'imagePath': serializer.toJson<String?>(imagePath),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Character copyWith({
    String? id,
    String? universeId,
    String? name,
    String? race,
    int? level,
    String? backstory,
    Value<String?> imagePath = const Value.absent(),
    String? status,
    String? notes,
    DateTime? createdAt,
  }) => Character(
    id: id ?? this.id,
    universeId: universeId ?? this.universeId,
    name: name ?? this.name,
    race: race ?? this.race,
    level: level ?? this.level,
    backstory: backstory ?? this.backstory,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
    status: status ?? this.status,
    notes: notes ?? this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  Character copyWithCompanion(CharactersCompanion data) {
    return Character(
      id: data.id.present ? data.id.value : this.id,
      universeId: data.universeId.present
          ? data.universeId.value
          : this.universeId,
      name: data.name.present ? data.name.value : this.name,
      race: data.race.present ? data.race.value : this.race,
      level: data.level.present ? data.level.value : this.level,
      backstory: data.backstory.present ? data.backstory.value : this.backstory,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Character(')
          ..write('id: $id, ')
          ..write('universeId: $universeId, ')
          ..write('name: $name, ')
          ..write('race: $race, ')
          ..write('level: $level, ')
          ..write('backstory: $backstory, ')
          ..write('imagePath: $imagePath, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    universeId,
    name,
    race,
    level,
    backstory,
    imagePath,
    status,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Character &&
          other.id == this.id &&
          other.universeId == this.universeId &&
          other.name == this.name &&
          other.race == this.race &&
          other.level == this.level &&
          other.backstory == this.backstory &&
          other.imagePath == this.imagePath &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class CharactersCompanion extends UpdateCompanion<Character> {
  final Value<String> id;
  final Value<String> universeId;
  final Value<String> name;
  final Value<String> race;
  final Value<int> level;
  final Value<String> backstory;
  final Value<String?> imagePath;
  final Value<String> status;
  final Value<String> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CharactersCompanion({
    this.id = const Value.absent(),
    this.universeId = const Value.absent(),
    this.name = const Value.absent(),
    this.race = const Value.absent(),
    this.level = const Value.absent(),
    this.backstory = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharactersCompanion.insert({
    required String id,
    required String universeId,
    required String name,
    this.race = const Value.absent(),
    this.level = const Value.absent(),
    this.backstory = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       universeId = Value(universeId),
       name = Value(name);
  static Insertable<Character> custom({
    Expression<String>? id,
    Expression<String>? universeId,
    Expression<String>? name,
    Expression<String>? race,
    Expression<int>? level,
    Expression<String>? backstory,
    Expression<String>? imagePath,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (universeId != null) 'universe_id': universeId,
      if (name != null) 'name': name,
      if (race != null) 'race': race,
      if (level != null) 'level': level,
      if (backstory != null) 'backstory': backstory,
      if (imagePath != null) 'image_path': imagePath,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharactersCompanion copyWith({
    Value<String>? id,
    Value<String>? universeId,
    Value<String>? name,
    Value<String>? race,
    Value<int>? level,
    Value<String>? backstory,
    Value<String?>? imagePath,
    Value<String>? status,
    Value<String>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return CharactersCompanion(
      id: id ?? this.id,
      universeId: universeId ?? this.universeId,
      name: name ?? this.name,
      race: race ?? this.race,
      level: level ?? this.level,
      backstory: backstory ?? this.backstory,
      imagePath: imagePath ?? this.imagePath,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (universeId.present) {
      map['universe_id'] = Variable<String>(universeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (race.present) {
      map['race'] = Variable<String>(race.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (backstory.present) {
      map['backstory'] = Variable<String>(backstory.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharactersCompanion(')
          ..write('id: $id, ')
          ..write('universeId: $universeId, ')
          ..write('name: $name, ')
          ..write('race: $race, ')
          ..write('level: $level, ')
          ..write('backstory: $backstory, ')
          ..write('imagePath: $imagePath, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterClassesTable extends CharacterClasses
    with TableInfo<$CharacterClassesTable, CharacterClass> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterClassesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _classNameMeta = const VerificationMeta(
    'className',
  );
  @override
  late final GeneratedColumn<String> className = GeneratedColumn<String>(
    'class_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _classLevelMeta = const VerificationMeta(
    'classLevel',
  );
  @override
  late final GeneratedColumn<int> classLevel = GeneratedColumn<int>(
    'class_level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    characterId,
    className,
    classLevel,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_classes';
  @override
  VerificationContext validateIntegrity(
    Insertable<CharacterClass> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('class_name')) {
      context.handle(
        _classNameMeta,
        className.isAcceptableOrUnknown(data['class_name']!, _classNameMeta),
      );
    } else if (isInserting) {
      context.missing(_classNameMeta);
    }
    if (data.containsKey('class_level')) {
      context.handle(
        _classLevelMeta,
        classLevel.isAcceptableOrUnknown(data['class_level']!, _classLevelMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterClass(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      className: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}class_name'],
      )!,
      classLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}class_level'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $CharacterClassesTable createAlias(String alias) {
    return $CharacterClassesTable(attachedDatabase, alias);
  }
}

class CharacterClass extends DataClass implements Insertable<CharacterClass> {
  final String id;
  final String characterId;
  final String className;
  final int classLevel;
  final int orderIndex;
  const CharacterClass({
    required this.id,
    required this.characterId,
    required this.className,
    required this.classLevel,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['character_id'] = Variable<String>(characterId);
    map['class_name'] = Variable<String>(className);
    map['class_level'] = Variable<int>(classLevel);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  CharacterClassesCompanion toCompanion(bool nullToAbsent) {
    return CharacterClassesCompanion(
      id: Value(id),
      characterId: Value(characterId),
      className: Value(className),
      classLevel: Value(classLevel),
      orderIndex: Value(orderIndex),
    );
  }

  factory CharacterClass.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterClass(
      id: serializer.fromJson<String>(json['id']),
      characterId: serializer.fromJson<String>(json['characterId']),
      className: serializer.fromJson<String>(json['className']),
      classLevel: serializer.fromJson<int>(json['classLevel']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'characterId': serializer.toJson<String>(characterId),
      'className': serializer.toJson<String>(className),
      'classLevel': serializer.toJson<int>(classLevel),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  CharacterClass copyWith({
    String? id,
    String? characterId,
    String? className,
    int? classLevel,
    int? orderIndex,
  }) => CharacterClass(
    id: id ?? this.id,
    characterId: characterId ?? this.characterId,
    className: className ?? this.className,
    classLevel: classLevel ?? this.classLevel,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  CharacterClass copyWithCompanion(CharacterClassesCompanion data) {
    return CharacterClass(
      id: data.id.present ? data.id.value : this.id,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      className: data.className.present ? data.className.value : this.className,
      classLevel: data.classLevel.present
          ? data.classLevel.value
          : this.classLevel,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterClass(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('className: $className, ')
          ..write('classLevel: $classLevel, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, characterId, className, classLevel, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterClass &&
          other.id == this.id &&
          other.characterId == this.characterId &&
          other.className == this.className &&
          other.classLevel == this.classLevel &&
          other.orderIndex == this.orderIndex);
}

class CharacterClassesCompanion extends UpdateCompanion<CharacterClass> {
  final Value<String> id;
  final Value<String> characterId;
  final Value<String> className;
  final Value<int> classLevel;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const CharacterClassesCompanion({
    this.id = const Value.absent(),
    this.characterId = const Value.absent(),
    this.className = const Value.absent(),
    this.classLevel = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterClassesCompanion.insert({
    required String id,
    required String characterId,
    required String className,
    this.classLevel = const Value.absent(),
    required int orderIndex,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       characterId = Value(characterId),
       className = Value(className),
       orderIndex = Value(orderIndex);
  static Insertable<CharacterClass> custom({
    Expression<String>? id,
    Expression<String>? characterId,
    Expression<String>? className,
    Expression<int>? classLevel,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterId != null) 'character_id': characterId,
      if (className != null) 'class_name': className,
      if (classLevel != null) 'class_level': classLevel,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterClassesCompanion copyWith({
    Value<String>? id,
    Value<String>? characterId,
    Value<String>? className,
    Value<int>? classLevel,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return CharacterClassesCompanion(
      id: id ?? this.id,
      characterId: characterId ?? this.characterId,
      className: className ?? this.className,
      classLevel: classLevel ?? this.classLevel,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (className.present) {
      map['class_name'] = Variable<String>(className.value);
    }
    if (classLevel.present) {
      map['class_level'] = Variable<int>(classLevel.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterClassesCompanion(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('className: $className, ')
          ..write('classLevel: $classLevel, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StatValuesTable extends StatValues
    with TableInfo<$StatValuesTable, StatValue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatValuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _statDefIdMeta = const VerificationMeta(
    'statDefId',
  );
  @override
  late final GeneratedColumn<String> statDefId = GeneratedColumn<String>(
    'stat_def_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stat_defs (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [characterId, statDefId, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stat_values';
  @override
  VerificationContext validateIntegrity(
    Insertable<StatValue> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('stat_def_id')) {
      context.handle(
        _statDefIdMeta,
        statDefId.isAcceptableOrUnknown(data['stat_def_id']!, _statDefIdMeta),
      );
    } else if (isInserting) {
      context.missing(_statDefIdMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId, statDefId};
  @override
  StatValue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StatValue(
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      statDefId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stat_def_id'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $StatValuesTable createAlias(String alias) {
    return $StatValuesTable(attachedDatabase, alias);
  }
}

class StatValue extends DataClass implements Insertable<StatValue> {
  final String characterId;
  final String statDefId;
  final int value;
  const StatValue({
    required this.characterId,
    required this.statDefId,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<String>(characterId);
    map['stat_def_id'] = Variable<String>(statDefId);
    map['value'] = Variable<int>(value);
    return map;
  }

  StatValuesCompanion toCompanion(bool nullToAbsent) {
    return StatValuesCompanion(
      characterId: Value(characterId),
      statDefId: Value(statDefId),
      value: Value(value),
    );
  }

  factory StatValue.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StatValue(
      characterId: serializer.fromJson<String>(json['characterId']),
      statDefId: serializer.fromJson<String>(json['statDefId']),
      value: serializer.fromJson<int>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<String>(characterId),
      'statDefId': serializer.toJson<String>(statDefId),
      'value': serializer.toJson<int>(value),
    };
  }

  StatValue copyWith({String? characterId, String? statDefId, int? value}) =>
      StatValue(
        characterId: characterId ?? this.characterId,
        statDefId: statDefId ?? this.statDefId,
        value: value ?? this.value,
      );
  StatValue copyWithCompanion(StatValuesCompanion data) {
    return StatValue(
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      statDefId: data.statDefId.present ? data.statDefId.value : this.statDefId,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StatValue(')
          ..write('characterId: $characterId, ')
          ..write('statDefId: $statDefId, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, statDefId, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatValue &&
          other.characterId == this.characterId &&
          other.statDefId == this.statDefId &&
          other.value == this.value);
}

class StatValuesCompanion extends UpdateCompanion<StatValue> {
  final Value<String> characterId;
  final Value<String> statDefId;
  final Value<int> value;
  final Value<int> rowid;
  const StatValuesCompanion({
    this.characterId = const Value.absent(),
    this.statDefId = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StatValuesCompanion.insert({
    required String characterId,
    required String statDefId,
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : characterId = Value(characterId),
       statDefId = Value(statDefId);
  static Insertable<StatValue> custom({
    Expression<String>? characterId,
    Expression<String>? statDefId,
    Expression<int>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (statDefId != null) 'stat_def_id': statDefId,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StatValuesCompanion copyWith({
    Value<String>? characterId,
    Value<String>? statDefId,
    Value<int>? value,
    Value<int>? rowid,
  }) {
    return StatValuesCompanion(
      characterId: characterId ?? this.characterId,
      statDefId: statDefId ?? this.statDefId,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (statDefId.present) {
      map['stat_def_id'] = Variable<String>(statDefId.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatValuesCompanion(')
          ..write('characterId: $characterId, ')
          ..write('statDefId: $statDefId, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ResourceValuesTable extends ResourceValues
    with TableInfo<$ResourceValuesTable, ResourceValue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResourceValuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _resourceDefIdMeta = const VerificationMeta(
    'resourceDefId',
  );
  @override
  late final GeneratedColumn<String> resourceDefId = GeneratedColumn<String>(
    'resource_def_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES resource_track_defs (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _currentMeta = const VerificationMeta(
    'current',
  );
  @override
  late final GeneratedColumn<int> current = GeneratedColumn<int>(
    'current',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _maximumMeta = const VerificationMeta(
    'maximum',
  );
  @override
  late final GeneratedColumn<int> maximum = GeneratedColumn<int>(
    'maximum',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    characterId,
    resourceDefId,
    current,
    maximum,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'resource_values';
  @override
  VerificationContext validateIntegrity(
    Insertable<ResourceValue> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('resource_def_id')) {
      context.handle(
        _resourceDefIdMeta,
        resourceDefId.isAcceptableOrUnknown(
          data['resource_def_id']!,
          _resourceDefIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_resourceDefIdMeta);
    }
    if (data.containsKey('current')) {
      context.handle(
        _currentMeta,
        current.isAcceptableOrUnknown(data['current']!, _currentMeta),
      );
    }
    if (data.containsKey('maximum')) {
      context.handle(
        _maximumMeta,
        maximum.isAcceptableOrUnknown(data['maximum']!, _maximumMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId, resourceDefId};
  @override
  ResourceValue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResourceValue(
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      resourceDefId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resource_def_id'],
      )!,
      current: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current'],
      )!,
      maximum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}maximum'],
      )!,
    );
  }

  @override
  $ResourceValuesTable createAlias(String alias) {
    return $ResourceValuesTable(attachedDatabase, alias);
  }
}

class ResourceValue extends DataClass implements Insertable<ResourceValue> {
  final String characterId;
  final String resourceDefId;
  final int current;
  final int maximum;
  const ResourceValue({
    required this.characterId,
    required this.resourceDefId,
    required this.current,
    required this.maximum,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<String>(characterId);
    map['resource_def_id'] = Variable<String>(resourceDefId);
    map['current'] = Variable<int>(current);
    map['maximum'] = Variable<int>(maximum);
    return map;
  }

  ResourceValuesCompanion toCompanion(bool nullToAbsent) {
    return ResourceValuesCompanion(
      characterId: Value(characterId),
      resourceDefId: Value(resourceDefId),
      current: Value(current),
      maximum: Value(maximum),
    );
  }

  factory ResourceValue.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResourceValue(
      characterId: serializer.fromJson<String>(json['characterId']),
      resourceDefId: serializer.fromJson<String>(json['resourceDefId']),
      current: serializer.fromJson<int>(json['current']),
      maximum: serializer.fromJson<int>(json['maximum']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<String>(characterId),
      'resourceDefId': serializer.toJson<String>(resourceDefId),
      'current': serializer.toJson<int>(current),
      'maximum': serializer.toJson<int>(maximum),
    };
  }

  ResourceValue copyWith({
    String? characterId,
    String? resourceDefId,
    int? current,
    int? maximum,
  }) => ResourceValue(
    characterId: characterId ?? this.characterId,
    resourceDefId: resourceDefId ?? this.resourceDefId,
    current: current ?? this.current,
    maximum: maximum ?? this.maximum,
  );
  ResourceValue copyWithCompanion(ResourceValuesCompanion data) {
    return ResourceValue(
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      resourceDefId: data.resourceDefId.present
          ? data.resourceDefId.value
          : this.resourceDefId,
      current: data.current.present ? data.current.value : this.current,
      maximum: data.maximum.present ? data.maximum.value : this.maximum,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ResourceValue(')
          ..write('characterId: $characterId, ')
          ..write('resourceDefId: $resourceDefId, ')
          ..write('current: $current, ')
          ..write('maximum: $maximum')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, resourceDefId, current, maximum);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResourceValue &&
          other.characterId == this.characterId &&
          other.resourceDefId == this.resourceDefId &&
          other.current == this.current &&
          other.maximum == this.maximum);
}

class ResourceValuesCompanion extends UpdateCompanion<ResourceValue> {
  final Value<String> characterId;
  final Value<String> resourceDefId;
  final Value<int> current;
  final Value<int> maximum;
  final Value<int> rowid;
  const ResourceValuesCompanion({
    this.characterId = const Value.absent(),
    this.resourceDefId = const Value.absent(),
    this.current = const Value.absent(),
    this.maximum = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ResourceValuesCompanion.insert({
    required String characterId,
    required String resourceDefId,
    this.current = const Value.absent(),
    this.maximum = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : characterId = Value(characterId),
       resourceDefId = Value(resourceDefId);
  static Insertable<ResourceValue> custom({
    Expression<String>? characterId,
    Expression<String>? resourceDefId,
    Expression<int>? current,
    Expression<int>? maximum,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (resourceDefId != null) 'resource_def_id': resourceDefId,
      if (current != null) 'current': current,
      if (maximum != null) 'maximum': maximum,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ResourceValuesCompanion copyWith({
    Value<String>? characterId,
    Value<String>? resourceDefId,
    Value<int>? current,
    Value<int>? maximum,
    Value<int>? rowid,
  }) {
    return ResourceValuesCompanion(
      characterId: characterId ?? this.characterId,
      resourceDefId: resourceDefId ?? this.resourceDefId,
      current: current ?? this.current,
      maximum: maximum ?? this.maximum,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (resourceDefId.present) {
      map['resource_def_id'] = Variable<String>(resourceDefId.value);
    }
    if (current.present) {
      map['current'] = Variable<int>(current.value);
    }
    if (maximum.present) {
      map['maximum'] = Variable<int>(maximum.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResourceValuesCompanion(')
          ..write('characterId: $characterId, ')
          ..write('resourceDefId: $resourceDefId, ')
          ..write('current: $current, ')
          ..write('maximum: $maximum, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CurrencyValuesTable extends CurrencyValues
    with TableInfo<$CurrencyValuesTable, CurrencyValue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrencyValuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _currencyDefIdMeta = const VerificationMeta(
    'currencyDefId',
  );
  @override
  late final GeneratedColumn<String> currencyDefId = GeneratedColumn<String>(
    'currency_def_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES currency_defs (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [characterId, currencyDefId, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currency_values';
  @override
  VerificationContext validateIntegrity(
    Insertable<CurrencyValue> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('currency_def_id')) {
      context.handle(
        _currencyDefIdMeta,
        currencyDefId.isAcceptableOrUnknown(
          data['currency_def_id']!,
          _currencyDefIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyDefIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId, currencyDefId};
  @override
  CurrencyValue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrencyValue(
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      currencyDefId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_def_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $CurrencyValuesTable createAlias(String alias) {
    return $CurrencyValuesTable(attachedDatabase, alias);
  }
}

class CurrencyValue extends DataClass implements Insertable<CurrencyValue> {
  final String characterId;
  final String currencyDefId;
  final int amount;
  const CurrencyValue({
    required this.characterId,
    required this.currencyDefId,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<String>(characterId);
    map['currency_def_id'] = Variable<String>(currencyDefId);
    map['amount'] = Variable<int>(amount);
    return map;
  }

  CurrencyValuesCompanion toCompanion(bool nullToAbsent) {
    return CurrencyValuesCompanion(
      characterId: Value(characterId),
      currencyDefId: Value(currencyDefId),
      amount: Value(amount),
    );
  }

  factory CurrencyValue.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrencyValue(
      characterId: serializer.fromJson<String>(json['characterId']),
      currencyDefId: serializer.fromJson<String>(json['currencyDefId']),
      amount: serializer.fromJson<int>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<String>(characterId),
      'currencyDefId': serializer.toJson<String>(currencyDefId),
      'amount': serializer.toJson<int>(amount),
    };
  }

  CurrencyValue copyWith({
    String? characterId,
    String? currencyDefId,
    int? amount,
  }) => CurrencyValue(
    characterId: characterId ?? this.characterId,
    currencyDefId: currencyDefId ?? this.currencyDefId,
    amount: amount ?? this.amount,
  );
  CurrencyValue copyWithCompanion(CurrencyValuesCompanion data) {
    return CurrencyValue(
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      currencyDefId: data.currencyDefId.present
          ? data.currencyDefId.value
          : this.currencyDefId,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyValue(')
          ..write('characterId: $characterId, ')
          ..write('currencyDefId: $currencyDefId, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, currencyDefId, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrencyValue &&
          other.characterId == this.characterId &&
          other.currencyDefId == this.currencyDefId &&
          other.amount == this.amount);
}

class CurrencyValuesCompanion extends UpdateCompanion<CurrencyValue> {
  final Value<String> characterId;
  final Value<String> currencyDefId;
  final Value<int> amount;
  final Value<int> rowid;
  const CurrencyValuesCompanion({
    this.characterId = const Value.absent(),
    this.currencyDefId = const Value.absent(),
    this.amount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurrencyValuesCompanion.insert({
    required String characterId,
    required String currencyDefId,
    this.amount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : characterId = Value(characterId),
       currencyDefId = Value(currencyDefId);
  static Insertable<CurrencyValue> custom({
    Expression<String>? characterId,
    Expression<String>? currencyDefId,
    Expression<int>? amount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (currencyDefId != null) 'currency_def_id': currencyDefId,
      if (amount != null) 'amount': amount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurrencyValuesCompanion copyWith({
    Value<String>? characterId,
    Value<String>? currencyDefId,
    Value<int>? amount,
    Value<int>? rowid,
  }) {
    return CurrencyValuesCompanion(
      characterId: characterId ?? this.characterId,
      currencyDefId: currencyDefId ?? this.currencyDefId,
      amount: amount ?? this.amount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (currencyDefId.present) {
      map['currency_def_id'] = Variable<String>(currencyDefId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrencyValuesCompanion(')
          ..write('characterId: $characterId, ')
          ..write('currencyDefId: $currencyDefId, ')
          ..write('amount: $amount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SkillValuesTable extends SkillValues
    with TableInfo<$SkillValuesTable, SkillValue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SkillValuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _skillDefIdMeta = const VerificationMeta(
    'skillDefId',
  );
  @override
  late final GeneratedColumn<String> skillDefId = GeneratedColumn<String>(
    'skill_def_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES skill_defs (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _proficientMeta = const VerificationMeta(
    'proficient',
  );
  @override
  late final GeneratedColumn<bool> proficient = GeneratedColumn<bool>(
    'proficient',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("proficient" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    characterId,
    skillDefId,
    value,
    proficient,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'skill_values';
  @override
  VerificationContext validateIntegrity(
    Insertable<SkillValue> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('skill_def_id')) {
      context.handle(
        _skillDefIdMeta,
        skillDefId.isAcceptableOrUnknown(
          data['skill_def_id']!,
          _skillDefIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_skillDefIdMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    }
    if (data.containsKey('proficient')) {
      context.handle(
        _proficientMeta,
        proficient.isAcceptableOrUnknown(data['proficient']!, _proficientMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId, skillDefId};
  @override
  SkillValue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SkillValue(
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      skillDefId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}skill_def_id'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}value'],
      )!,
      proficient: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}proficient'],
      )!,
    );
  }

  @override
  $SkillValuesTable createAlias(String alias) {
    return $SkillValuesTable(attachedDatabase, alias);
  }
}

class SkillValue extends DataClass implements Insertable<SkillValue> {
  final String characterId;
  final String skillDefId;
  final int value;
  final bool proficient;
  const SkillValue({
    required this.characterId,
    required this.skillDefId,
    required this.value,
    required this.proficient,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<String>(characterId);
    map['skill_def_id'] = Variable<String>(skillDefId);
    map['value'] = Variable<int>(value);
    map['proficient'] = Variable<bool>(proficient);
    return map;
  }

  SkillValuesCompanion toCompanion(bool nullToAbsent) {
    return SkillValuesCompanion(
      characterId: Value(characterId),
      skillDefId: Value(skillDefId),
      value: Value(value),
      proficient: Value(proficient),
    );
  }

  factory SkillValue.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SkillValue(
      characterId: serializer.fromJson<String>(json['characterId']),
      skillDefId: serializer.fromJson<String>(json['skillDefId']),
      value: serializer.fromJson<int>(json['value']),
      proficient: serializer.fromJson<bool>(json['proficient']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<String>(characterId),
      'skillDefId': serializer.toJson<String>(skillDefId),
      'value': serializer.toJson<int>(value),
      'proficient': serializer.toJson<bool>(proficient),
    };
  }

  SkillValue copyWith({
    String? characterId,
    String? skillDefId,
    int? value,
    bool? proficient,
  }) => SkillValue(
    characterId: characterId ?? this.characterId,
    skillDefId: skillDefId ?? this.skillDefId,
    value: value ?? this.value,
    proficient: proficient ?? this.proficient,
  );
  SkillValue copyWithCompanion(SkillValuesCompanion data) {
    return SkillValue(
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      skillDefId: data.skillDefId.present
          ? data.skillDefId.value
          : this.skillDefId,
      value: data.value.present ? data.value.value : this.value,
      proficient: data.proficient.present
          ? data.proficient.value
          : this.proficient,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SkillValue(')
          ..write('characterId: $characterId, ')
          ..write('skillDefId: $skillDefId, ')
          ..write('value: $value, ')
          ..write('proficient: $proficient')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, skillDefId, value, proficient);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SkillValue &&
          other.characterId == this.characterId &&
          other.skillDefId == this.skillDefId &&
          other.value == this.value &&
          other.proficient == this.proficient);
}

class SkillValuesCompanion extends UpdateCompanion<SkillValue> {
  final Value<String> characterId;
  final Value<String> skillDefId;
  final Value<int> value;
  final Value<bool> proficient;
  final Value<int> rowid;
  const SkillValuesCompanion({
    this.characterId = const Value.absent(),
    this.skillDefId = const Value.absent(),
    this.value = const Value.absent(),
    this.proficient = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SkillValuesCompanion.insert({
    required String characterId,
    required String skillDefId,
    this.value = const Value.absent(),
    this.proficient = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : characterId = Value(characterId),
       skillDefId = Value(skillDefId);
  static Insertable<SkillValue> custom({
    Expression<String>? characterId,
    Expression<String>? skillDefId,
    Expression<int>? value,
    Expression<bool>? proficient,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'character_id': characterId,
      if (skillDefId != null) 'skill_def_id': skillDefId,
      if (value != null) 'value': value,
      if (proficient != null) 'proficient': proficient,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SkillValuesCompanion copyWith({
    Value<String>? characterId,
    Value<String>? skillDefId,
    Value<int>? value,
    Value<bool>? proficient,
    Value<int>? rowid,
  }) {
    return SkillValuesCompanion(
      characterId: characterId ?? this.characterId,
      skillDefId: skillDefId ?? this.skillDefId,
      value: value ?? this.value,
      proficient: proficient ?? this.proficient,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (skillDefId.present) {
      map['skill_def_id'] = Variable<String>(skillDefId.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (proficient.present) {
      map['proficient'] = Variable<bool>(proficient.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SkillValuesCompanion(')
          ..write('characterId: $characterId, ')
          ..write('skillDefId: $skillDefId, ')
          ..write('value: $value, ')
          ..write('proficient: $proficient, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InventoryItemsTable extends InventoryItems
    with TableInfo<$InventoryItemsTable, InventoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _characterIdMeta = const VerificationMeta(
    'characterId',
  );
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
    'character_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES characters (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _qualityMeta = const VerificationMeta(
    'quality',
  );
  @override
  late final GeneratedColumn<String> quality = GeneratedColumn<String>(
    'quality',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _equippedMeta = const VerificationMeta(
    'equipped',
  );
  @override
  late final GeneratedColumn<bool> equipped = GeneratedColumn<bool>(
    'equipped',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("equipped" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _itemValueMeta = const VerificationMeta(
    'itemValue',
  );
  @override
  late final GeneratedColumn<double> itemValue = GeneratedColumn<double>(
    'item_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    characterId,
    name,
    quality,
    quantity,
    description,
    equipped,
    category,
    weight,
    itemValue,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<InventoryItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('character_id')) {
      context.handle(
        _characterIdMeta,
        characterId.isAcceptableOrUnknown(
          data['character_id']!,
          _characterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('quality')) {
      context.handle(
        _qualityMeta,
        quality.isAcceptableOrUnknown(data['quality']!, _qualityMeta),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('equipped')) {
      context.handle(
        _equippedMeta,
        equipped.isAcceptableOrUnknown(data['equipped']!, _equippedMeta),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('item_value')) {
      context.handle(
        _itemValueMeta,
        itemValue.isAcceptableOrUnknown(data['item_value']!, _itemValueMeta),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      characterId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}character_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      quality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quality'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      equipped: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}equipped'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      itemValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}item_value'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $InventoryItemsTable createAlias(String alias) {
    return $InventoryItemsTable(attachedDatabase, alias);
  }
}

class InventoryItem extends DataClass implements Insertable<InventoryItem> {
  final String id;
  final String characterId;
  final String name;
  final String quality;
  final int quantity;
  final String description;
  final bool equipped;
  final String category;
  final double weight;
  final double itemValue;
  final int orderIndex;
  const InventoryItem({
    required this.id,
    required this.characterId,
    required this.name,
    required this.quality,
    required this.quantity,
    required this.description,
    required this.equipped,
    required this.category,
    required this.weight,
    required this.itemValue,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['character_id'] = Variable<String>(characterId);
    map['name'] = Variable<String>(name);
    map['quality'] = Variable<String>(quality);
    map['quantity'] = Variable<int>(quantity);
    map['description'] = Variable<String>(description);
    map['equipped'] = Variable<bool>(equipped);
    map['category'] = Variable<String>(category);
    map['weight'] = Variable<double>(weight);
    map['item_value'] = Variable<double>(itemValue);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  InventoryItemsCompanion toCompanion(bool nullToAbsent) {
    return InventoryItemsCompanion(
      id: Value(id),
      characterId: Value(characterId),
      name: Value(name),
      quality: Value(quality),
      quantity: Value(quantity),
      description: Value(description),
      equipped: Value(equipped),
      category: Value(category),
      weight: Value(weight),
      itemValue: Value(itemValue),
      orderIndex: Value(orderIndex),
    );
  }

  factory InventoryItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryItem(
      id: serializer.fromJson<String>(json['id']),
      characterId: serializer.fromJson<String>(json['characterId']),
      name: serializer.fromJson<String>(json['name']),
      quality: serializer.fromJson<String>(json['quality']),
      quantity: serializer.fromJson<int>(json['quantity']),
      description: serializer.fromJson<String>(json['description']),
      equipped: serializer.fromJson<bool>(json['equipped']),
      category: serializer.fromJson<String>(json['category']),
      weight: serializer.fromJson<double>(json['weight']),
      itemValue: serializer.fromJson<double>(json['itemValue']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'characterId': serializer.toJson<String>(characterId),
      'name': serializer.toJson<String>(name),
      'quality': serializer.toJson<String>(quality),
      'quantity': serializer.toJson<int>(quantity),
      'description': serializer.toJson<String>(description),
      'equipped': serializer.toJson<bool>(equipped),
      'category': serializer.toJson<String>(category),
      'weight': serializer.toJson<double>(weight),
      'itemValue': serializer.toJson<double>(itemValue),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  InventoryItem copyWith({
    String? id,
    String? characterId,
    String? name,
    String? quality,
    int? quantity,
    String? description,
    bool? equipped,
    String? category,
    double? weight,
    double? itemValue,
    int? orderIndex,
  }) => InventoryItem(
    id: id ?? this.id,
    characterId: characterId ?? this.characterId,
    name: name ?? this.name,
    quality: quality ?? this.quality,
    quantity: quantity ?? this.quantity,
    description: description ?? this.description,
    equipped: equipped ?? this.equipped,
    category: category ?? this.category,
    weight: weight ?? this.weight,
    itemValue: itemValue ?? this.itemValue,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  InventoryItem copyWithCompanion(InventoryItemsCompanion data) {
    return InventoryItem(
      id: data.id.present ? data.id.value : this.id,
      characterId: data.characterId.present
          ? data.characterId.value
          : this.characterId,
      name: data.name.present ? data.name.value : this.name,
      quality: data.quality.present ? data.quality.value : this.quality,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      description: data.description.present
          ? data.description.value
          : this.description,
      equipped: data.equipped.present ? data.equipped.value : this.equipped,
      category: data.category.present ? data.category.value : this.category,
      weight: data.weight.present ? data.weight.value : this.weight,
      itemValue: data.itemValue.present ? data.itemValue.value : this.itemValue,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItem(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('name: $name, ')
          ..write('quality: $quality, ')
          ..write('quantity: $quantity, ')
          ..write('description: $description, ')
          ..write('equipped: $equipped, ')
          ..write('category: $category, ')
          ..write('weight: $weight, ')
          ..write('itemValue: $itemValue, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    characterId,
    name,
    quality,
    quantity,
    description,
    equipped,
    category,
    weight,
    itemValue,
    orderIndex,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryItem &&
          other.id == this.id &&
          other.characterId == this.characterId &&
          other.name == this.name &&
          other.quality == this.quality &&
          other.quantity == this.quantity &&
          other.description == this.description &&
          other.equipped == this.equipped &&
          other.category == this.category &&
          other.weight == this.weight &&
          other.itemValue == this.itemValue &&
          other.orderIndex == this.orderIndex);
}

class InventoryItemsCompanion extends UpdateCompanion<InventoryItem> {
  final Value<String> id;
  final Value<String> characterId;
  final Value<String> name;
  final Value<String> quality;
  final Value<int> quantity;
  final Value<String> description;
  final Value<bool> equipped;
  final Value<String> category;
  final Value<double> weight;
  final Value<double> itemValue;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const InventoryItemsCompanion({
    this.id = const Value.absent(),
    this.characterId = const Value.absent(),
    this.name = const Value.absent(),
    this.quality = const Value.absent(),
    this.quantity = const Value.absent(),
    this.description = const Value.absent(),
    this.equipped = const Value.absent(),
    this.category = const Value.absent(),
    this.weight = const Value.absent(),
    this.itemValue = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventoryItemsCompanion.insert({
    required String id,
    required String characterId,
    required String name,
    this.quality = const Value.absent(),
    this.quantity = const Value.absent(),
    this.description = const Value.absent(),
    this.equipped = const Value.absent(),
    this.category = const Value.absent(),
    this.weight = const Value.absent(),
    this.itemValue = const Value.absent(),
    required int orderIndex,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       characterId = Value(characterId),
       name = Value(name),
       orderIndex = Value(orderIndex);
  static Insertable<InventoryItem> custom({
    Expression<String>? id,
    Expression<String>? characterId,
    Expression<String>? name,
    Expression<String>? quality,
    Expression<int>? quantity,
    Expression<String>? description,
    Expression<bool>? equipped,
    Expression<String>? category,
    Expression<double>? weight,
    Expression<double>? itemValue,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterId != null) 'character_id': characterId,
      if (name != null) 'name': name,
      if (quality != null) 'quality': quality,
      if (quantity != null) 'quantity': quantity,
      if (description != null) 'description': description,
      if (equipped != null) 'equipped': equipped,
      if (category != null) 'category': category,
      if (weight != null) 'weight': weight,
      if (itemValue != null) 'item_value': itemValue,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventoryItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? characterId,
    Value<String>? name,
    Value<String>? quality,
    Value<int>? quantity,
    Value<String>? description,
    Value<bool>? equipped,
    Value<String>? category,
    Value<double>? weight,
    Value<double>? itemValue,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return InventoryItemsCompanion(
      id: id ?? this.id,
      characterId: characterId ?? this.characterId,
      name: name ?? this.name,
      quality: quality ?? this.quality,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
      equipped: equipped ?? this.equipped,
      category: category ?? this.category,
      weight: weight ?? this.weight,
      itemValue: itemValue ?? this.itemValue,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (characterId.present) {
      map['character_id'] = Variable<String>(characterId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quality.present) {
      map['quality'] = Variable<String>(quality.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (equipped.present) {
      map['equipped'] = Variable<bool>(equipped.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (itemValue.present) {
      map['item_value'] = Variable<double>(itemValue.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('name: $name, ')
          ..write('quality: $quality, ')
          ..write('quantity: $quantity, ')
          ..write('description: $description, ')
          ..write('equipped: $equipped, ')
          ..write('category: $category, ')
          ..write('weight: $weight, ')
          ..write('itemValue: $itemValue, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UniversesTable universes = $UniversesTable(this);
  late final $StatDefsTable statDefs = $StatDefsTable(this);
  late final $ResourceTrackDefsTable resourceTrackDefs =
      $ResourceTrackDefsTable(this);
  late final $CurrencyDefsTable currencyDefs = $CurrencyDefsTable(this);
  late final $SkillDefsTable skillDefs = $SkillDefsTable(this);
  late final $CharactersTable characters = $CharactersTable(this);
  late final $CharacterClassesTable characterClasses = $CharacterClassesTable(
    this,
  );
  late final $StatValuesTable statValues = $StatValuesTable(this);
  late final $ResourceValuesTable resourceValues = $ResourceValuesTable(this);
  late final $CurrencyValuesTable currencyValues = $CurrencyValuesTable(this);
  late final $SkillValuesTable skillValues = $SkillValuesTable(this);
  late final $InventoryItemsTable inventoryItems = $InventoryItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    universes,
    statDefs,
    resourceTrackDefs,
    currencyDefs,
    skillDefs,
    characters,
    characterClasses,
    statValues,
    resourceValues,
    currencyValues,
    skillValues,
    inventoryItems,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'universes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('stat_defs', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'universes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('resource_track_defs', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'universes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('currency_defs', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'universes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('skill_defs', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('character_classes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('stat_values', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'stat_defs',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('stat_values', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('resource_values', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'resource_track_defs',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('resource_values', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('currency_values', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'currency_defs',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('currency_values', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('skill_values', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'skill_defs',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('skill_values', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'characters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('inventory_items', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$UniversesTableCreateCompanionBuilder =
    UniversesCompanion Function({
      required String id,
      required String name,
      Value<String> playGroup,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$UniversesTableUpdateCompanionBuilder =
    UniversesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> playGroup,
      Value<bool> isArchived,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$UniversesTableReferences
    extends BaseReferences<_$AppDatabase, $UniversesTable, Universe> {
  $$UniversesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StatDefsTable, List<StatDef>> _statDefsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.statDefs,
    aliasName: $_aliasNameGenerator(db.universes.id, db.statDefs.universeId),
  );

  $$StatDefsTableProcessedTableManager get statDefsRefs {
    final manager = $$StatDefsTableTableManager(
      $_db,
      $_db.statDefs,
    ).filter((f) => f.universeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_statDefsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ResourceTrackDefsTable, List<ResourceTrackDef>>
  _resourceTrackDefsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.resourceTrackDefs,
        aliasName: $_aliasNameGenerator(
          db.universes.id,
          db.resourceTrackDefs.universeId,
        ),
      );

  $$ResourceTrackDefsTableProcessedTableManager get resourceTrackDefsRefs {
    final manager = $$ResourceTrackDefsTableTableManager(
      $_db,
      $_db.resourceTrackDefs,
    ).filter((f) => f.universeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _resourceTrackDefsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CurrencyDefsTable, List<CurrencyDef>>
  _currencyDefsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.currencyDefs,
    aliasName: $_aliasNameGenerator(
      db.universes.id,
      db.currencyDefs.universeId,
    ),
  );

  $$CurrencyDefsTableProcessedTableManager get currencyDefsRefs {
    final manager = $$CurrencyDefsTableTableManager(
      $_db,
      $_db.currencyDefs,
    ).filter((f) => f.universeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_currencyDefsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SkillDefsTable, List<SkillDef>>
  _skillDefsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.skillDefs,
    aliasName: $_aliasNameGenerator(db.universes.id, db.skillDefs.universeId),
  );

  $$SkillDefsTableProcessedTableManager get skillDefsRefs {
    final manager = $$SkillDefsTableTableManager(
      $_db,
      $_db.skillDefs,
    ).filter((f) => f.universeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_skillDefsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CharactersTable, List<Character>>
  _charactersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characters,
    aliasName: $_aliasNameGenerator(db.universes.id, db.characters.universeId),
  );

  $$CharactersTableProcessedTableManager get charactersRefs {
    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.universeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_charactersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UniversesTableFilterComposer
    extends Composer<_$AppDatabase, $UniversesTable> {
  $$UniversesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get playGroup => $composableBuilder(
    column: $table.playGroup,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> statDefsRefs(
    Expression<bool> Function($$StatDefsTableFilterComposer f) f,
  ) {
    final $$StatDefsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.statDefs,
      getReferencedColumn: (t) => t.universeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatDefsTableFilterComposer(
            $db: $db,
            $table: $db.statDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> resourceTrackDefsRefs(
    Expression<bool> Function($$ResourceTrackDefsTableFilterComposer f) f,
  ) {
    final $$ResourceTrackDefsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resourceTrackDefs,
      getReferencedColumn: (t) => t.universeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourceTrackDefsTableFilterComposer(
            $db: $db,
            $table: $db.resourceTrackDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> currencyDefsRefs(
    Expression<bool> Function($$CurrencyDefsTableFilterComposer f) f,
  ) {
    final $$CurrencyDefsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.currencyDefs,
      getReferencedColumn: (t) => t.universeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyDefsTableFilterComposer(
            $db: $db,
            $table: $db.currencyDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> skillDefsRefs(
    Expression<bool> Function($$SkillDefsTableFilterComposer f) f,
  ) {
    final $$SkillDefsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.skillDefs,
      getReferencedColumn: (t) => t.universeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillDefsTableFilterComposer(
            $db: $db,
            $table: $db.skillDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> charactersRefs(
    Expression<bool> Function($$CharactersTableFilterComposer f) f,
  ) {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.universeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UniversesTableOrderingComposer
    extends Composer<_$AppDatabase, $UniversesTable> {
  $$UniversesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get playGroup => $composableBuilder(
    column: $table.playGroup,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UniversesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UniversesTable> {
  $$UniversesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get playGroup =>
      $composableBuilder(column: $table.playGroup, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
    column: $table.isArchived,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> statDefsRefs<T extends Object>(
    Expression<T> Function($$StatDefsTableAnnotationComposer a) f,
  ) {
    final $$StatDefsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.statDefs,
      getReferencedColumn: (t) => t.universeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatDefsTableAnnotationComposer(
            $db: $db,
            $table: $db.statDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> resourceTrackDefsRefs<T extends Object>(
    Expression<T> Function($$ResourceTrackDefsTableAnnotationComposer a) f,
  ) {
    final $$ResourceTrackDefsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.resourceTrackDefs,
          getReferencedColumn: (t) => t.universeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ResourceTrackDefsTableAnnotationComposer(
                $db: $db,
                $table: $db.resourceTrackDefs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> currencyDefsRefs<T extends Object>(
    Expression<T> Function($$CurrencyDefsTableAnnotationComposer a) f,
  ) {
    final $$CurrencyDefsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.currencyDefs,
      getReferencedColumn: (t) => t.universeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyDefsTableAnnotationComposer(
            $db: $db,
            $table: $db.currencyDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> skillDefsRefs<T extends Object>(
    Expression<T> Function($$SkillDefsTableAnnotationComposer a) f,
  ) {
    final $$SkillDefsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.skillDefs,
      getReferencedColumn: (t) => t.universeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillDefsTableAnnotationComposer(
            $db: $db,
            $table: $db.skillDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> charactersRefs<T extends Object>(
    Expression<T> Function($$CharactersTableAnnotationComposer a) f,
  ) {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.universeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UniversesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UniversesTable,
          Universe,
          $$UniversesTableFilterComposer,
          $$UniversesTableOrderingComposer,
          $$UniversesTableAnnotationComposer,
          $$UniversesTableCreateCompanionBuilder,
          $$UniversesTableUpdateCompanionBuilder,
          (Universe, $$UniversesTableReferences),
          Universe,
          PrefetchHooks Function({
            bool statDefsRefs,
            bool resourceTrackDefsRefs,
            bool currencyDefsRefs,
            bool skillDefsRefs,
            bool charactersRefs,
          })
        > {
  $$UniversesTableTableManager(_$AppDatabase db, $UniversesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UniversesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UniversesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UniversesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> playGroup = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UniversesCompanion(
                id: id,
                name: name,
                playGroup: playGroup,
                isArchived: isArchived,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String> playGroup = const Value.absent(),
                Value<bool> isArchived = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UniversesCompanion.insert(
                id: id,
                name: name,
                playGroup: playGroup,
                isArchived: isArchived,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UniversesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                statDefsRefs = false,
                resourceTrackDefsRefs = false,
                currencyDefsRefs = false,
                skillDefsRefs = false,
                charactersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (statDefsRefs) db.statDefs,
                    if (resourceTrackDefsRefs) db.resourceTrackDefs,
                    if (currencyDefsRefs) db.currencyDefs,
                    if (skillDefsRefs) db.skillDefs,
                    if (charactersRefs) db.characters,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (statDefsRefs)
                        await $_getPrefetchedData<
                          Universe,
                          $UniversesTable,
                          StatDef
                        >(
                          currentTable: table,
                          referencedTable: $$UniversesTableReferences
                              ._statDefsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UniversesTableReferences(
                                db,
                                table,
                                p0,
                              ).statDefsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.universeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (resourceTrackDefsRefs)
                        await $_getPrefetchedData<
                          Universe,
                          $UniversesTable,
                          ResourceTrackDef
                        >(
                          currentTable: table,
                          referencedTable: $$UniversesTableReferences
                              ._resourceTrackDefsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UniversesTableReferences(
                                db,
                                table,
                                p0,
                              ).resourceTrackDefsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.universeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (currencyDefsRefs)
                        await $_getPrefetchedData<
                          Universe,
                          $UniversesTable,
                          CurrencyDef
                        >(
                          currentTable: table,
                          referencedTable: $$UniversesTableReferences
                              ._currencyDefsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UniversesTableReferences(
                                db,
                                table,
                                p0,
                              ).currencyDefsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.universeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (skillDefsRefs)
                        await $_getPrefetchedData<
                          Universe,
                          $UniversesTable,
                          SkillDef
                        >(
                          currentTable: table,
                          referencedTable: $$UniversesTableReferences
                              ._skillDefsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UniversesTableReferences(
                                db,
                                table,
                                p0,
                              ).skillDefsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.universeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (charactersRefs)
                        await $_getPrefetchedData<
                          Universe,
                          $UniversesTable,
                          Character
                        >(
                          currentTable: table,
                          referencedTable: $$UniversesTableReferences
                              ._charactersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UniversesTableReferences(
                                db,
                                table,
                                p0,
                              ).charactersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.universeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UniversesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UniversesTable,
      Universe,
      $$UniversesTableFilterComposer,
      $$UniversesTableOrderingComposer,
      $$UniversesTableAnnotationComposer,
      $$UniversesTableCreateCompanionBuilder,
      $$UniversesTableUpdateCompanionBuilder,
      (Universe, $$UniversesTableReferences),
      Universe,
      PrefetchHooks Function({
        bool statDefsRefs,
        bool resourceTrackDefsRefs,
        bool currencyDefsRefs,
        bool skillDefsRefs,
        bool charactersRefs,
      })
    >;
typedef $$StatDefsTableCreateCompanionBuilder =
    StatDefsCompanion Function({
      required String id,
      required String universeId,
      required String name,
      Value<String> abbreviation,
      required int orderIndex,
      Value<int> rowid,
    });
typedef $$StatDefsTableUpdateCompanionBuilder =
    StatDefsCompanion Function({
      Value<String> id,
      Value<String> universeId,
      Value<String> name,
      Value<String> abbreviation,
      Value<int> orderIndex,
      Value<int> rowid,
    });

final class $$StatDefsTableReferences
    extends BaseReferences<_$AppDatabase, $StatDefsTable, StatDef> {
  $$StatDefsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UniversesTable _universeIdTable(_$AppDatabase db) =>
      db.universes.createAlias(
        $_aliasNameGenerator(db.statDefs.universeId, db.universes.id),
      );

  $$UniversesTableProcessedTableManager get universeId {
    final $_column = $_itemColumn<String>('universe_id')!;

    final manager = $$UniversesTableTableManager(
      $_db,
      $_db.universes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_universeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$StatValuesTable, List<StatValue>>
  _statValuesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.statValues,
    aliasName: $_aliasNameGenerator(db.statDefs.id, db.statValues.statDefId),
  );

  $$StatValuesTableProcessedTableManager get statValuesRefs {
    final manager = $$StatValuesTableTableManager(
      $_db,
      $_db.statValues,
    ).filter((f) => f.statDefId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_statValuesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StatDefsTableFilterComposer
    extends Composer<_$AppDatabase, $StatDefsTable> {
  $$StatDefsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get abbreviation => $composableBuilder(
    column: $table.abbreviation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$UniversesTableFilterComposer get universeId {
    final $$UniversesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableFilterComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> statValuesRefs(
    Expression<bool> Function($$StatValuesTableFilterComposer f) f,
  ) {
    final $$StatValuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.statValues,
      getReferencedColumn: (t) => t.statDefId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatValuesTableFilterComposer(
            $db: $db,
            $table: $db.statValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StatDefsTableOrderingComposer
    extends Composer<_$AppDatabase, $StatDefsTable> {
  $$StatDefsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get abbreviation => $composableBuilder(
    column: $table.abbreviation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$UniversesTableOrderingComposer get universeId {
    final $$UniversesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableOrderingComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatDefsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StatDefsTable> {
  $$StatDefsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get abbreviation => $composableBuilder(
    column: $table.abbreviation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$UniversesTableAnnotationComposer get universeId {
    final $$UniversesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableAnnotationComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> statValuesRefs<T extends Object>(
    Expression<T> Function($$StatValuesTableAnnotationComposer a) f,
  ) {
    final $$StatValuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.statValues,
      getReferencedColumn: (t) => t.statDefId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatValuesTableAnnotationComposer(
            $db: $db,
            $table: $db.statValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StatDefsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StatDefsTable,
          StatDef,
          $$StatDefsTableFilterComposer,
          $$StatDefsTableOrderingComposer,
          $$StatDefsTableAnnotationComposer,
          $$StatDefsTableCreateCompanionBuilder,
          $$StatDefsTableUpdateCompanionBuilder,
          (StatDef, $$StatDefsTableReferences),
          StatDef,
          PrefetchHooks Function({bool universeId, bool statValuesRefs})
        > {
  $$StatDefsTableTableManager(_$AppDatabase db, $StatDefsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatDefsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatDefsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatDefsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> universeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> abbreviation = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StatDefsCompanion(
                id: id,
                universeId: universeId,
                name: name,
                abbreviation: abbreviation,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String universeId,
                required String name,
                Value<String> abbreviation = const Value.absent(),
                required int orderIndex,
                Value<int> rowid = const Value.absent(),
              }) => StatDefsCompanion.insert(
                id: id,
                universeId: universeId,
                name: name,
                abbreviation: abbreviation,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StatDefsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({universeId = false, statValuesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (statValuesRefs) db.statValues],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (universeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.universeId,
                                    referencedTable: $$StatDefsTableReferences
                                        ._universeIdTable(db),
                                    referencedColumn: $$StatDefsTableReferences
                                        ._universeIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (statValuesRefs)
                        await $_getPrefetchedData<
                          StatDef,
                          $StatDefsTable,
                          StatValue
                        >(
                          currentTable: table,
                          referencedTable: $$StatDefsTableReferences
                              ._statValuesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StatDefsTableReferences(
                                db,
                                table,
                                p0,
                              ).statValuesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.statDefId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StatDefsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StatDefsTable,
      StatDef,
      $$StatDefsTableFilterComposer,
      $$StatDefsTableOrderingComposer,
      $$StatDefsTableAnnotationComposer,
      $$StatDefsTableCreateCompanionBuilder,
      $$StatDefsTableUpdateCompanionBuilder,
      (StatDef, $$StatDefsTableReferences),
      StatDef,
      PrefetchHooks Function({bool universeId, bool statValuesRefs})
    >;
typedef $$ResourceTrackDefsTableCreateCompanionBuilder =
    ResourceTrackDefsCompanion Function({
      required String id,
      required String universeId,
      required String name,
      required int orderIndex,
      Value<int> rowid,
    });
typedef $$ResourceTrackDefsTableUpdateCompanionBuilder =
    ResourceTrackDefsCompanion Function({
      Value<String> id,
      Value<String> universeId,
      Value<String> name,
      Value<int> orderIndex,
      Value<int> rowid,
    });

final class $$ResourceTrackDefsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ResourceTrackDefsTable,
          ResourceTrackDef
        > {
  $$ResourceTrackDefsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UniversesTable _universeIdTable(_$AppDatabase db) =>
      db.universes.createAlias(
        $_aliasNameGenerator(db.resourceTrackDefs.universeId, db.universes.id),
      );

  $$UniversesTableProcessedTableManager get universeId {
    final $_column = $_itemColumn<String>('universe_id')!;

    final manager = $$UniversesTableTableManager(
      $_db,
      $_db.universes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_universeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ResourceValuesTable, List<ResourceValue>>
  _resourceValuesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.resourceValues,
    aliasName: $_aliasNameGenerator(
      db.resourceTrackDefs.id,
      db.resourceValues.resourceDefId,
    ),
  );

  $$ResourceValuesTableProcessedTableManager get resourceValuesRefs {
    final manager = $$ResourceValuesTableTableManager(
      $_db,
      $_db.resourceValues,
    ).filter((f) => f.resourceDefId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_resourceValuesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ResourceTrackDefsTableFilterComposer
    extends Composer<_$AppDatabase, $ResourceTrackDefsTable> {
  $$ResourceTrackDefsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$UniversesTableFilterComposer get universeId {
    final $$UniversesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableFilterComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> resourceValuesRefs(
    Expression<bool> Function($$ResourceValuesTableFilterComposer f) f,
  ) {
    final $$ResourceValuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resourceValues,
      getReferencedColumn: (t) => t.resourceDefId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourceValuesTableFilterComposer(
            $db: $db,
            $table: $db.resourceValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ResourceTrackDefsTableOrderingComposer
    extends Composer<_$AppDatabase, $ResourceTrackDefsTable> {
  $$ResourceTrackDefsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$UniversesTableOrderingComposer get universeId {
    final $$UniversesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableOrderingComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResourceTrackDefsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResourceTrackDefsTable> {
  $$ResourceTrackDefsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$UniversesTableAnnotationComposer get universeId {
    final $$UniversesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableAnnotationComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> resourceValuesRefs<T extends Object>(
    Expression<T> Function($$ResourceValuesTableAnnotationComposer a) f,
  ) {
    final $$ResourceValuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resourceValues,
      getReferencedColumn: (t) => t.resourceDefId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourceValuesTableAnnotationComposer(
            $db: $db,
            $table: $db.resourceValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ResourceTrackDefsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResourceTrackDefsTable,
          ResourceTrackDef,
          $$ResourceTrackDefsTableFilterComposer,
          $$ResourceTrackDefsTableOrderingComposer,
          $$ResourceTrackDefsTableAnnotationComposer,
          $$ResourceTrackDefsTableCreateCompanionBuilder,
          $$ResourceTrackDefsTableUpdateCompanionBuilder,
          (ResourceTrackDef, $$ResourceTrackDefsTableReferences),
          ResourceTrackDef,
          PrefetchHooks Function({bool universeId, bool resourceValuesRefs})
        > {
  $$ResourceTrackDefsTableTableManager(
    _$AppDatabase db,
    $ResourceTrackDefsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResourceTrackDefsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResourceTrackDefsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResourceTrackDefsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> universeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResourceTrackDefsCompanion(
                id: id,
                universeId: universeId,
                name: name,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String universeId,
                required String name,
                required int orderIndex,
                Value<int> rowid = const Value.absent(),
              }) => ResourceTrackDefsCompanion.insert(
                id: id,
                universeId: universeId,
                name: name,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ResourceTrackDefsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({universeId = false, resourceValuesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (resourceValuesRefs) db.resourceValues,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (universeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.universeId,
                                    referencedTable:
                                        $$ResourceTrackDefsTableReferences
                                            ._universeIdTable(db),
                                    referencedColumn:
                                        $$ResourceTrackDefsTableReferences
                                            ._universeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (resourceValuesRefs)
                        await $_getPrefetchedData<
                          ResourceTrackDef,
                          $ResourceTrackDefsTable,
                          ResourceValue
                        >(
                          currentTable: table,
                          referencedTable: $$ResourceTrackDefsTableReferences
                              ._resourceValuesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ResourceTrackDefsTableReferences(
                                db,
                                table,
                                p0,
                              ).resourceValuesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.resourceDefId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ResourceTrackDefsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResourceTrackDefsTable,
      ResourceTrackDef,
      $$ResourceTrackDefsTableFilterComposer,
      $$ResourceTrackDefsTableOrderingComposer,
      $$ResourceTrackDefsTableAnnotationComposer,
      $$ResourceTrackDefsTableCreateCompanionBuilder,
      $$ResourceTrackDefsTableUpdateCompanionBuilder,
      (ResourceTrackDef, $$ResourceTrackDefsTableReferences),
      ResourceTrackDef,
      PrefetchHooks Function({bool universeId, bool resourceValuesRefs})
    >;
typedef $$CurrencyDefsTableCreateCompanionBuilder =
    CurrencyDefsCompanion Function({
      required String id,
      required String universeId,
      required String name,
      required int orderIndex,
      Value<int> rowid,
    });
typedef $$CurrencyDefsTableUpdateCompanionBuilder =
    CurrencyDefsCompanion Function({
      Value<String> id,
      Value<String> universeId,
      Value<String> name,
      Value<int> orderIndex,
      Value<int> rowid,
    });

final class $$CurrencyDefsTableReferences
    extends BaseReferences<_$AppDatabase, $CurrencyDefsTable, CurrencyDef> {
  $$CurrencyDefsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UniversesTable _universeIdTable(_$AppDatabase db) =>
      db.universes.createAlias(
        $_aliasNameGenerator(db.currencyDefs.universeId, db.universes.id),
      );

  $$UniversesTableProcessedTableManager get universeId {
    final $_column = $_itemColumn<String>('universe_id')!;

    final manager = $$UniversesTableTableManager(
      $_db,
      $_db.universes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_universeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CurrencyValuesTable, List<CurrencyValue>>
  _currencyValuesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.currencyValues,
    aliasName: $_aliasNameGenerator(
      db.currencyDefs.id,
      db.currencyValues.currencyDefId,
    ),
  );

  $$CurrencyValuesTableProcessedTableManager get currencyValuesRefs {
    final manager = $$CurrencyValuesTableTableManager(
      $_db,
      $_db.currencyValues,
    ).filter((f) => f.currencyDefId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_currencyValuesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CurrencyDefsTableFilterComposer
    extends Composer<_$AppDatabase, $CurrencyDefsTable> {
  $$CurrencyDefsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$UniversesTableFilterComposer get universeId {
    final $$UniversesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableFilterComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> currencyValuesRefs(
    Expression<bool> Function($$CurrencyValuesTableFilterComposer f) f,
  ) {
    final $$CurrencyValuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.currencyValues,
      getReferencedColumn: (t) => t.currencyDefId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyValuesTableFilterComposer(
            $db: $db,
            $table: $db.currencyValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CurrencyDefsTableOrderingComposer
    extends Composer<_$AppDatabase, $CurrencyDefsTable> {
  $$CurrencyDefsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$UniversesTableOrderingComposer get universeId {
    final $$UniversesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableOrderingComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CurrencyDefsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CurrencyDefsTable> {
  $$CurrencyDefsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$UniversesTableAnnotationComposer get universeId {
    final $$UniversesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableAnnotationComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> currencyValuesRefs<T extends Object>(
    Expression<T> Function($$CurrencyValuesTableAnnotationComposer a) f,
  ) {
    final $$CurrencyValuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.currencyValues,
      getReferencedColumn: (t) => t.currencyDefId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyValuesTableAnnotationComposer(
            $db: $db,
            $table: $db.currencyValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CurrencyDefsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CurrencyDefsTable,
          CurrencyDef,
          $$CurrencyDefsTableFilterComposer,
          $$CurrencyDefsTableOrderingComposer,
          $$CurrencyDefsTableAnnotationComposer,
          $$CurrencyDefsTableCreateCompanionBuilder,
          $$CurrencyDefsTableUpdateCompanionBuilder,
          (CurrencyDef, $$CurrencyDefsTableReferences),
          CurrencyDef,
          PrefetchHooks Function({bool universeId, bool currencyValuesRefs})
        > {
  $$CurrencyDefsTableTableManager(_$AppDatabase db, $CurrencyDefsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CurrencyDefsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CurrencyDefsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CurrencyDefsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> universeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurrencyDefsCompanion(
                id: id,
                universeId: universeId,
                name: name,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String universeId,
                required String name,
                required int orderIndex,
                Value<int> rowid = const Value.absent(),
              }) => CurrencyDefsCompanion.insert(
                id: id,
                universeId: universeId,
                name: name,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CurrencyDefsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({universeId = false, currencyValuesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (currencyValuesRefs) db.currencyValues,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (universeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.universeId,
                                    referencedTable:
                                        $$CurrencyDefsTableReferences
                                            ._universeIdTable(db),
                                    referencedColumn:
                                        $$CurrencyDefsTableReferences
                                            ._universeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (currencyValuesRefs)
                        await $_getPrefetchedData<
                          CurrencyDef,
                          $CurrencyDefsTable,
                          CurrencyValue
                        >(
                          currentTable: table,
                          referencedTable: $$CurrencyDefsTableReferences
                              ._currencyValuesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CurrencyDefsTableReferences(
                                db,
                                table,
                                p0,
                              ).currencyValuesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.currencyDefId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CurrencyDefsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CurrencyDefsTable,
      CurrencyDef,
      $$CurrencyDefsTableFilterComposer,
      $$CurrencyDefsTableOrderingComposer,
      $$CurrencyDefsTableAnnotationComposer,
      $$CurrencyDefsTableCreateCompanionBuilder,
      $$CurrencyDefsTableUpdateCompanionBuilder,
      (CurrencyDef, $$CurrencyDefsTableReferences),
      CurrencyDef,
      PrefetchHooks Function({bool universeId, bool currencyValuesRefs})
    >;
typedef $$SkillDefsTableCreateCompanionBuilder =
    SkillDefsCompanion Function({
      required String id,
      required String universeId,
      required String name,
      Value<String?> linkedStatId,
      required int orderIndex,
      Value<int> rowid,
    });
typedef $$SkillDefsTableUpdateCompanionBuilder =
    SkillDefsCompanion Function({
      Value<String> id,
      Value<String> universeId,
      Value<String> name,
      Value<String?> linkedStatId,
      Value<int> orderIndex,
      Value<int> rowid,
    });

final class $$SkillDefsTableReferences
    extends BaseReferences<_$AppDatabase, $SkillDefsTable, SkillDef> {
  $$SkillDefsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UniversesTable _universeIdTable(_$AppDatabase db) =>
      db.universes.createAlias(
        $_aliasNameGenerator(db.skillDefs.universeId, db.universes.id),
      );

  $$UniversesTableProcessedTableManager get universeId {
    final $_column = $_itemColumn<String>('universe_id')!;

    final manager = $$UniversesTableTableManager(
      $_db,
      $_db.universes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_universeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SkillValuesTable, List<SkillValue>>
  _skillValuesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.skillValues,
    aliasName: $_aliasNameGenerator(db.skillDefs.id, db.skillValues.skillDefId),
  );

  $$SkillValuesTableProcessedTableManager get skillValuesRefs {
    final manager = $$SkillValuesTableTableManager(
      $_db,
      $_db.skillValues,
    ).filter((f) => f.skillDefId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_skillValuesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SkillDefsTableFilterComposer
    extends Composer<_$AppDatabase, $SkillDefsTable> {
  $$SkillDefsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkedStatId => $composableBuilder(
    column: $table.linkedStatId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$UniversesTableFilterComposer get universeId {
    final $$UniversesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableFilterComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> skillValuesRefs(
    Expression<bool> Function($$SkillValuesTableFilterComposer f) f,
  ) {
    final $$SkillValuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.skillValues,
      getReferencedColumn: (t) => t.skillDefId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillValuesTableFilterComposer(
            $db: $db,
            $table: $db.skillValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SkillDefsTableOrderingComposer
    extends Composer<_$AppDatabase, $SkillDefsTable> {
  $$SkillDefsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkedStatId => $composableBuilder(
    column: $table.linkedStatId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$UniversesTableOrderingComposer get universeId {
    final $$UniversesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableOrderingComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SkillDefsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SkillDefsTable> {
  $$SkillDefsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get linkedStatId => $composableBuilder(
    column: $table.linkedStatId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$UniversesTableAnnotationComposer get universeId {
    final $$UniversesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableAnnotationComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> skillValuesRefs<T extends Object>(
    Expression<T> Function($$SkillValuesTableAnnotationComposer a) f,
  ) {
    final $$SkillValuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.skillValues,
      getReferencedColumn: (t) => t.skillDefId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillValuesTableAnnotationComposer(
            $db: $db,
            $table: $db.skillValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SkillDefsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SkillDefsTable,
          SkillDef,
          $$SkillDefsTableFilterComposer,
          $$SkillDefsTableOrderingComposer,
          $$SkillDefsTableAnnotationComposer,
          $$SkillDefsTableCreateCompanionBuilder,
          $$SkillDefsTableUpdateCompanionBuilder,
          (SkillDef, $$SkillDefsTableReferences),
          SkillDef,
          PrefetchHooks Function({bool universeId, bool skillValuesRefs})
        > {
  $$SkillDefsTableTableManager(_$AppDatabase db, $SkillDefsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SkillDefsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SkillDefsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SkillDefsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> universeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> linkedStatId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SkillDefsCompanion(
                id: id,
                universeId: universeId,
                name: name,
                linkedStatId: linkedStatId,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String universeId,
                required String name,
                Value<String?> linkedStatId = const Value.absent(),
                required int orderIndex,
                Value<int> rowid = const Value.absent(),
              }) => SkillDefsCompanion.insert(
                id: id,
                universeId: universeId,
                name: name,
                linkedStatId: linkedStatId,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SkillDefsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({universeId = false, skillValuesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (skillValuesRefs) db.skillValues,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (universeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.universeId,
                                    referencedTable: $$SkillDefsTableReferences
                                        ._universeIdTable(db),
                                    referencedColumn: $$SkillDefsTableReferences
                                        ._universeIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (skillValuesRefs)
                        await $_getPrefetchedData<
                          SkillDef,
                          $SkillDefsTable,
                          SkillValue
                        >(
                          currentTable: table,
                          referencedTable: $$SkillDefsTableReferences
                              ._skillValuesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SkillDefsTableReferences(
                                db,
                                table,
                                p0,
                              ).skillValuesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.skillDefId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SkillDefsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SkillDefsTable,
      SkillDef,
      $$SkillDefsTableFilterComposer,
      $$SkillDefsTableOrderingComposer,
      $$SkillDefsTableAnnotationComposer,
      $$SkillDefsTableCreateCompanionBuilder,
      $$SkillDefsTableUpdateCompanionBuilder,
      (SkillDef, $$SkillDefsTableReferences),
      SkillDef,
      PrefetchHooks Function({bool universeId, bool skillValuesRefs})
    >;
typedef $$CharactersTableCreateCompanionBuilder =
    CharactersCompanion Function({
      required String id,
      required String universeId,
      required String name,
      Value<String> race,
      Value<int> level,
      Value<String> backstory,
      Value<String?> imagePath,
      Value<String> status,
      Value<String> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$CharactersTableUpdateCompanionBuilder =
    CharactersCompanion Function({
      Value<String> id,
      Value<String> universeId,
      Value<String> name,
      Value<String> race,
      Value<int> level,
      Value<String> backstory,
      Value<String?> imagePath,
      Value<String> status,
      Value<String> notes,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$CharactersTableReferences
    extends BaseReferences<_$AppDatabase, $CharactersTable, Character> {
  $$CharactersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UniversesTable _universeIdTable(_$AppDatabase db) =>
      db.universes.createAlias(
        $_aliasNameGenerator(db.characters.universeId, db.universes.id),
      );

  $$UniversesTableProcessedTableManager get universeId {
    final $_column = $_itemColumn<String>('universe_id')!;

    final manager = $$UniversesTableTableManager(
      $_db,
      $_db.universes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_universeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CharacterClassesTable, List<CharacterClass>>
  _characterClassesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.characterClasses,
    aliasName: $_aliasNameGenerator(
      db.characters.id,
      db.characterClasses.characterId,
    ),
  );

  $$CharacterClassesTableProcessedTableManager get characterClassesRefs {
    final manager = $$CharacterClassesTableTableManager(
      $_db,
      $_db.characterClasses,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _characterClassesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StatValuesTable, List<StatValue>>
  _statValuesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.statValues,
    aliasName: $_aliasNameGenerator(
      db.characters.id,
      db.statValues.characterId,
    ),
  );

  $$StatValuesTableProcessedTableManager get statValuesRefs {
    final manager = $$StatValuesTableTableManager(
      $_db,
      $_db.statValues,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_statValuesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ResourceValuesTable, List<ResourceValue>>
  _resourceValuesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.resourceValues,
    aliasName: $_aliasNameGenerator(
      db.characters.id,
      db.resourceValues.characterId,
    ),
  );

  $$ResourceValuesTableProcessedTableManager get resourceValuesRefs {
    final manager = $$ResourceValuesTableTableManager(
      $_db,
      $_db.resourceValues,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_resourceValuesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CurrencyValuesTable, List<CurrencyValue>>
  _currencyValuesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.currencyValues,
    aliasName: $_aliasNameGenerator(
      db.characters.id,
      db.currencyValues.characterId,
    ),
  );

  $$CurrencyValuesTableProcessedTableManager get currencyValuesRefs {
    final manager = $$CurrencyValuesTableTableManager(
      $_db,
      $_db.currencyValues,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_currencyValuesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SkillValuesTable, List<SkillValue>>
  _skillValuesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.skillValues,
    aliasName: $_aliasNameGenerator(
      db.characters.id,
      db.skillValues.characterId,
    ),
  );

  $$SkillValuesTableProcessedTableManager get skillValuesRefs {
    final manager = $$SkillValuesTableTableManager(
      $_db,
      $_db.skillValues,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_skillValuesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$InventoryItemsTable, List<InventoryItem>>
  _inventoryItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.inventoryItems,
    aliasName: $_aliasNameGenerator(
      db.characters.id,
      db.inventoryItems.characterId,
    ),
  );

  $$InventoryItemsTableProcessedTableManager get inventoryItemsRefs {
    final manager = $$InventoryItemsTableTableManager(
      $_db,
      $_db.inventoryItems,
    ).filter((f) => f.characterId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_inventoryItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CharactersTableFilterComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get race => $composableBuilder(
    column: $table.race,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backstory => $composableBuilder(
    column: $table.backstory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UniversesTableFilterComposer get universeId {
    final $$UniversesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableFilterComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> characterClassesRefs(
    Expression<bool> Function($$CharacterClassesTableFilterComposer f) f,
  ) {
    final $$CharacterClassesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterClasses,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterClassesTableFilterComposer(
            $db: $db,
            $table: $db.characterClasses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> statValuesRefs(
    Expression<bool> Function($$StatValuesTableFilterComposer f) f,
  ) {
    final $$StatValuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.statValues,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatValuesTableFilterComposer(
            $db: $db,
            $table: $db.statValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> resourceValuesRefs(
    Expression<bool> Function($$ResourceValuesTableFilterComposer f) f,
  ) {
    final $$ResourceValuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resourceValues,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourceValuesTableFilterComposer(
            $db: $db,
            $table: $db.resourceValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> currencyValuesRefs(
    Expression<bool> Function($$CurrencyValuesTableFilterComposer f) f,
  ) {
    final $$CurrencyValuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.currencyValues,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyValuesTableFilterComposer(
            $db: $db,
            $table: $db.currencyValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> skillValuesRefs(
    Expression<bool> Function($$SkillValuesTableFilterComposer f) f,
  ) {
    final $$SkillValuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.skillValues,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillValuesTableFilterComposer(
            $db: $db,
            $table: $db.skillValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> inventoryItemsRefs(
    Expression<bool> Function($$InventoryItemsTableFilterComposer f) f,
  ) {
    final $$InventoryItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inventoryItems,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InventoryItemsTableFilterComposer(
            $db: $db,
            $table: $db.inventoryItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get race => $composableBuilder(
    column: $table.race,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backstory => $composableBuilder(
    column: $table.backstory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UniversesTableOrderingComposer get universeId {
    final $$UniversesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableOrderingComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharactersTable> {
  $$CharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get race =>
      $composableBuilder(column: $table.race, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get backstory =>
      $composableBuilder(column: $table.backstory, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UniversesTableAnnotationComposer get universeId {
    final $$UniversesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.universeId,
      referencedTable: $db.universes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UniversesTableAnnotationComposer(
            $db: $db,
            $table: $db.universes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> characterClassesRefs<T extends Object>(
    Expression<T> Function($$CharacterClassesTableAnnotationComposer a) f,
  ) {
    final $$CharacterClassesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.characterClasses,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharacterClassesTableAnnotationComposer(
            $db: $db,
            $table: $db.characterClasses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> statValuesRefs<T extends Object>(
    Expression<T> Function($$StatValuesTableAnnotationComposer a) f,
  ) {
    final $$StatValuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.statValues,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatValuesTableAnnotationComposer(
            $db: $db,
            $table: $db.statValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> resourceValuesRefs<T extends Object>(
    Expression<T> Function($$ResourceValuesTableAnnotationComposer a) f,
  ) {
    final $$ResourceValuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.resourceValues,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourceValuesTableAnnotationComposer(
            $db: $db,
            $table: $db.resourceValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> currencyValuesRefs<T extends Object>(
    Expression<T> Function($$CurrencyValuesTableAnnotationComposer a) f,
  ) {
    final $$CurrencyValuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.currencyValues,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyValuesTableAnnotationComposer(
            $db: $db,
            $table: $db.currencyValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> skillValuesRefs<T extends Object>(
    Expression<T> Function($$SkillValuesTableAnnotationComposer a) f,
  ) {
    final $$SkillValuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.skillValues,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillValuesTableAnnotationComposer(
            $db: $db,
            $table: $db.skillValues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> inventoryItemsRefs<T extends Object>(
    Expression<T> Function($$InventoryItemsTableAnnotationComposer a) f,
  ) {
    final $$InventoryItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inventoryItems,
      getReferencedColumn: (t) => t.characterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InventoryItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.inventoryItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharactersTable,
          Character,
          $$CharactersTableFilterComposer,
          $$CharactersTableOrderingComposer,
          $$CharactersTableAnnotationComposer,
          $$CharactersTableCreateCompanionBuilder,
          $$CharactersTableUpdateCompanionBuilder,
          (Character, $$CharactersTableReferences),
          Character,
          PrefetchHooks Function({
            bool universeId,
            bool characterClassesRefs,
            bool statValuesRefs,
            bool resourceValuesRefs,
            bool currencyValuesRefs,
            bool skillValuesRefs,
            bool inventoryItemsRefs,
          })
        > {
  $$CharactersTableTableManager(_$AppDatabase db, $CharactersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharactersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharactersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharactersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> universeId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> race = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<String> backstory = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharactersCompanion(
                id: id,
                universeId: universeId,
                name: name,
                race: race,
                level: level,
                backstory: backstory,
                imagePath: imagePath,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String universeId,
                required String name,
                Value<String> race = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<String> backstory = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharactersCompanion.insert(
                id: id,
                universeId: universeId,
                name: name,
                race: race,
                level: level,
                backstory: backstory,
                imagePath: imagePath,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CharactersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                universeId = false,
                characterClassesRefs = false,
                statValuesRefs = false,
                resourceValuesRefs = false,
                currencyValuesRefs = false,
                skillValuesRefs = false,
                inventoryItemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (characterClassesRefs) db.characterClasses,
                    if (statValuesRefs) db.statValues,
                    if (resourceValuesRefs) db.resourceValues,
                    if (currencyValuesRefs) db.currencyValues,
                    if (skillValuesRefs) db.skillValues,
                    if (inventoryItemsRefs) db.inventoryItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (universeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.universeId,
                                    referencedTable: $$CharactersTableReferences
                                        ._universeIdTable(db),
                                    referencedColumn:
                                        $$CharactersTableReferences
                                            ._universeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (characterClassesRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          CharacterClass
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._characterClassesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).characterClassesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (statValuesRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          StatValue
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._statValuesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).statValuesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (resourceValuesRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          ResourceValue
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._resourceValuesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).resourceValuesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (currencyValuesRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          CurrencyValue
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._currencyValuesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).currencyValuesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (skillValuesRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          SkillValue
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._skillValuesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).skillValuesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (inventoryItemsRefs)
                        await $_getPrefetchedData<
                          Character,
                          $CharactersTable,
                          InventoryItem
                        >(
                          currentTable: table,
                          referencedTable: $$CharactersTableReferences
                              ._inventoryItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CharactersTableReferences(
                                db,
                                table,
                                p0,
                              ).inventoryItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.characterId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharactersTable,
      Character,
      $$CharactersTableFilterComposer,
      $$CharactersTableOrderingComposer,
      $$CharactersTableAnnotationComposer,
      $$CharactersTableCreateCompanionBuilder,
      $$CharactersTableUpdateCompanionBuilder,
      (Character, $$CharactersTableReferences),
      Character,
      PrefetchHooks Function({
        bool universeId,
        bool characterClassesRefs,
        bool statValuesRefs,
        bool resourceValuesRefs,
        bool currencyValuesRefs,
        bool skillValuesRefs,
        bool inventoryItemsRefs,
      })
    >;
typedef $$CharacterClassesTableCreateCompanionBuilder =
    CharacterClassesCompanion Function({
      required String id,
      required String characterId,
      required String className,
      Value<int> classLevel,
      required int orderIndex,
      Value<int> rowid,
    });
typedef $$CharacterClassesTableUpdateCompanionBuilder =
    CharacterClassesCompanion Function({
      Value<String> id,
      Value<String> characterId,
      Value<String> className,
      Value<int> classLevel,
      Value<int> orderIndex,
      Value<int> rowid,
    });

final class $$CharacterClassesTableReferences
    extends
        BaseReferences<_$AppDatabase, $CharacterClassesTable, CharacterClass> {
  $$CharacterClassesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharactersTable _characterIdTable(_$AppDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(db.characterClasses.characterId, db.characters.id),
      );

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CharacterClassesTableFilterComposer
    extends Composer<_$AppDatabase, $CharacterClassesTable> {
  $$CharacterClassesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get className => $composableBuilder(
    column: $table.className,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get classLevel => $composableBuilder(
    column: $table.classLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterClassesTableOrderingComposer
    extends Composer<_$AppDatabase, $CharacterClassesTable> {
  $$CharacterClassesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get className => $composableBuilder(
    column: $table.className,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get classLevel => $composableBuilder(
    column: $table.classLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterClassesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CharacterClassesTable> {
  $$CharacterClassesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get className =>
      $composableBuilder(column: $table.className, builder: (column) => column);

  GeneratedColumn<int> get classLevel => $composableBuilder(
    column: $table.classLevel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CharacterClassesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CharacterClassesTable,
          CharacterClass,
          $$CharacterClassesTableFilterComposer,
          $$CharacterClassesTableOrderingComposer,
          $$CharacterClassesTableAnnotationComposer,
          $$CharacterClassesTableCreateCompanionBuilder,
          $$CharacterClassesTableUpdateCompanionBuilder,
          (CharacterClass, $$CharacterClassesTableReferences),
          CharacterClass,
          PrefetchHooks Function({bool characterId})
        > {
  $$CharacterClassesTableTableManager(
    _$AppDatabase db,
    $CharacterClassesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterClassesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharacterClassesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharacterClassesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<String> className = const Value.absent(),
                Value<int> classLevel = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CharacterClassesCompanion(
                id: id,
                characterId: characterId,
                className: className,
                classLevel: classLevel,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String characterId,
                required String className,
                Value<int> classLevel = const Value.absent(),
                required int orderIndex,
                Value<int> rowid = const Value.absent(),
              }) => CharacterClassesCompanion.insert(
                id: id,
                characterId: characterId,
                className: className,
                classLevel: classLevel,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CharacterClassesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({characterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (characterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.characterId,
                                referencedTable:
                                    $$CharacterClassesTableReferences
                                        ._characterIdTable(db),
                                referencedColumn:
                                    $$CharacterClassesTableReferences
                                        ._characterIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CharacterClassesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CharacterClassesTable,
      CharacterClass,
      $$CharacterClassesTableFilterComposer,
      $$CharacterClassesTableOrderingComposer,
      $$CharacterClassesTableAnnotationComposer,
      $$CharacterClassesTableCreateCompanionBuilder,
      $$CharacterClassesTableUpdateCompanionBuilder,
      (CharacterClass, $$CharacterClassesTableReferences),
      CharacterClass,
      PrefetchHooks Function({bool characterId})
    >;
typedef $$StatValuesTableCreateCompanionBuilder =
    StatValuesCompanion Function({
      required String characterId,
      required String statDefId,
      Value<int> value,
      Value<int> rowid,
    });
typedef $$StatValuesTableUpdateCompanionBuilder =
    StatValuesCompanion Function({
      Value<String> characterId,
      Value<String> statDefId,
      Value<int> value,
      Value<int> rowid,
    });

final class $$StatValuesTableReferences
    extends BaseReferences<_$AppDatabase, $StatValuesTable, StatValue> {
  $$StatValuesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CharactersTable _characterIdTable(_$AppDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(db.statValues.characterId, db.characters.id),
      );

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StatDefsTable _statDefIdTable(_$AppDatabase db) =>
      db.statDefs.createAlias(
        $_aliasNameGenerator(db.statValues.statDefId, db.statDefs.id),
      );

  $$StatDefsTableProcessedTableManager get statDefId {
    final $_column = $_itemColumn<String>('stat_def_id')!;

    final manager = $$StatDefsTableTableManager(
      $_db,
      $_db.statDefs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_statDefIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StatValuesTableFilterComposer
    extends Composer<_$AppDatabase, $StatValuesTable> {
  $$StatValuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StatDefsTableFilterComposer get statDefId {
    final $$StatDefsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statDefId,
      referencedTable: $db.statDefs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatDefsTableFilterComposer(
            $db: $db,
            $table: $db.statDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatValuesTableOrderingComposer
    extends Composer<_$AppDatabase, $StatValuesTable> {
  $$StatValuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StatDefsTableOrderingComposer get statDefId {
    final $$StatDefsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statDefId,
      referencedTable: $db.statDefs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatDefsTableOrderingComposer(
            $db: $db,
            $table: $db.statDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatValuesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StatValuesTable> {
  $$StatValuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StatDefsTableAnnotationComposer get statDefId {
    final $$StatDefsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.statDefId,
      referencedTable: $db.statDefs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatDefsTableAnnotationComposer(
            $db: $db,
            $table: $db.statDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatValuesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StatValuesTable,
          StatValue,
          $$StatValuesTableFilterComposer,
          $$StatValuesTableOrderingComposer,
          $$StatValuesTableAnnotationComposer,
          $$StatValuesTableCreateCompanionBuilder,
          $$StatValuesTableUpdateCompanionBuilder,
          (StatValue, $$StatValuesTableReferences),
          StatValue,
          PrefetchHooks Function({bool characterId, bool statDefId})
        > {
  $$StatValuesTableTableManager(_$AppDatabase db, $StatValuesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatValuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatValuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatValuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> characterId = const Value.absent(),
                Value<String> statDefId = const Value.absent(),
                Value<int> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StatValuesCompanion(
                characterId: characterId,
                statDefId: statDefId,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String characterId,
                required String statDefId,
                Value<int> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StatValuesCompanion.insert(
                characterId: characterId,
                statDefId: statDefId,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StatValuesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({characterId = false, statDefId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (characterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.characterId,
                                referencedTable: $$StatValuesTableReferences
                                    ._characterIdTable(db),
                                referencedColumn: $$StatValuesTableReferences
                                    ._characterIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (statDefId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.statDefId,
                                referencedTable: $$StatValuesTableReferences
                                    ._statDefIdTable(db),
                                referencedColumn: $$StatValuesTableReferences
                                    ._statDefIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StatValuesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StatValuesTable,
      StatValue,
      $$StatValuesTableFilterComposer,
      $$StatValuesTableOrderingComposer,
      $$StatValuesTableAnnotationComposer,
      $$StatValuesTableCreateCompanionBuilder,
      $$StatValuesTableUpdateCompanionBuilder,
      (StatValue, $$StatValuesTableReferences),
      StatValue,
      PrefetchHooks Function({bool characterId, bool statDefId})
    >;
typedef $$ResourceValuesTableCreateCompanionBuilder =
    ResourceValuesCompanion Function({
      required String characterId,
      required String resourceDefId,
      Value<int> current,
      Value<int> maximum,
      Value<int> rowid,
    });
typedef $$ResourceValuesTableUpdateCompanionBuilder =
    ResourceValuesCompanion Function({
      Value<String> characterId,
      Value<String> resourceDefId,
      Value<int> current,
      Value<int> maximum,
      Value<int> rowid,
    });

final class $$ResourceValuesTableReferences
    extends BaseReferences<_$AppDatabase, $ResourceValuesTable, ResourceValue> {
  $$ResourceValuesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharactersTable _characterIdTable(_$AppDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(db.resourceValues.characterId, db.characters.id),
      );

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ResourceTrackDefsTable _resourceDefIdTable(_$AppDatabase db) =>
      db.resourceTrackDefs.createAlias(
        $_aliasNameGenerator(
          db.resourceValues.resourceDefId,
          db.resourceTrackDefs.id,
        ),
      );

  $$ResourceTrackDefsTableProcessedTableManager get resourceDefId {
    final $_column = $_itemColumn<String>('resource_def_id')!;

    final manager = $$ResourceTrackDefsTableTableManager(
      $_db,
      $_db.resourceTrackDefs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_resourceDefIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ResourceValuesTableFilterComposer
    extends Composer<_$AppDatabase, $ResourceValuesTable> {
  $$ResourceValuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get current => $composableBuilder(
    column: $table.current,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maximum => $composableBuilder(
    column: $table.maximum,
    builder: (column) => ColumnFilters(column),
  );

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ResourceTrackDefsTableFilterComposer get resourceDefId {
    final $$ResourceTrackDefsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.resourceDefId,
      referencedTable: $db.resourceTrackDefs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourceTrackDefsTableFilterComposer(
            $db: $db,
            $table: $db.resourceTrackDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResourceValuesTableOrderingComposer
    extends Composer<_$AppDatabase, $ResourceValuesTable> {
  $$ResourceValuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get current => $composableBuilder(
    column: $table.current,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maximum => $composableBuilder(
    column: $table.maximum,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ResourceTrackDefsTableOrderingComposer get resourceDefId {
    final $$ResourceTrackDefsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.resourceDefId,
      referencedTable: $db.resourceTrackDefs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourceTrackDefsTableOrderingComposer(
            $db: $db,
            $table: $db.resourceTrackDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResourceValuesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResourceValuesTable> {
  $$ResourceValuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get current =>
      $composableBuilder(column: $table.current, builder: (column) => column);

  GeneratedColumn<int> get maximum =>
      $composableBuilder(column: $table.maximum, builder: (column) => column);

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ResourceTrackDefsTableAnnotationComposer get resourceDefId {
    final $$ResourceTrackDefsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.resourceDefId,
          referencedTable: $db.resourceTrackDefs,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ResourceTrackDefsTableAnnotationComposer(
                $db: $db,
                $table: $db.resourceTrackDefs,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$ResourceValuesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResourceValuesTable,
          ResourceValue,
          $$ResourceValuesTableFilterComposer,
          $$ResourceValuesTableOrderingComposer,
          $$ResourceValuesTableAnnotationComposer,
          $$ResourceValuesTableCreateCompanionBuilder,
          $$ResourceValuesTableUpdateCompanionBuilder,
          (ResourceValue, $$ResourceValuesTableReferences),
          ResourceValue,
          PrefetchHooks Function({bool characterId, bool resourceDefId})
        > {
  $$ResourceValuesTableTableManager(
    _$AppDatabase db,
    $ResourceValuesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResourceValuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResourceValuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResourceValuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> characterId = const Value.absent(),
                Value<String> resourceDefId = const Value.absent(),
                Value<int> current = const Value.absent(),
                Value<int> maximum = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResourceValuesCompanion(
                characterId: characterId,
                resourceDefId: resourceDefId,
                current: current,
                maximum: maximum,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String characterId,
                required String resourceDefId,
                Value<int> current = const Value.absent(),
                Value<int> maximum = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResourceValuesCompanion.insert(
                characterId: characterId,
                resourceDefId: resourceDefId,
                current: current,
                maximum: maximum,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ResourceValuesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({characterId = false, resourceDefId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (characterId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.characterId,
                                    referencedTable:
                                        $$ResourceValuesTableReferences
                                            ._characterIdTable(db),
                                    referencedColumn:
                                        $$ResourceValuesTableReferences
                                            ._characterIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (resourceDefId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.resourceDefId,
                                    referencedTable:
                                        $$ResourceValuesTableReferences
                                            ._resourceDefIdTable(db),
                                    referencedColumn:
                                        $$ResourceValuesTableReferences
                                            ._resourceDefIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ResourceValuesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResourceValuesTable,
      ResourceValue,
      $$ResourceValuesTableFilterComposer,
      $$ResourceValuesTableOrderingComposer,
      $$ResourceValuesTableAnnotationComposer,
      $$ResourceValuesTableCreateCompanionBuilder,
      $$ResourceValuesTableUpdateCompanionBuilder,
      (ResourceValue, $$ResourceValuesTableReferences),
      ResourceValue,
      PrefetchHooks Function({bool characterId, bool resourceDefId})
    >;
typedef $$CurrencyValuesTableCreateCompanionBuilder =
    CurrencyValuesCompanion Function({
      required String characterId,
      required String currencyDefId,
      Value<int> amount,
      Value<int> rowid,
    });
typedef $$CurrencyValuesTableUpdateCompanionBuilder =
    CurrencyValuesCompanion Function({
      Value<String> characterId,
      Value<String> currencyDefId,
      Value<int> amount,
      Value<int> rowid,
    });

final class $$CurrencyValuesTableReferences
    extends BaseReferences<_$AppDatabase, $CurrencyValuesTable, CurrencyValue> {
  $$CurrencyValuesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharactersTable _characterIdTable(_$AppDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(db.currencyValues.characterId, db.characters.id),
      );

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CurrencyDefsTable _currencyDefIdTable(_$AppDatabase db) =>
      db.currencyDefs.createAlias(
        $_aliasNameGenerator(
          db.currencyValues.currencyDefId,
          db.currencyDefs.id,
        ),
      );

  $$CurrencyDefsTableProcessedTableManager get currencyDefId {
    final $_column = $_itemColumn<String>('currency_def_id')!;

    final manager = $$CurrencyDefsTableTableManager(
      $_db,
      $_db.currencyDefs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyDefIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CurrencyValuesTableFilterComposer
    extends Composer<_$AppDatabase, $CurrencyValuesTable> {
  $$CurrencyValuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyDefsTableFilterComposer get currencyDefId {
    final $$CurrencyDefsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyDefId,
      referencedTable: $db.currencyDefs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyDefsTableFilterComposer(
            $db: $db,
            $table: $db.currencyDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CurrencyValuesTableOrderingComposer
    extends Composer<_$AppDatabase, $CurrencyValuesTable> {
  $$CurrencyValuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyDefsTableOrderingComposer get currencyDefId {
    final $$CurrencyDefsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyDefId,
      referencedTable: $db.currencyDefs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyDefsTableOrderingComposer(
            $db: $db,
            $table: $db.currencyDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CurrencyValuesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CurrencyValuesTable> {
  $$CurrencyValuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CurrencyDefsTableAnnotationComposer get currencyDefId {
    final $$CurrencyDefsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currencyDefId,
      referencedTable: $db.currencyDefs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CurrencyDefsTableAnnotationComposer(
            $db: $db,
            $table: $db.currencyDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CurrencyValuesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CurrencyValuesTable,
          CurrencyValue,
          $$CurrencyValuesTableFilterComposer,
          $$CurrencyValuesTableOrderingComposer,
          $$CurrencyValuesTableAnnotationComposer,
          $$CurrencyValuesTableCreateCompanionBuilder,
          $$CurrencyValuesTableUpdateCompanionBuilder,
          (CurrencyValue, $$CurrencyValuesTableReferences),
          CurrencyValue,
          PrefetchHooks Function({bool characterId, bool currencyDefId})
        > {
  $$CurrencyValuesTableTableManager(
    _$AppDatabase db,
    $CurrencyValuesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CurrencyValuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CurrencyValuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CurrencyValuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> characterId = const Value.absent(),
                Value<String> currencyDefId = const Value.absent(),
                Value<int> amount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurrencyValuesCompanion(
                characterId: characterId,
                currencyDefId: currencyDefId,
                amount: amount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String characterId,
                required String currencyDefId,
                Value<int> amount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurrencyValuesCompanion.insert(
                characterId: characterId,
                currencyDefId: currencyDefId,
                amount: amount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CurrencyValuesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({characterId = false, currencyDefId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (characterId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.characterId,
                                    referencedTable:
                                        $$CurrencyValuesTableReferences
                                            ._characterIdTable(db),
                                    referencedColumn:
                                        $$CurrencyValuesTableReferences
                                            ._characterIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (currencyDefId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currencyDefId,
                                    referencedTable:
                                        $$CurrencyValuesTableReferences
                                            ._currencyDefIdTable(db),
                                    referencedColumn:
                                        $$CurrencyValuesTableReferences
                                            ._currencyDefIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$CurrencyValuesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CurrencyValuesTable,
      CurrencyValue,
      $$CurrencyValuesTableFilterComposer,
      $$CurrencyValuesTableOrderingComposer,
      $$CurrencyValuesTableAnnotationComposer,
      $$CurrencyValuesTableCreateCompanionBuilder,
      $$CurrencyValuesTableUpdateCompanionBuilder,
      (CurrencyValue, $$CurrencyValuesTableReferences),
      CurrencyValue,
      PrefetchHooks Function({bool characterId, bool currencyDefId})
    >;
typedef $$SkillValuesTableCreateCompanionBuilder =
    SkillValuesCompanion Function({
      required String characterId,
      required String skillDefId,
      Value<int> value,
      Value<bool> proficient,
      Value<int> rowid,
    });
typedef $$SkillValuesTableUpdateCompanionBuilder =
    SkillValuesCompanion Function({
      Value<String> characterId,
      Value<String> skillDefId,
      Value<int> value,
      Value<bool> proficient,
      Value<int> rowid,
    });

final class $$SkillValuesTableReferences
    extends BaseReferences<_$AppDatabase, $SkillValuesTable, SkillValue> {
  $$SkillValuesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CharactersTable _characterIdTable(_$AppDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(db.skillValues.characterId, db.characters.id),
      );

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SkillDefsTable _skillDefIdTable(_$AppDatabase db) =>
      db.skillDefs.createAlias(
        $_aliasNameGenerator(db.skillValues.skillDefId, db.skillDefs.id),
      );

  $$SkillDefsTableProcessedTableManager get skillDefId {
    final $_column = $_itemColumn<String>('skill_def_id')!;

    final manager = $$SkillDefsTableTableManager(
      $_db,
      $_db.skillDefs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_skillDefIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SkillValuesTableFilterComposer
    extends Composer<_$AppDatabase, $SkillValuesTable> {
  $$SkillValuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get proficient => $composableBuilder(
    column: $table.proficient,
    builder: (column) => ColumnFilters(column),
  );

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SkillDefsTableFilterComposer get skillDefId {
    final $$SkillDefsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.skillDefId,
      referencedTable: $db.skillDefs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillDefsTableFilterComposer(
            $db: $db,
            $table: $db.skillDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SkillValuesTableOrderingComposer
    extends Composer<_$AppDatabase, $SkillValuesTable> {
  $$SkillValuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get proficient => $composableBuilder(
    column: $table.proficient,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SkillDefsTableOrderingComposer get skillDefId {
    final $$SkillDefsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.skillDefId,
      referencedTable: $db.skillDefs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillDefsTableOrderingComposer(
            $db: $db,
            $table: $db.skillDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SkillValuesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SkillValuesTable> {
  $$SkillValuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<bool> get proficient => $composableBuilder(
    column: $table.proficient,
    builder: (column) => column,
  );

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SkillDefsTableAnnotationComposer get skillDefId {
    final $$SkillDefsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.skillDefId,
      referencedTable: $db.skillDefs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillDefsTableAnnotationComposer(
            $db: $db,
            $table: $db.skillDefs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SkillValuesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SkillValuesTable,
          SkillValue,
          $$SkillValuesTableFilterComposer,
          $$SkillValuesTableOrderingComposer,
          $$SkillValuesTableAnnotationComposer,
          $$SkillValuesTableCreateCompanionBuilder,
          $$SkillValuesTableUpdateCompanionBuilder,
          (SkillValue, $$SkillValuesTableReferences),
          SkillValue,
          PrefetchHooks Function({bool characterId, bool skillDefId})
        > {
  $$SkillValuesTableTableManager(_$AppDatabase db, $SkillValuesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SkillValuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SkillValuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SkillValuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> characterId = const Value.absent(),
                Value<String> skillDefId = const Value.absent(),
                Value<int> value = const Value.absent(),
                Value<bool> proficient = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SkillValuesCompanion(
                characterId: characterId,
                skillDefId: skillDefId,
                value: value,
                proficient: proficient,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String characterId,
                required String skillDefId,
                Value<int> value = const Value.absent(),
                Value<bool> proficient = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SkillValuesCompanion.insert(
                characterId: characterId,
                skillDefId: skillDefId,
                value: value,
                proficient: proficient,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SkillValuesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({characterId = false, skillDefId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (characterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.characterId,
                                referencedTable: $$SkillValuesTableReferences
                                    ._characterIdTable(db),
                                referencedColumn: $$SkillValuesTableReferences
                                    ._characterIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (skillDefId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.skillDefId,
                                referencedTable: $$SkillValuesTableReferences
                                    ._skillDefIdTable(db),
                                referencedColumn: $$SkillValuesTableReferences
                                    ._skillDefIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SkillValuesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SkillValuesTable,
      SkillValue,
      $$SkillValuesTableFilterComposer,
      $$SkillValuesTableOrderingComposer,
      $$SkillValuesTableAnnotationComposer,
      $$SkillValuesTableCreateCompanionBuilder,
      $$SkillValuesTableUpdateCompanionBuilder,
      (SkillValue, $$SkillValuesTableReferences),
      SkillValue,
      PrefetchHooks Function({bool characterId, bool skillDefId})
    >;
typedef $$InventoryItemsTableCreateCompanionBuilder =
    InventoryItemsCompanion Function({
      required String id,
      required String characterId,
      required String name,
      Value<String> quality,
      Value<int> quantity,
      Value<String> description,
      Value<bool> equipped,
      Value<String> category,
      Value<double> weight,
      Value<double> itemValue,
      required int orderIndex,
      Value<int> rowid,
    });
typedef $$InventoryItemsTableUpdateCompanionBuilder =
    InventoryItemsCompanion Function({
      Value<String> id,
      Value<String> characterId,
      Value<String> name,
      Value<String> quality,
      Value<int> quantity,
      Value<String> description,
      Value<bool> equipped,
      Value<String> category,
      Value<double> weight,
      Value<double> itemValue,
      Value<int> orderIndex,
      Value<int> rowid,
    });

final class $$InventoryItemsTableReferences
    extends BaseReferences<_$AppDatabase, $InventoryItemsTable, InventoryItem> {
  $$InventoryItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CharactersTable _characterIdTable(_$AppDatabase db) =>
      db.characters.createAlias(
        $_aliasNameGenerator(db.inventoryItems.characterId, db.characters.id),
      );

  $$CharactersTableProcessedTableManager get characterId {
    final $_column = $_itemColumn<String>('character_id')!;

    final manager = $$CharactersTableTableManager(
      $_db,
      $_db.characters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_characterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InventoryItemsTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quality => $composableBuilder(
    column: $table.quality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get equipped => $composableBuilder(
    column: $table.equipped,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get itemValue => $composableBuilder(
    column: $table.itemValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$CharactersTableFilterComposer get characterId {
    final $$CharactersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableFilterComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quality => $composableBuilder(
    column: $table.quality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get equipped => $composableBuilder(
    column: $table.equipped,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get itemValue => $composableBuilder(
    column: $table.itemValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$CharactersTableOrderingComposer get characterId {
    final $$CharactersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableOrderingComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get quality =>
      $composableBuilder(column: $table.quality, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get equipped =>
      $composableBuilder(column: $table.equipped, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get itemValue =>
      $composableBuilder(column: $table.itemValue, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$CharactersTableAnnotationComposer get characterId {
    final $$CharactersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.characterId,
      referencedTable: $db.characters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CharactersTableAnnotationComposer(
            $db: $db,
            $table: $db.characters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InventoryItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InventoryItemsTable,
          InventoryItem,
          $$InventoryItemsTableFilterComposer,
          $$InventoryItemsTableOrderingComposer,
          $$InventoryItemsTableAnnotationComposer,
          $$InventoryItemsTableCreateCompanionBuilder,
          $$InventoryItemsTableUpdateCompanionBuilder,
          (InventoryItem, $$InventoryItemsTableReferences),
          InventoryItem,
          PrefetchHooks Function({bool characterId})
        > {
  $$InventoryItemsTableTableManager(
    _$AppDatabase db,
    $InventoryItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> characterId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> quality = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> equipped = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<double> itemValue = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InventoryItemsCompanion(
                id: id,
                characterId: characterId,
                name: name,
                quality: quality,
                quantity: quantity,
                description: description,
                equipped: equipped,
                category: category,
                weight: weight,
                itemValue: itemValue,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String characterId,
                required String name,
                Value<String> quality = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<bool> equipped = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<double> itemValue = const Value.absent(),
                required int orderIndex,
                Value<int> rowid = const Value.absent(),
              }) => InventoryItemsCompanion.insert(
                id: id,
                characterId: characterId,
                name: name,
                quality: quality,
                quantity: quantity,
                description: description,
                equipped: equipped,
                category: category,
                weight: weight,
                itemValue: itemValue,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InventoryItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({characterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (characterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.characterId,
                                referencedTable: $$InventoryItemsTableReferences
                                    ._characterIdTable(db),
                                referencedColumn:
                                    $$InventoryItemsTableReferences
                                        ._characterIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InventoryItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InventoryItemsTable,
      InventoryItem,
      $$InventoryItemsTableFilterComposer,
      $$InventoryItemsTableOrderingComposer,
      $$InventoryItemsTableAnnotationComposer,
      $$InventoryItemsTableCreateCompanionBuilder,
      $$InventoryItemsTableUpdateCompanionBuilder,
      (InventoryItem, $$InventoryItemsTableReferences),
      InventoryItem,
      PrefetchHooks Function({bool characterId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UniversesTableTableManager get universes =>
      $$UniversesTableTableManager(_db, _db.universes);
  $$StatDefsTableTableManager get statDefs =>
      $$StatDefsTableTableManager(_db, _db.statDefs);
  $$ResourceTrackDefsTableTableManager get resourceTrackDefs =>
      $$ResourceTrackDefsTableTableManager(_db, _db.resourceTrackDefs);
  $$CurrencyDefsTableTableManager get currencyDefs =>
      $$CurrencyDefsTableTableManager(_db, _db.currencyDefs);
  $$SkillDefsTableTableManager get skillDefs =>
      $$SkillDefsTableTableManager(_db, _db.skillDefs);
  $$CharactersTableTableManager get characters =>
      $$CharactersTableTableManager(_db, _db.characters);
  $$CharacterClassesTableTableManager get characterClasses =>
      $$CharacterClassesTableTableManager(_db, _db.characterClasses);
  $$StatValuesTableTableManager get statValues =>
      $$StatValuesTableTableManager(_db, _db.statValues);
  $$ResourceValuesTableTableManager get resourceValues =>
      $$ResourceValuesTableTableManager(_db, _db.resourceValues);
  $$CurrencyValuesTableTableManager get currencyValues =>
      $$CurrencyValuesTableTableManager(_db, _db.currencyValues);
  $$SkillValuesTableTableManager get skillValues =>
      $$SkillValuesTableTableManager(_db, _db.skillValues);
  $$InventoryItemsTableTableManager get inventoryItems =>
      $$InventoryItemsTableTableManager(_db, _db.inventoryItems);
}
