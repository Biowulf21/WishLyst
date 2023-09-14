import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlyst/bucket_list/bloc/events/bucket_list_event.dart';
import 'package:wishlyst/bucket_list/data/model/bucket_list_item.dart';

class BucketListBloc extends Bloc<BucketListItemEvent, BucketListItem?> {
  BucketListBloc() : super(null) {
    on<CreateBucketListItemEvent>((event, emit) {});
  }
}
