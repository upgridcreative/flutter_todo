import 'package:collection/collection.dart';
import '../model/category/category_controller.dart';
import '../model/task/task.dart';
import '../model/task/task_controller.dart';
import '../repository/category.dart';
import '../repository/task.dart';
import '../shared/functions/date_functions.dart';
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
      return dueToday;
    }

    final tabAsCategory =
        categoryRepository.getCategoryByName(currentTab.value);

    return getTasksByCategory(tabAsCategory);
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


  RxList<TaskController> get dueToday {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    final tasksDueToday = taskRepository.getAllTasks
        .where((p0) => DateTime.parse(p0.due.value ?? '2022-12-22') == today);

    return RxList(tasksDueToday.toList());
  }

    Map<String, List<TaskController>> getTasksByCategories() {
    final groupedByCategories = groupBy(
      taskRepository.getAllTasks,
      (TaskController element) => element.categoryTempId.toString(),
    );

    return groupedByCategories;
  }

  RxList<TaskController> getTasksByCategory(CategoryController category) {
    final groupedByCategory = taskRepository.getAllTasks
        .where((p0) => p0.categoryTempId.value == category.tempId.value);

    return RxList(groupedByCategory.toList());
  }

  
}
