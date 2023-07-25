import 'package:flutter_todo/model/category/category_controller.dart';
import 'package:flutter_todo/model/task/task.dart';
import 'package:flutter_todo/model/task/task_controller.dart';
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
    _allTasks = RxList(); // init it first

    for (var element in storedTasks) {
      _allTasks.add(element.asController);
    }
  }

  RxList<TaskController> get getAllTasks => _allTasks;

  void onCategoryDeleted(CategoryController category) {
    for (var element in _allTasks.where(
      (p0) => p0.categoryTempId.value == category.tempId.value,
    )) {
      element.removeCategory();
    }
  }

  //For now let's test
  void addTaskFromValues(String content) {
    final newTask = Task()
      ..content = content
      ..tempId = DateTime.now().toString()
      ..isChecked = false;

    box.put(newTask.tempId, newTask);

    _allTasks.add(newTask.asController);
  }

  void addTask(Task task) {
    box.put(task.tempId, task);

    _allTasks.add(task.asController);
  }

  void deleteTask(TaskController task) {
    box.delete(task.tempId);

    _allTasks.remove(task);
  }

  void toggleCheck(TaskController task) {
    task.isChecked.value = !task.isChecked.value;

    task.hive.isChecked = task.isChecked.value;
    task.hive.save();
  }
}
