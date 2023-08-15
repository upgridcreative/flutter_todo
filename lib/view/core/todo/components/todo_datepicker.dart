import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../model/task/task_controller.dart';
import '../../../../shared/theme/light.dart';
import '../../../../view_model/task_view_model.dart';

class DueDatePicker extends StatelessWidget {
  DueDatePicker({Key? key, required this.task}) : super(key: key);

  final TaskViewModel viewModel = Get.find();
  final TaskController task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final datePicked = await showDatePicker(
          context: context,
          initialDate: task.due.value != null
              ? DateTime.parse(
                  task.due.value!,
                )
              : DateTime.now(),
          firstDate: DateTime(2000, 01, 01),
          lastDate: DateTime(2069, 01, 01),
        );

        viewModel.setDueDate(datePicked);
      },
      child: Row(
        children: [
          Icon(
            Icons.date_range,
            color: task.due.value != null ? mainColor : Colors.black,
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: Text(
              task.due.value ?? 'Due date',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: task.due.value != null
                    ? mainColor
                    : mainColor.withOpacity(.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}