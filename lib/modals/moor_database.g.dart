// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String desc;
  final DateTime? dueDate;
  final bool isChecked;
  Task(
      {required this.id,
      required this.desc,
      this.dueDate,
      required this.isChecked});
  factory Task.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Task(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc'])!,
      dueDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
      isChecked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_checked'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['desc'] = Variable<String>(desc);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime?>(dueDate);
    }
    map['is_checked'] = Variable<bool>(isChecked);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      desc: Value(desc),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      isChecked: Value(isChecked),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      desc: serializer.fromJson<String>(json['desc']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'desc': serializer.toJson<String>(desc),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'isChecked': serializer.toJson<bool>(isChecked),
    };
  }

  Task copyWith({int? id, String? desc, DateTime? dueDate, bool? isChecked}) =>
      Task(
        id: id ?? this.id,
        desc: desc ?? this.desc,
        dueDate: dueDate ?? this.dueDate,
        isChecked: isChecked ?? this.isChecked,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('desc: $desc, ')
          ..write('dueDate: $dueDate, ')
          ..write('isChecked: $isChecked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, desc, dueDate, isChecked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.desc == this.desc &&
          other.dueDate == this.dueDate &&
          other.isChecked == this.isChecked);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> desc;
  final Value<DateTime?> dueDate;
  final Value<bool> isChecked;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.desc = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.isChecked = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String desc,
    this.dueDate = const Value.absent(),
    this.isChecked = const Value.absent(),
  }) : desc = Value(desc);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? desc,
    Expression<DateTime?>? dueDate,
    Expression<bool>? isChecked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (desc != null) 'desc': desc,
      if (dueDate != null) 'due_date': dueDate,
      if (isChecked != null) 'is_checked': isChecked,
    });
  }

  TasksCompanion copyWith(
      {Value<int>? id,
      Value<String>? desc,
      Value<DateTime?>? dueDate,
      Value<bool>? isChecked}) {
    return TasksCompanion(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      dueDate: dueDate ?? this.dueDate,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime?>(dueDate.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('desc: $desc, ')
          ..write('dueDate: $dueDate, ')
          ..write('isChecked: $isChecked')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String?> desc = GeneratedColumn<String?>(
      'desc', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime?> dueDate = GeneratedColumn<DateTime?>(
      'due_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _isCheckedMeta = const VerificationMeta('isChecked');
  @override
  late final GeneratedColumn<bool?> isChecked = GeneratedColumn<bool?>(
      'is_checked', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_checked IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, desc, dueDate, isChecked];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Task.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TasksTable tasks = $TasksTable(this);
  late final TaskDao taskDao = TaskDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$TaskDaoMixin on DatabaseAccessor<AppDatabase> {
  $TasksTable get tasks => attachedDatabase.tasks;
}
