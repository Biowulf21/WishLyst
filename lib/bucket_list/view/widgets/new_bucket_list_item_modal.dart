import 'package:flutter/material.dart';
import 'package:wishlyst/bucket_list/bucket_list_bloc/bucket_list_bloc.dart';
import 'package:wishlyst/bucket_list/data/model/bucket_list_item.dart';
import 'dart:math';

class NewBucketListItemModal extends StatefulWidget {
  NewBucketListItemModal({
    required this.bloc,
    required this.descriptionController,
    required this.titleController,
    required this.key,
  });

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> key;

  BucketListBloc bloc;

  @override
  State<NewBucketListItemModal> createState() => _NewBucketListItemModalState();
}

class _NewBucketListItemModalState extends State<NewBucketListItemModal> {
  //TODO: implement in a utils class
  int generateUniqueId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(999999);
    return timestamp + random;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          padding: const EdgeInsets.all(25),
          child: Form(
            key: widget.key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Add New Bucket List Item',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: widget.titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Item Name'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: widget.descriptionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    bool isFormValid = widget.key.currentState!.validate();

                    if (isFormValid) {
                      final bucketListItem = BucketListItem(
                        id: generateUniqueId(),
                        itemName: widget.titleController.value.text,
                        description: widget.descriptionController.value.text,
                        dateCreated: DateTime.now(),
                      );

                      widget.bloc.add(AddBucketListItemEvent(bucketListItem));
                    }

                    Navigator.of(context).pop();
                  },
                  child: const Text('Add Item'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
