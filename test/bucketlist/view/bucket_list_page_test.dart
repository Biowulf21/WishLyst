import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart'; // Import mocktail
import 'package:wishlyst/bucket_list/bucket_list.dart';
import 'package:wishlyst/bucket_list/bucket_list_bloc/bucket_list_bloc.dart';
import 'package:wishlyst/bucket_list/data/repository/local_bucket_list_repository.dart';

void main() {
  // Create a mock repository for testing
  final mockRepository = MockLocalDBBucketListRepository();

  // Create a mock Bloc for testing
  final mockBloc = MockBucketListBloc();

  final bucketList = [
    BucketListItem(
      itemName: 'first task',
      description: 'desc 1',
      dateCreated: DateTime.now(),
    ),
    BucketListItem(
      itemName: 'second task',
      description: 'desc 2',
      dateCreated: DateTime.now(),
    ),
    BucketListItem(
      itemName: 'third task',
      description: 'desc 3',
      dateCreated: DateTime.now(),
    )
  ];

  testWidgets('Test BucketListPage Widget', (WidgetTester tester) async {
    when(mockRepository.getBucketListItems).thenAnswer((_) async {
      return bucketList;
    });

    await tester.pumpWidget(
      MaterialApp(
        home: RepositoryProvider<LocalDBBucketListRepository>(
          create: (_) => mockRepository,
          child: BlocProvider<BucketListBloc>(
            create: (_) => mockBloc,
            child: const BucketListPage(),
          ),
        ),
      ),
    );

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.text('Add something to your bucket list!'), findsOneWidget);
  });
}

class MockLocalDBBucketListRepository extends Mock
    implements LocalDBBucketListRepository {}

class MockBucketListBloc extends Mock implements BucketListBloc {}
