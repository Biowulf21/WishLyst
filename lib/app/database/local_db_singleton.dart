import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'utils/local_db_config.dart';

class LocalDatabaseSingleton {
  LocalDatabaseSingleton._internal();

  static final LocalDatabaseSingleton _singleton =
      LocalDatabaseSingleton._internal();

  late LocalDBConfig _config;
  late Database _database;

  factory LocalDatabaseSingleton(LocalDBConfig config) {
    _singleton._config = config;
    _singleton._initDB();
    return _singleton;
  }

  Future<Database> get database async {
    if (_database != null) {
      return database;
    }

    _database = await _initDB();
    return database;
  }

  Future<Database> _initDB() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(_config.path, _config.dbName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS bucket_list_items (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      itemName TEXT NOT NULL,
      description TEXT,
      isCompleted INTEGER NOT NULL,
      dateCreated TEXT NOT NULL,
      dateDeleted TEXT,
      dateCompleted TEXT,
      dateUpdated TEXT
    );
  ''');
  }
}
