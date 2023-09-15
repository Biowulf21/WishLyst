import 'package:wishlyst/bucket_list/data/model/bucket_list_item.dart';

abstract class BucketListRepository {
  Future<List<BucketListItem>> getBucketListItems();

  Future<void> saveBucketListItem(BucketListItem bucketListItem);

  Future<int> deleteBucketListItem(int id);

  Future<int> deleteCompletedBucketListItems(List<int> ids);

  Future<void> updateBucketListItem(BucketListItem bucketListItem);

  Future<void> completeBucketListItem(int id);
}
