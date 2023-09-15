import 'package:equatable/equatable.dart';

class BucketListItem extends Equatable {
  BucketListItem(
      {required this.itemName,
      required this.description,
      required this.dateCreated,
      this.isComplete = false,
      this.dateDeleted,
      this.dateCompleted,
      this.dateUpdated});

  factory BucketListItem.fromJson(Map<String, dynamic> json) {
    return BucketListItem(
      itemName: json['itemName'] as String,
      description: json['description'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      isComplete: json['isComplete'] == 1 ? true : false,
      dateDeleted: json['dateDeleted'] != null
          ? DateTime.parse(json['dateDeleted'] as String)
          : null,
      dateCompleted: json['dateCompleted'] != null
          ? DateTime.parse(json['dateCompleted'] as String)
          : null,
      dateUpdated: json['dateUpdated'] != null
          ? DateTime.parse(json['dateUpdated'] as String)
          : null,
    );
  }
  String itemName;
  bool? isComplete;
  String description;
  DateTime dateCreated;
  DateTime? dateDeleted;
  DateTime? dateCompleted;
  DateTime? dateUpdated;

  @override
  List<Object?> get props => [
        itemName,
        description,
        dateCreated,
        isComplete,
        dateDeleted,
        dateCompleted,
        dateUpdated
      ];

  Map<String, dynamic> toJson() => {
        'itemName': itemName,
        'description': description,
        'dateCreated': dateCreated.toIso8601String(),
        'isComplete': isComplete,
        'dateDeleted': dateDeleted?.toIso8601String(),
        'dateCompleted': dateCompleted?.toIso8601String(),
        'dateUpdated': dateUpdated?.toIso8601String()
      };

  BucketListItem copyWith() {
    return BucketListItem(
      itemName: itemName,
      description: description,
      dateCreated: dateCreated,
      isComplete: isComplete,
      dateDeleted: dateDeleted,
      dateCompleted: dateCompleted,
      dateUpdated: dateUpdated,
    );
  }
}
