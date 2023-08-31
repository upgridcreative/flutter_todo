import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo/shared/datepicker/datePicker.dart';
import 'package:get/get.dart';

import '../../../../shared/theme/light.dart';
import '../../../../view_model/task_view_model.dart';

class DueDatePicker extends StatelessWidget {
  DueDatePicker({Key? key}) : super(key: key);

  final TaskViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    void openDraggableBottomSheet(context) {
      showModalBottomSheet(
        context: context,
        builder: (context) => CustomDatePicker(
          initialDate: viewModel.task.due.value != null
              ? DateTime.parse(viewModel.task.due.value!)
              : DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 1000),
          ),
          onDateChanged: (onDateChanged) {},
          onSaved: viewModel.setDueDate,
        ),
      );
    }

    return Obx(
      () => GestureDetector(
        onTap: () async {
          openDraggableBottomSheet(context);
        },
        child: Row(
          children: [
            Icon(
              Icons.date_range,
              color:
                  viewModel.task.due.value != null ? mainColor : Colors.black,
            ),
            const SizedBox(width: 20),
            Text(
              viewModel.task.due.value ?? 'Due date',
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: viewModel.task.due.value != null
                    ? mainColor
                    : mainColor.withOpacity(.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
