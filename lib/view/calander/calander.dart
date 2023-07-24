import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_todo/shared/theme/colors.dart';
import 'package:flutter_todo/view/calander/components/calander_task_body.dart';
import 'package:flutter_todo/view_model/calander_view.dart';
import 'package:get/get.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({Key? key}) : super(key: key);

  final CalanderPageViewModel viewModel = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Row(
              children: [
                GestureDetector(
                  onTap: viewModel.resetDate,
                  child: Text(
                    "Today",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff000000),
                      height: 24 / 20,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                final datePicked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000, 01, 01),
                          lastDate: DateTime(2069, 01, 01),
                        );

                        viewModel.setDate(datePicked);
                  },
                  child: Container(
                    width: 50.h,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF484B6A),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      DateTime.now().day.toString(),
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 18 / 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              height: 89.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0XffD2D3DB),
              ),
              child: Obx(
                ()=>  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: viewModel.daysOfWeek
                      .map(
                        (mapKey) => GestureDetector(
                          onTap: () => viewModel
                              .selectDateFromDateRow(mapKey.values.first),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                mapKey.keys.first,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff000000),
                                  height: 15 / 12,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 10),
                              Obx(
                                () => Container(
                                  height: 41.h,
                                  width: 35.w,
                                  alignment: Alignment.center,
                                  decoration: mapKey.values.first ==
                                          viewModel.currentDate.value
                                      ? BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: ColorClass.primary,
                                        )
                                      : null,
                                  child: Obx(
                                    () => Text(
                                      mapKey.values.first.toString(),
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: mapKey.values.first ==
                                                viewModel.currentDate.value
                                            ? Colors.white
                                            : const Color(0xff010100),
                                        height: 15 / 12,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 15),
            CalanderTaskViewSegment(),
          ],
        ),
      ),
    );
  }
}
