import 'package:wishlyst/bucket_list/bucket_list.dart';

class RemoteDBBucketListRepository implements BucketListRepository {
  @override
  Future<void> completeBucketListItem(int id) {
    // TODO: implement completeBucketListItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBucketListItem(int id) {
    // TODO: implement deleteBucketListItem
    throw UnimplementedError();
  }

  @override
  Future<int> deleteCompletedBucketListItems(List<int> ids) {
    // TODO: implement deleteCompletedBucketListItems
    throw UnimplementedError();
  }

  @override
  Stream<List<BucketListItem>> getBucketListItems() {
    // TODO: implement getBucketListItems
    throw UnimplementedError();
  }

  @override
  Future<void> saveBucketListItem(BucketListItem bucketListItem) {
    // TODO: implement saveBucketListItem
    throw UnimplementedError();
  }

  @override
  Future<void> updateBucketListItem(BucketListItem bucketListItem) {
    // TODO: implement updateBucketListItem
    throw UnimplementedError();
  }
}
