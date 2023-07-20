import 'package:flutter_todo/model/task/task.dart';
import 'package:flutter_todo/model/task/task_controller.dart';
import 'package:flutter_todo/repository/category.dart';
import 'package:flutter_todo/repository/task.dart';
import 'package:flutter_todo/shared/functions/date_functions.dart';
import 'package:get/get.dart';


class HomePageViewModel extends GetxController {
  final TaskRepository taskRepository = Get.find();
  final CategoryRepository categoryRepository = Get.find();
  RxString currentTab = 'My Day'.obs; //Todo: Declare properly

  List<String> getTabs() {
    final storedCatagories = categoryRepository.categories;
    final defaultTabs = [
      'My Day',
      'All'
    ]; //Todo: Store default tabs somewhere else

    return [
      ...defaultTabs,
      ...storedCatagories.map((element) => element.title.toString()).toList()
    ];
  }

  RxList<TaskController> getTasks() {
    if (currentTab.value == 'All') {
      return taskRepository.getAllTasks;
    }

    if (currentTab.value == 'My Day') {
      return taskRepository.dueToday;
    }

    final tabAsCategory =
        categoryRepository.getCategoryByName(currentTab.value);

    return taskRepository.getTasksByCategory(tabAsCategory);
  }

  void setTab(String categoryTitle) {
    currentTab(categoryTitle);
    update();
  }

  void toggleCheck(TaskController task) => taskRepository.toggleCheck(task);

  void deleteTask(TaskController task) => taskRepository.deleteTask(task);

  void addTaskFromScratch(
    String title, {
    String? description,
    DateTime? dueDate,
    String? categoryTempId,
  }) {
    final tempId = DateTime.now().toString();

    final String? formatedDate =
        dueDate == null ? null : dateFormatter.format(dueDate);

    final newTask = Task()
      ..content = title
      ..description = description
      ..tempId = tempId
      ..categoryTempId = categoryTempId
      ..due = formatedDate
      ..isChecked = false;

    taskRepository.addTask(newTask);
  }
}
