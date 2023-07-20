// ignore_for_file: depend_on_referenced_packages

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

  Map<String, List<TaskController>> getTasksByCategories() {
    final groupedByCategories = groupBy(
      _allTasks,
      (TaskController element) => element.categoryTempId.toString(),
    );

    return groupedByCategories;
  }

  RxList<TaskController> getTasksByCategory(CategoryController category) {
    final groupedByCategory = _allTasks
        .where((p0) => p0.categoryTempId.value == category.tempId.value);

    return RxList(groupedByCategory.toList());
  }

  RxList<TaskController> get dueToday {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    final tasksDueToday = _allTasks
        .where((p0) => DateTime.parse(p0.due.value ?? '2022-12-22') == today);

    return RxList(tasksDueToday.toList());
  }

  void onCategoryDeleted(CategoryController category){
    _allTasks.forEach((element) {
      element.removeCategory();
    });

  }

  //For now let's test
  void addTaskFromValues(String content) {
    final newTask = Task()
      ..content = content
      ..tempId = DateTime.now().toString()
      ..isChecked = false;

    // newTask.save(); ///Todo: Check if this returns an erro

    box.put(newTask.tempId, newTask);

    _allTasks.add(newTask.asController); 
  }

  void addTask(Task task) {
    box.put(task.tempId, task); 

    _allTasks.add(task.asController); 
  }

  void deleteTask(TaskController task) {
    box.delete(task.tempId); //DB

    _allTasks.remove(task); //runtine memory
  }

  void toggleCheck(TaskController task) {
    task.isChecked.value = !task.isChecked.value; 

    task.hive.isChecked = task.isChecked.value;
    task.hive.save(); 
  }
}
