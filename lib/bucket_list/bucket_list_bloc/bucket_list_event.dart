part of 'bucket_list_bloc.dart';

@immutable
sealed class BucketListEvent extends Equatable {
  const BucketListEvent();

  @override
  List<Object?> get props => [];
}

class BucketListInitialEvent extends BucketListEvent {}

class GetBucketListItemsEvent extends BucketListEvent {}

class AddBucketListItemEvent extends BucketListEvent {
  const AddBucketListItemEvent(this.bucketListItem);
  final BucketListItem bucketListItem;

  @override
  List<Object?> get props => [bucketListItem];
}

class DeleteBucketListItemEvent extends BucketListEvent {
  const DeleteBucketListItemEvent(this.id);
  final int id;
}

class UpdateBucketListItemEvent extends BucketListEvent {
  const UpdateBucketListItemEvent(this.bucketListItems);
  final BucketListItem bucketListItems;

  @override
  List<Object?> get props => [bucketListItems];
}

class SetCompletedBucketListItemEvent extends BucketListEvent {
  const SetCompletedBucketListItemEvent({
    required this.id,
    this.isComplete = true,
  });

  final bool isComplete;
  final int id;
}
