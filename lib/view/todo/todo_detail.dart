import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/model/task/task_controller.dart';
import 'package:flutter_todo/shared/theme/light.dart';
import 'package:flutter_todo/view_model/task_view_model.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoDetailPage extends StatefulWidget {
  TodoDetailPage({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskController task;

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  final TaskViewModel viewModel = Get.find();

  @override
  initState() {
    super.initState();

    viewModel.setCurrentTask(widget.task);
  }

  @override
  Widget build(BuildContext context) {
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
                    const Icon(Icons.arrow_back_ios),
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
                    // const Icon(Icons.more_vert),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: viewModel.toggleCheck,
                            child: !widget.task.isChecked.value
                                ? Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 2,
                                        color: mainColor,
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
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Flexible(
                          flex: 1,
                          child: Icon(
                            Icons.menu,
                            color: mainColor,
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
                                color: const Color(0xFF828282),
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
                              color: widget.task.description.value != null
                                  ? const Color(0xFF828282)
                                  : const Color(0xFF828282).withOpacity(.7),
                              fontWeight: widget.task.description.value != null
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    GestureDetector(
                      onTap: () async {
                        final datePicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000, 01, 01),
                          lastDate: DateTime(2069, 01, 01),
                        );

                        viewModel.setDueDate(datePicked);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: widget.task.due.value != null
                                ? mainColor
                                : Colors.black,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            child: Text(
                              widget.task.due.value ?? 'Due date',
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: widget.task.due.value != null
                                    ? mainColor
                                    : mainColor.withOpacity(.4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    DropdownButton(
                      items: viewModel.categories.map(
                        (element) {
                          return DropdownMenuItem(
                            value: element.tempId.value,
                            child: Text(element.title.value),
                          );
                        },
                      ).toList(),
                      elevation: 0,
                      icon: const SizedBox(),
                      underline: const SizedBox(),
                      value: widget.task.categoryTempId.value,
                      onChanged: (tempId) {
                        widget.task.setCategory(tempId as String);
                      },
                      hint: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: mainColor.withOpacity(.7),
                        ),
                        alignment: Alignment.center,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Text(
                            'No Category',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      selectedItemBuilder: (c) => viewModel.categories
                          .map(
                            (element) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: mainColor.withOpacity(.7),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: Text(
                                  widget.task.category.toString(),
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
