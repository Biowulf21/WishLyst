import 'package:wishlyst/app/database/local_db_singleton.dart';
import 'package:wishlyst/bucket_list/bucket_list.dart';

class LocalDBBucketListRepository implements BucketListRepository {
  LocalDBBucketListRepository(this._dbSingleton);
  final LocalDatabaseSingleton _dbSingleton;

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
  Future<void> saveBucketListItem(BucketListItem bucketListItem) async {
    final db = await _dbSingleton.database;
    try {
      await db.insert('bucket_list_items', bucketListItem.toJson());
    } catch (e) {
      //handle exception
      
    }
  }

  @override
  Future<void> updateBucketListItem(BucketListItem bucketListItem) {
    // TODO: implement updateBucketListItem
    throw UnimplementedError();
  }
}
