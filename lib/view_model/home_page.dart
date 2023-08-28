import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/constants/enums/prefrences.dart';
import 'package:flutter_todo/view/core/todo/components/delete_alert.dart';
import 'package:flutter_todo/view_model/settings_page_view_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/category/category_controller.dart';
import '../model/task/task.dart';
import '../model/task/task_controller.dart';
import '../repository/category.dart';
import '../repository/task.dart';
import '../shared/functions/date_functions.dart';

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

  String get dateToday {
    final day = DateTime.now().day.toString();

    return '$day ${DateFormat('MMM').format(DateTime(0, DateTime.now().month))}';
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

  Future<bool> confirmDismiss(
      DismissDirection direction, TaskController todo) async {
    switch (direction) {
      case DismissDirection.startToEnd:
        return await handleSwipeActions(
          SettingPageViewModel.instance.swipeRightAction.value,
          todo,
        );
      case DismissDirection.endToStart:
        return await handleSwipeActions(
          SettingPageViewModel.instance.swipeLeftAction.value,
          todo,
        );
    }

    return true;
  }

  Future<void> showRescheduleMenu(TaskController todo) async {
    final newDate = await showDatePicker(
      context: Get.context!,
      initialDate: todo.due.value == null
          ? DateTime.now()
          : DateTime.parse(
              todo.due.value!,
            ),
      firstDate: DateTime(2000, 01, 01),
      lastDate: DateTime(2100, 01, 01),
    );

    todo.setDueDate(newDate);
  }

  Future<bool> showDeleteAlert(TaskController todo) async {
    return await showDialog(
      context: Get.context!,
      builder: (c) => DeleteTodoDialog(viewModel: taskRepository, todo: todo),
    );
  }

  Future<bool> handleSwipeActions(
    SwipeAction switchAction,
    TaskController todo,
  ) async {
    switch (switchAction) {
      case SwipeAction.check:
        toggleCheck(todo);
        return false;
      case SwipeAction.reschedule:
        Future.delayed(const Duration(microseconds: 1)).then(
          (value) => showRescheduleMenu(todo),
        );
        return false;
      case SwipeAction.delete:
        return await showDeleteAlert(todo);
      case SwipeAction.nothing:
        return false;
    }
  }
}
