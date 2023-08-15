import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'task_hive.g.dart';

@HiveType(typeId: 10)
class SyncTask extends HiveObject {
  @HiveField(0)
  late String tempId;

  @HiveField(1)
  String? content;

  @HiveField(2)
  String? description;

  @HiveField(3)
  bool? isChecked;

  @HiveField(4)
  String? categoryTempId;

  @HiveField(5)
  String? due;

  @HiveField(7)
  String? creationDateTime;

  @HiveField(8)
  late String actionType;

  @HiveField(9)
  late String uuid;

  bool isUUIDSet() {
    try {
      uuid.length;

      return true;
    } catch (e) {
      return false;
    }
  }

  bool isActionTypeSet() {
    try {
      actionType.length;

      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> toJson() {
    final values = {
      'content': content,
      'discription': description,
      'is_checked': isChecked,
      'catagory_id': categoryTempId,
      'due': due,
    };

    values.removeWhere((key, value) => value == null);

    return values;
  }
}
