import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../model/task/task_controller.dart';
import '../../../../view_model/task_view_model.dart';

class TodoDetailFormFields extends StatelessWidget {
  TodoDetailFormFields({
    Key? key,
    required this.task,
  }) : super(key: key);
  final TaskViewModel viewModel = Get.find();
  final TaskController task;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: viewModel.toggleCheck,
                  child: task.isChecked.value
                      ? Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        )
                      : Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/done.svg",
                            height: 25,
                            width: 25,
                          ),
                        ),
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                flex: 10,
                child: TextFormField(
                  focusNode: viewModel.todoTitleFocusNode,
                  controller: viewModel.todoTitleController,
                  enableInteractiveSelection: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    errorBorder: null,
                    focusedBorder: null,
                    disabledBorder: null,
                    enabledBorder: null,
                    focusedErrorBorder: null,
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Icon(
                  Icons.menu,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                flex: 10,
                child: TextFormField(
                  focusNode: viewModel.todoDescriptionFocusNode,
                  minLines: 1,
                  maxLines: 6,
                  controller: viewModel.todoDescriptionController,
                  enableInteractiveSelection: false,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.color
                          ?.withOpacity(.6),
                    ),
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    errorBorder: null,
                    focusedBorder: null,
                    disabledBorder: null,
                    enabledBorder: null,
                    focusedErrorBorder: null,
                  ),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: task.description.value != null
                        ? Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.color
                            ?.withOpacity(.9)
                        : Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.color
                            ?.withOpacity(.5),
                    fontWeight: task.description.value != null
                        ? FontWeight.w500
                        : FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
