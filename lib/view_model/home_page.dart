import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/enums/prefrences.dart';
import '../model/category/category_controller.dart';
import '../model/task/task_controller.dart';
import '../repository/category.dart';
import '../repository/task.dart';
import '../shared/datepicker/datePicker.dart';
import '../view/core/todo/components/delete_alert.dart';
import 'settings_page_view_model.dart';

class HomePageViewModel extends GetxController {
  final TaskRepository taskRepository = Get.find();
  final CategoryRepository categoryRepository = Get.find();
  RxString currentTab = 'My Day'.obs;
  RxnString currentTabId = RxnString();

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

    if (!categoryRepository.hasCategoryWithTempId(currentTabId.value!)) {
      currentTabId.value = null;
      currentTab('My Day');
      return dueToday;
    }

    final tabAsCategory =
        categoryRepository.getCategoryByTempId(currentTabId.value!);

    return getTasksByCategory(tabAsCategory);
  }

  void setTab(String categoryTitle) {
    if (!['My Day', 'All'].contains(categoryTitle)) {
      final tabAsCategory = categoryRepository.getCategoryByName(categoryTitle);
      currentTabId.value = tabAsCategory.tempId.value;
    } else {
      currentTabId.value = null;
    }
    currentTab(categoryTitle);
    update();
  }

  void toggleCheck(TaskController task) => taskRepository.toggleCheck(task);

  void deleteTask(TaskController task) => taskRepository.deleteTask(task);

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
    final initDate = todo.due.value == null
        ? DateTime.now()
        : DateTime.parse(
            todo.due.value!,
          );
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) => CustomDatePicker(
        initialDate: initDate,
        firstDate: initDate.isAfter(DateTime.now()) ? DateTime.now() : initDate,
        lastDate: DateTime(2100, 01, 01),
        onDateChanged: (date) {},
        onSaved: (date) {
          todo.setDueDate(date);
        },
      ),
    );
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
