import 'package:flutter/material.dart';
import 'package:flutter_todo/model/category/category_controller.dart';
import 'package:flutter_todo/model/task/task_controller.dart';
import 'package:flutter_todo/repository/category.dart';
import 'package:flutter_todo/repository/task.dart';
import 'package:flutter_todo/shared/functions/date_functions.dart';
import 'package:get/get.dart';

class TaskViewModel extends GetxController {
  late final TaskController task;

  final TaskRepository repository = Get.find();
  final CategoryRepository categoryRepository = Get.find();

  final TaskRepository controller = Get.find();
  final TextEditingController todoTitleController = TextEditingController();
  final TextEditingController todoDescriptionController =
      TextEditingController();

  final FocusNode todoTitleFocusNode = FocusNode();
  final FocusNode todoDescriptionFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();

    todoDescriptionController.text = task.description.value ?? '';

    todoTitleFocusNode.addListener(
      () {
        if (!todoTitleFocusNode.hasFocus) {
          if (todoTitleController.text.isEmpty) {
            todoTitleController.text = task.content.value;
          } else {
            task.updateTask(todoTitleController.text);
          }
        }
      },
    );

    todoDescriptionFocusNode.addListener(
      () {
        if (!todoDescriptionFocusNode.hasFocus) {
          task.updateDescription(todoDescriptionController.text);
        }
      },
    );
  }

  void setCurrentTask(TaskController currentTask) {
    task = currentTask;
  }

  void toggleCheck() {
    repository.toggleCheck(task);
  }

  void setDueDate(DateTime? dueDate) {
    task.setDueDate(dueDate);
  }

  RxList<CategoryController> get categories {
    return categoryRepository.categories;
  }
}
