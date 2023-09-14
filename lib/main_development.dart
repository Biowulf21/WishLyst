import 'package:flutter/material.dart';
import 'package:wishlyst/app/app.dart';
import 'package:wishlyst/app/database/local_db_singleton.dart';
import 'package:wishlyst/app/database/utils/local_db_config.dart';
import 'package:wishlyst/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final config = LocalDBConfig(path: 'local/', dbName: 'dev_wishlyst.db');
  final singleton = LocalDatabaseSingleton(config);

  bootstrap(() => const App());
}
