import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wishlyst/bucket_list/bucket_list_bloc/bucket_list_bloc.dart';
import 'package:wishlyst/bucket_list/data/model/bucket_list_item.dart';

class BucketListItemWidget extends StatelessWidget {
  const BucketListItemWidget({
    required this.item,
    required this.index,
    super.key,
  });
  final BucketListItem item;
  final int index;

  Future<void> _deleteBucketListItem(BuildContext context) async {
    final bloc = BlocProvider.of<BucketListBloc>(context)
      ..add(DeleteBucketListItemEvent(item.id!));
  }

  Future<void> _markBucketListItemComplete(
    BuildContext context,
    bool newValue,
  ) async {
    print(newValue);
    final bloc = BlocProvider.of<BucketListBloc>(context);
    final updatedItem = item.copyWith(isCompleteValue: newValue);

    bloc.add(
      SetCompletedBucketListItemEvent(
        bucketListItem: updatedItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: _deleteBucketListItem,
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (BuildContext context) =>
                _markBucketListItemComplete(context, true),
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.check,
            label: 'Complete',
          ),
        ],
      ),
      child: ListTile(
        title: Text(item.itemName),
        subtitle: Text(item.description),
        trailing: Checkbox(
          value: item.isComplete,
          onChanged: (bool? newValue) {
            _markBucketListItemComplete(context, newValue!);
          },
        ),
      ),
    );
  }
}
