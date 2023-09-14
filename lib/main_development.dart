import 'package:flutter/material.dart';
import 'package:wishlyst/app/app.dart';
import 'package:wishlyst/app/database/local_db_singleton.dart';
import 'package:wishlyst/app/database/utils/local_db_config.dart';
import 'package:wishlyst/app/env.dart';
import 'package:wishlyst/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final values = FlavorValues(
    baseURL: 'https://api.dev.wishlyst.com',
    localDBName: 'dev_wishlyst.db',
    localDBPath: '',
  );

  FlavorConfig(flavor: Flavor.DEV, values: values);

  final config =
      LocalDBConfig(path: values.localDBPath, dbName: values.localDBName);
  final singleton = LocalDatabaseSingleton(config);

  bootstrap(() => const App());
}
