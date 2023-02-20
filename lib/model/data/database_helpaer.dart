import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yuksalish_1/model/data/task.dart';


class DatabaseHelper {
  static final DatabaseHelper intance = DatabaseHelper._instance();

  static Database? _db;

  DatabaseHelper._instance();

  String tableName = "tableName";
  final String colId = "id";
  final String colTitle = "title";
  final String colDescription = "description";
  final String colPrice = "price";
  final String colCharacteristic = "characteristic";
  final String colCategory = "category";

  Future<Database?> get db async {
    return _db ?? await _initDB();
  }

  Future<Database?> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentsDirectory.path}todo.db";

    _db = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      db.execute("CREATE TABLE $tableName ("
          "$colId INTEGER PRIMARY KEY,"
          "$colTitle TEXT,"
          "$colDescription TEXT,"
          "$colPrice TEXT,"
          "$colCharacteristic TEXT,"
          "$colCategory TEXT"
          ")");
    });
    return _db;
  }

  Future<Task> insert(Task task) async {
    final data = await db;
    task.id = await data?.insert(tableName, task.toMap());
    return task;
  }

  Future<List<Map<String, Object?>>?> getTaskMap() async {
    final data = await db;
    final List<Map<String, Object?>>? result = await data?.query(tableName);
    return result;
  }

  Future<List<Task>> getTasks() async {
    final List<Map<String, Object?>>? taskMap = await getTaskMap();
    final List<Task> tasks = [];
     taskMap?.forEach((element)  {
       tasks.add(Task.fromMap(element));
    });
    return tasks;
  }

  Future<int?> delete(int taskID) async {
    final data = await db;
    return await data
        ?.delete(tableName, where: "$colId = ?", whereArgs: [taskID]);
  }

  Future<int?> update(Task task) async {
    final data = await db;
    return await data?.update(tableName, task.toMap(),
        where: '$colId = ?', whereArgs: [task.id]);
  }
}
