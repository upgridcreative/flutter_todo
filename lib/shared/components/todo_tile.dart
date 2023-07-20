import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/model/task/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo/repository/task.dart';
import 'package:flutter_todo/shared/functions/date_functions.dart';
import 'package:flutter_todo/shared/theme/light.dart';
import 'package:flutter_todo/view/home/components/components.dart';
import 'package:get/get.dart';

class TodoTile extends StatelessWidget {
  TodoTile({Key? key, required this.task}) : super(key: key);

  final TaskController task;
  final TaskRepository controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 64.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => controller.toggleCheck(task),
              child: Flexible(
                flex: 1,
                child: !task.isChecked.value
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
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.content.value,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: -.01,
                        fontSize: 13.5.sp,
                        color: task.isChecked.value
                            ? Colors.black.withOpacity(.6)
                            : Colors.black,
                        decoration: task.isChecked.value
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    if (task.due.value != null ||
                        task.categoryTempId.value != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (task.due.value != null)
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/calender.svg",
                                    color: !task.isDue ? Colors.red : mainColor,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    convertDueDateToName(task.due.value!),
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          !task.isDue ? Colors.red : mainColor,
                                    ),
                                  )
                                ],
                              ),
                            if (task.due.value != null &&
                                task.categoryTempId.value != null)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: HomeComponent.verticalDivider(),
                              ),
                            if (task.categoryTempId.value != null)
                              Text(
                                task.categoryTempId.toString(),
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue,
                                ),
                              ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}