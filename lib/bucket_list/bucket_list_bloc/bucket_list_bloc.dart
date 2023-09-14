import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wishlyst/bucket_list/data/model/bucket_list_item.dart';

part 'bucket_list_event.dart';
part 'bucket_list_state.dart';

class BucketListBloc extends Bloc<BucketListEvent, BucketListState> {
  BucketListBloc() : super(BucketListInitialState(items: const [])) {
    on<AddBucketListItemEvent>(_addBucketListItem);
  }

  void _addBucketListItem(
    AddBucketListItemEvent event,
    Emitter<BucketListState> emit,
  ) {
    final updatedItems = List<BucketListItem>.from(state.items)
      ..add(event.bucketListItem);
    emit(BucketListUpdatedState(items: updatedItems));
  }
}
