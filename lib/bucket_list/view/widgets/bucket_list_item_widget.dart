import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wishlyst/bucket_list/data/model/bucket_list_item.dart';

class BucketListItemWidget extends StatelessWidget {
  const BucketListItemWidget(
      {required this.item, required this.index, super.key});
  final BucketListItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(index),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),
      child: ListTile(
        title: Text(item.itemName),
        subtitle: Text(item.description),
      ),
    );
  }
}
