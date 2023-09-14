import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlyst/bucket_list/bloc/bucket_list_bloc/bucket_list_bloc.dart';
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
  const BucketListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const BucketListItemWidget();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
