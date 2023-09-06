import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../model/task/task_controller.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/utils/date_functions.dart';
import '../../../view_model/home_page_view_model.dart';
import '../../../view_model/settings_page_view_model.dart';
import 'components/swipe_backgrounds.dart';

class TodoTile extends StatelessWidget {
  TodoTile({Key? key, required this.task}) : super(key: key);

  final TaskController task;
  final HomePageViewModel homePageViewModel = Get.find();

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
                              color: Theme.of(context).primaryColor,
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
                            color: ColorClass.primary,
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
                              ? Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color?.withOpacity(.7)
                              : Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color,
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
                                          !task.isDue ? Colors.red.withOpacity(.9) : Theme.of(context).colorScheme.secondary,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      convertDueDateToName(task.due.value!),
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: !task.isDue
                                            ? Colors.red.withOpacity(.9)
                                            : Theme.of(context).colorScheme.secondary,
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
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ),
                              if (task.categoryTempId.value != null)
                                Text(
                                  task.category,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
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
