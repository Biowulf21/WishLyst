import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlyst/bucket_list/data/model/bucket_list_item.dart';
import 'package:wishlyst/bucket_list/data/repository/local_bucket_list_repository.dart';

part 'bucket_list_event.dart';
part 'bucket_list_state.dart';

class BucketListBloc extends Bloc<BucketListEvent, BucketListState> {
  BucketListBloc(this._repository) : super(BucketListInitialState()) {
    on<AddBucketListItemEvent>(_addBucketListItem);
    on<GetBucketListItemsEvent>(_getBucketListItems);
    on<DeleteBucketListItemEvent>(_deleteBucketListItem);
    on<SetCompletedBucketListItemEvent>(_setCompletedBucketListItem);
  }

  final LocalDBBucketListRepository _repository;

  Future<void> _getBucketListItems(
    GetBucketListItemsEvent event,
    Emitter<BucketListState> emit,
  ) async {
    //TODO implement caching properly
    emit(BucketListLoadingState());
    final bucketListItems = await _repository.getBucketListItems();
    emit(BucketListUpdatedState(items: bucketListItems));
  }

  Future<void> _addBucketListItem(
    AddBucketListItemEvent event,
    Emitter<BucketListState> emit,
  ) async {
    await _repository.saveBucketListItem(event.bucketListItem);
    final result = await _repository.getBucketListItems();

    final updatedItems = List<BucketListItem>.from(state.items)
      ..insert(0, event.bucketListItem);

    emit(BucketListUpdatedState(items: updatedItems));
  }

  Future<void> _deleteBucketListItem(
      DeleteBucketListItemEvent event, Emitter<BucketListState> emit) async {
    await _repository.deleteBucketListItem(event.id);
    final updatedItems =
        state.items.where((item) => item.id != event.id).toList();

    emit(BucketListUpdatedState(items: updatedItems));
  }

  Future<void> _setCompletedBucketListItem(
      SetCompletedBucketListItemEvent event,
      Emitter<BucketListState> emit) async {
    await _repository.setCompletedBucketListItem(event.id);
  }
}
