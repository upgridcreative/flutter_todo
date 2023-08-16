import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/category/category_controller.dart';
import '../model/task/task_controller.dart';
import '../repository/category.dart';
import '../repository/task.dart';

class TaskViewModel extends GetxController {
  final TaskController task;

  final TaskRepository repository = Get.find();
  final CategoryRepository categoryRepository = Get.find();

  final TaskRepository controller = Get.find();
  final TextEditingController todoTitleController = TextEditingController();
  final TextEditingController todoDescriptionController =
      TextEditingController();

  final FocusNode todoTitleFocusNode = FocusNode();
  final FocusNode todoDescriptionFocusNode = FocusNode();

  TaskViewModel({required this.task});

  @override
  void onClose() {
    todoTitleController.dispose();
    todoDescriptionController.dispose();

    todoTitleFocusNode.dispose();
    todoDescriptionFocusNode.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    todoDescriptionController.text = task.description.value ?? '';
    todoTitleController.text = task.content.value;

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

    super.onInit();
  }

  void toggleCheck() {
    repository.toggleCheck(task);
  }

  void deleteTask() {
    repository.deleteTask(task);
    Get.back();
  }

  void setDueDate(DateTime? dueDate) {
    task.setDueDate(dueDate);
  }

  RxList<CategoryController> get categories {
    return categoryRepository.categories;
  }
}
