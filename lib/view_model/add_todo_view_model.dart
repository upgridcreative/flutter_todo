import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/view_model/settings_page_view_model.dart';
import 'package:get/get.dart';

import '../model/task/task.dart';
import '../repository/task.dart';
import '../shared/functions/date_functions.dart';

class AddTodoViewModel extends GetxController {
  final TaskRepository taskRepository = Get.find();
  final contextTextEditingController = TextEditingController();
  final today = DateTime.now();
  final prefrences = SettingPageViewModel.instance;

  Rx<DateTime?> datePicked = Rx(null);

  @override
  void onInit() {
    if (prefrences.isSmartDateRecognitionEnabled.value) {
      contextTextEditingController.addListener(() {
        parseDateFromText(contextTextEditingController.text);
      });
    }
    super.onInit();
  }

  void selectDate(DateTime? date) {
    datePicked.value = date;
    update();
  }

  void parseDateFromText(String date) {
    final dueDate = parseDate(date, today);
    datePicked.value = dueDate;
    update();
  }

  DateTime? parseDate(String inputText, DateTime now) {
    final text = inputText.toLowerCase();

    if (text.contains("tom") || text.contains('tomorrow')) {
      return now.add(const Duration(days: 1));
    } else if (text.contains('today')) {
      return now.add(const Duration(days: 0));
    } else if (RegExp(r"in \d+ days?").hasMatch(text)) {
      final match = RegExp(r"(\d+) days?").firstMatch(text);
      final daysToAdd = int.parse(match?.group(1) ?? '0');
      return now.add(Duration(days: daysToAdd));
    } else {
      return null;
    }
  }

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
