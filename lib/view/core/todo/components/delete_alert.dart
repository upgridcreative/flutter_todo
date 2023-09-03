import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../../model/task/task_controller.dart';
import '../../../../repository/task.dart';

class DeleteTodoDialog extends StatelessWidget {
  const DeleteTodoDialog({
    Key? key,
    required this.viewModel,
    required this.todo,
  }) : super(key: key);

  final TaskRepository viewModel;
  final TaskController todo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Are you sure you want to delete this?',
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.back(result: false);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 18),
          ),
        ),
        IconButton(
          onPressed: () {
            viewModel.deleteTask(todo);
            Get.back(result: true);
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
