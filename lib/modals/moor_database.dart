import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'moor_database.g.dart';

// table class for creating table interface
// all our columns will be here
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get desc => text().withLength(max: 50, min: 1)();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get isChecked => boolean().withDefault(Constant(false))();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.

  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

// Database class
// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(tables: [Tasks], daos: [TaskDao])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor

  AppDatabase() : super(_openConnection());

  @override
  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  int get schemaVersion => 1;
}

// DAO class (DATA ACCESSING OBJECT)
// from here we will be querying the database
@DriftAccessor(tables: [Tasks])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  // a new database object
  final AppDatabase db;
  // initializing the database object and passing to the DatabaseAccessor class
  TaskDao(this.db) : super(db);

  Future<List<Task>> getAllTasks() => select(tasks).get();
  // realtime changes in database
  Stream<List<Task>> watchAllTasks() => select(tasks).watch();

  Future insertTask(TasksCompanion task) => into(tasks).insert(task);
  // return Future<int> but we will not accept it
  Future deleteTask(TasksCompanion task) => delete(tasks).delete(task);
  Future updateTask(TasksCompanion task) => update(tasks).replace(task);
}
