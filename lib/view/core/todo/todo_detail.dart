import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../model/task/task_controller.dart';
import '../../../view_model/task_view_model.dart';
import 'components/todo_datepicker.dart';
import 'components/todo_detail_fields.dart';
import 'components/todo_detail_formfield.dart';

class TodoDetailPage extends StatefulWidget {
  const TodoDetailPage({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskController task;

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<TaskViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TaskViewModel viewModel = Get.put(TaskViewModel(task: widget.task));

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: Get.back,
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Detail Todo',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () => viewModel.showSaveButton.value
                          ? IconButton(
                              onPressed: viewModel.onSaveFields,
                              icon: const Icon(Icons.check),
                            )
                          : PopupMenuButton<int>(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: viewModel.deleteTask,
                                    value: 1,
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Delete",
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                                offset: const Offset(0, 20),
                                color: const Color(0xFFF2F2F2),
                                child: const Icon(Icons.more_vert),
                              ),
                            
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TodoDetailFormFields(task: viewModel.task),
                  const SizedBox(height: 25),
                  DueDatePicker(),
                  const SizedBox(height: 60),
                  CategoryDropDownButton(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
