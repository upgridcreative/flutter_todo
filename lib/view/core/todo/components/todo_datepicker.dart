import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/datepicker/datePicker.dart';
import '../../../../shared/functions/date_functions.dart';
import '../../../../view_model/task_view_model.dart';

class DueDatePicker extends StatelessWidget {
  DueDatePicker({Key? key}) : super(key: key);

  final TaskViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    void openDraggableBottomSheet(context) {
      final initDate = viewModel.task.due.value == null
          ? DateTime.now()
          : DateTime.parse(
              viewModel.task.due.value!,
            );
      showModalBottomSheet(
        context: context,
        builder: (context) => CustomDatePicker(
          initialDate: viewModel.task.due.value != null
              ? DateTime.parse(viewModel.task.due.value!)
              : DateTime.now(),
          firstDate:
              initDate.isAfter(DateTime.now()) ? DateTime.now() : initDate,
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
                  viewModel.task.due.value != null ? Theme.of(context).colorScheme.primary : Theme.of(context).textTheme.displayMedium?.color,
            ),
            const SizedBox(width: 20),
            Text(
              viewModel.task.due.value == null
                  ? 'Due date'
                  : convertDueDateToName(
                      viewModel.task.due.value!,
                    ),
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: viewModel.task.due.value != null
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primary.withOpacity(.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
