import 'package:flutter/material.dart';
import 'package:wishlyst/bucket_list/data/model/bucket_list_item.dart';

class BucketListItemWidget extends StatelessWidget {
  const BucketListItemWidget({required this.item, super.key});
  final BucketListItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.itemName),
      subtitle: Text(item.description),
    );
  }
}
