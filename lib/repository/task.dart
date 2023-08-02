import 'package:flutter_todo/model/category/category_controller.dart';
import 'package:flutter_todo/model/task/task.dart';
import 'package:flutter_todo/model/task/task_controller.dart';
import 'package:flutter_todo/sync/usecases/task_sync.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';

class TaskRepository extends GetxController {
  final box = Hive.box<Task>('tasks');

  late final RxList<TaskController> _allTasks;

  @override
  void onInit() {
    super.onInit();

    final storedTasks = box.values;

    _allTasks = RxList();

    for (var element in storedTasks) {
      _allTasks.add(element.asController);
    }
  }

  void refreshFromDB() {
    final storedTasks = box.values;

    for (var element in storedTasks) {
      _allTasks.addIf(
        _allTasks.where((p0) => p0.tempId.value == element.tempId).isEmpty,
        element.asController,
      );
    }

    update();
  }

  RxList<TaskController> get getAllTasks => _allTasks;

  void onCategoryDeleted(CategoryController category) {
    for (var element in _allTasks.where(
      (p0) => p0.categoryTempId.value == category.tempId.value,
    )) {
      element.removeCategory();
    }
  }

  void addTask(Task task) {
    box.put(task.tempId, task);

    _allTasks.add(task.asController);

    TaskSyncHelper.addTask(
      content: task.content,
      tempId: task.tempId,
      categoryTempId: task.categoryTempId,
      description: task.description,
      due: task.due,
      isChecked: task.isChecked,
    );
  }

  void deleteTask(TaskController task) {
    task.hiveInstance.delete();

    _allTasks.remove(task);

    TaskSyncHelper.delete(tempId: task.tempId.value);
  }

  void toggleCheck(TaskController task) {
    task.isChecked.value = !task.isChecked.value;

    task.hive.isChecked = task.isChecked.value;
    task.hive.save();

    TaskSyncHelper.toggleIsChecked(
      tempId: task.tempId.value,
      isChecked: task.hive.isChecked,
    );
  }

  Task getHiveTaskByTempId(String id) {
    return box.values.where((p0) => p0.tempId == id).first;
  }

  bool hasHiveTaskWithTempId(String tempId) {
    return box.values.where((p0) => p0.tempId == tempId).isNotEmpty;
  }
}
