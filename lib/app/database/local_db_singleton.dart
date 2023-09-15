import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'utils/local_db_config.dart';

class LocalDatabaseSingleton {
  LocalDatabaseSingleton._internal();

  static final LocalDatabaseSingleton _singleton =
      LocalDatabaseSingleton._internal();

  late LocalDBConfig _config;
  late Database? _database;

  bool _isInitialized = false;

  factory LocalDatabaseSingleton(LocalDBConfig config) {
    _singleton._config = config;
    _singleton._initDB();
    return _singleton;
  }

  Future<Database> get database async {
    if (!_isInitialized) {
      await _initDB();
    }

    return _database!;
  }

  Future<void> _initDB() async {
    if (_isInitialized) {
      return;
    }

    final String databasesPath = await getDatabasesPath();
    final String path = join(_config.path, _config.dbName);
    _database = await openDatabase(path, version: 1, onCreate: _onCreate);
    _isInitialized = true;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS bucket_list_items (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      itemName TEXT NOT NULL,
      description TEXT,
      isComplete INTEGER NOT NULL,
      dateCreated TEXT NOT NULL,
      dateDeleted TEXT,
      dateCompleted TEXT,
      dateUpdated TEXT
    );
  ''');
  }
}
