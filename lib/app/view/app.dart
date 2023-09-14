import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlyst/app/database/local_db_singleton.dart';
import 'package:wishlyst/bucket_list/data/repository/local_bucket_list_repository.dart';
import 'package:wishlyst/bucket_list/view/bucket_list_page.dart';
import 'package:wishlyst/l10n/l10n.dart';

class App extends StatelessWidget {
  App({required this.singleton})
      : localRepository = LocalDBBucketListRepository(singleton),
        super();

  final LocalDatabaseSingleton singleton;
  final LocalDBBucketListRepository localRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: localRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const BucketListPage(),
    );
  }
}
