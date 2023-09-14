import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlyst/bucket_list/bucket_list_bloc/bucket_list_bloc.dart';
import 'package:wishlyst/bucket_list/data/model/bucket_list_item.dart';
import 'package:wishlyst/bucket_list/view/widgets/bucket_list_item_widget.dart';

class BucketListPage extends StatelessWidget {
  const BucketListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BucketListBloc(),
      child: BucketListView(),
    );
  }
}

class BucketListView extends StatelessWidget {
  BucketListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BucketListBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<BucketListBloc, BucketListState>(
        builder: (context, state) {
          if (state is BucketListUpdatedState && state.items.isEmpty) {
            return const Center(
              child: Text('Add something to your bucketlist!'),
            );
          } else if (state is BucketListLoadingState) {
            print('loading');
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BucketListUpdatedState) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                print('item count is ${state.items.length}');
                final item = state.items[index];
                return BucketListItemWidget();
              },
            );
          } else {
            return const Center(
              child: Text('Add something to your bucket list!'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final bucketListItem = BucketListItem(
            id: 1,
            itemName: 'test',
            description: 'desc',
            dateCreated: DateTime.now(),
          );

          // Use the bloc obtained from the context to dispatch the event
          bloc.add(AddBucketListItemEvent(bucketListItem));
        },
      ),
    );
  }
}
