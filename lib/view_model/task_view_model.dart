import 'package:flutter/material.dart';
import '../model/category/category_controller.dart';
import '../model/task/task_controller.dart';
import '../repository/category.dart';
import '../repository/task.dart';
import '../shared/functions/date_functions.dart';
import 'package:get/get.dart';

class TaskViewModel extends GetxController {
  TaskController? task;

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

    todoTitleFocusNode.addListener(
      () {
        if (!todoTitleFocusNode.hasFocus) {
          if (todoTitleController.text.isEmpty) {
            todoTitleController.text = task!.content.value;
          } else {
            task!.updateTask(todoTitleController.text);
          }
        }
      },
    );

    todoDescriptionFocusNode.addListener(
      () {
        if (!todoDescriptionFocusNode.hasFocus) {
          task!.updateDescription(todoDescriptionController.text);
        }
      },
    );
  }

  void setCurrentTask(TaskController currentTask) {
    task = currentTask;
    todoDescriptionController.text = task!.description.value ?? '';
    todoTitleController.text = task!.content.value;
  }

  void toggleCheck() {
    repository.toggleCheck(task!);
  }

  void deleteTask() {
    repository.deleteTask(task!);
    Get.back();
  }

  void setDueDate(DateTime? dueDate) {
    task!.setDueDate(dueDate);
  }

  RxList<CategoryController> get categories {
    return categoryRepository.categories;
  }
}
