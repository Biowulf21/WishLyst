import 'package:equatable/equatable.dart';

class BucketListItem extends Equatable {
  int id;
  String itemName;
  bool? isComplete = false;
  String description;
  DateTime dateCreated;
  DateTime? dateDeleted;
  DateTime? dateCompleted;
  DateTime? dateUpdated;

  BucketListItem(
      {required this.id,
      required this.itemName,
      required this.description,
      required this.dateCreated,
      this.isComplete,
      this.dateDeleted,
      this.dateCompleted,
      this.dateUpdated});

  @override
  List<Object?> get props => [
        id,
        itemName,
        description,
        dateCreated,
        isComplete,
        dateDeleted,
        dateCompleted,
        dateUpdated
      ];

  factory BucketListItem.fromJson(Map<String, dynamic> json) {
    return BucketListItem(
      id: json['id'] as int,
      itemName: json['itemName'] as String,
      description: json['description'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      isComplete: json['isComplete'] as bool,
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

  Map<String, dynamic> toJson() => {
        'id': id,
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
      id: id,
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
