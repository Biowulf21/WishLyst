part of 'bucket_list_bloc.dart';

abstract class BucketListState extends Equatable {
  const BucketListState({required this.items, this.errorMessage});

  final List<BucketListItem> items;
  final String? errorMessage;

  @override
  List<Object?> get props => [items, errorMessage];
}

class BucketListInitialState extends BucketListState {
  BucketListInitialState() : super(items: []);
}

class BucketListLoadingState extends BucketListState {
  BucketListLoadingState() : super(items: []);
}

class BucketListUpdatedState extends BucketListState {
  const BucketListUpdatedState({required super.items});
}

class BucketListErrorState extends BucketListState {
  BucketListErrorState({required String message})
      : super(items: [], errorMessage: message);
}
