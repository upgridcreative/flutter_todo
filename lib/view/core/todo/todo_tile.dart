import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/view_model/home_page.dart';
import 'package:get/get.dart';

import '../../../constants/decoration.dart';
import '../../../model/task/task_controller.dart';
import '../../../repository/task.dart';
import '../../../shared/functions/date_functions.dart';
import '../../../shared/theme/light.dart';
import '../../../view_model/settings_page_view_model.dart';
import 'components/swipe_backgrounds.dart';

class TodoTile extends StatelessWidget {
  TodoTile({Key? key, required this.task}) : super(key: key);

  final TaskController task;
  final HomePageViewModel homePageViewModel= Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Dismissible(
        background: const RightBackGround(),
        direction: SettingPageViewModel.instance.hasSwipeLeft.value &&
                SettingPageViewModel.instance.hasSwipeRight.value
            ? DismissDirection.horizontal
            : SettingPageViewModel.instance.hasSwipeLeft.value
                ? DismissDirection.endToStart
                : DismissDirection.startToEnd,
        secondaryBackground: const LeftBackGround(),
        key: UniqueKey(),
        confirmDismiss: (direction) async => homePageViewModel.confirmDismiss(
          direction,
          task,
        ),
        child: SizedBox(
          height: 64.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () => homePageViewModel.toggleCheck(task),
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
                                      color:
                                          !task.isDue ? Colors.red : mainColor,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      convertDueDateToName(task.due.value!),
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: !task.isDue
                                            ? Colors.red
                                            : mainColor,
                                      ),
                                    )
                                  ],
                                ),
                              if (task.due.value != null &&
                                  task.categoryTempId.value != null)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0),
                                  child: Text(
                                    '|',
                                    style: noteTag,
                                  ),
                                ),
                              if (task.categoryTempId.value != null)
                                Text(
                                  task.category,
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
      ),
    );
  }
}
