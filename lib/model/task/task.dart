import 'package:hive/hive.dart';

import 'task_controller.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  late String tempId;

  @HiveField(1)
  String? realId;

  @HiveField(2)
  late String content;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? parentTempId;

  @HiveField(5)
  String? parentRealId;

  @HiveField(6)
  int? childOrder;

  @HiveField(7)
  late bool isChecked;

  @HiveField(8)
  String? categoryTempId;

  @HiveField(9)
  String? categoryRealId;

  //?Use String format; Would make it easier to store whateverformat comes from the BE
  @HiveField(10)
  String? due;

  @HiveField(11)
  String? isSynced;

  @HiveField(12)
  String? lastUpdateDate;

  TaskController get asController {
    return TaskController.fromHive(
      this,
      tempId,
      content,
      isChecked,
      description,
      parentTempId,
      categoryTempId,
      due,
      childOrder,
    );
  }

  @override
  Future<void> save() {
    lastUpdateDate = DateTime.now().toString();

    return super.save();
  }
}
