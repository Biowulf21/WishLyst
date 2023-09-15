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
  Future<int> deleteBucketListItem(int id) async {
    final db = await _dbSingleton.database;
    //TODO: Implement softdeletes
    final result =
        await db.delete('bucket_list_items', where: 'id = ?', whereArgs: [id]);
    return 1;
  }

  @override
  Future<int> deleteCompletedBucketListItems(List<int> ids) {
    // TODO: implement deleteCompletedBucketListItems
    throw UnimplementedError();
  }

  @override
  Future<List<BucketListItem>> getBucketListItems() async {
    final db = await _dbSingleton.database;
    final result =
        await db.query('bucket_list_items', orderBy: 'dateCreated DESC');
    print(result);

    final bucketListItems = result.map((item) {
      return BucketListItem.fromJson(item);
    }).toList();

    return bucketListItems;
  }

  @override
  Future<void> saveBucketListItem(BucketListItem bucketListItem) async {
    final db = await _dbSingleton.database;
    try {
      await db.insert('bucket_list_items', bucketListItem.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> setCompletedBucketListItem({
    required BucketListItem item,
  }) async {
    final bucketListItem = item;

    final db = await _dbSingleton.database;
    await db.update(
      'bucket_list_items',
      bucketListItem.toJson(),
      where: 'id = ?',
      whereArgs: [bucketListItem.id],
    );
  }

  @override
  Future<void> updateBucketListItem(BucketListItem bucketListItem) async {
    final db = await _dbSingleton.database;
    bucketListItem.dateUpdated = DateTime.now();

    final result = await db.update(
      'bucket_list_items',
      bucketListItem.toJson(),
      where: 'id = ?',
      whereArgs: [bucketListItem.id],
    );
  }
}
