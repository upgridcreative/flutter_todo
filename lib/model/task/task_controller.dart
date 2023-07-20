import 'package:flutter_todo/model/task/task.dart';
import 'package:flutter_todo/shared/functions/date_functions.dart';
import 'package:get/state_manager.dart';

class TaskController extends GetxController {
  // final box = Hive.box('tasks');
  late Task hiveInstance;

  late Rx<String> tempId;
  late Rx<String> content;
  late Rx<bool> isChecked;

  Rxn<String> description = Rxn<String>();
  Rxn<String> parentTempId = Rxn<String>();
  Rxn<String> categoryTempId = Rxn<String>();
  Rxn<String> due = Rxn<String>();

  Rxn<int> childOrder = Rxn<int>();

  TaskController({
    required this.tempId,
    required this.content,
    required this.isChecked,
    description,
    parentTempId,
    categoryTempId,
    due,
    childOrder,
  }) {
    this.description.value = description;
    this.parentTempId.value = parentTempId;
    this.categoryTempId.value = categoryTempId;
    this.due.value = due;
    this.childOrder.value = childOrder;
  }

  TaskController.fromHive(
    this.hiveInstance,
    String tempId,
    String content,
    bool isChecked,
    String? description,
    String? parentTempId,
    String? categoryTempId,
    String? due,
    int? childOrder,
  ) {
    this.tempId = RxString(tempId);
    this.content = RxString(content);
    this.isChecked = RxBool(isChecked);

    this.description.value = description;
    this.parentTempId.value = parentTempId;
    this.categoryTempId.value = categoryTempId;
    this.due.value = due;
    this.childOrder.value = childOrder;
  }

  Task get hive => hiveInstance;

  void updateTask(String content) {
    this.content.value = content;
    update(); // Update the User interface
  }
  void updateDescription(String description) {
    this.description.value = description;
    update(); // Update the User interface
  }

  void setCategory(String tempId) {
    categoryTempId(tempId);

    hiveInstance.categoryTempId = tempId;
    hiveInstance.save();

    update();
  }

  void setDueDate(DateTime? newDate) {
    final formattedDate =
        newDate == null ? null : dateFormatter.format(newDate);

    due.value = formattedDate;
    
    hive.due = formattedDate;
    hiveInstance.save();

    update();
  }

  bool get isDue {
    final now = DateTime.now();

    return DateTime.parse(due.value!).isAtSameMomentAs(
      DateTime(now.year, now.month, now.day),
    );
  }
}
