import 'package:flutter/material.dart';
import '../../../shared/components/todo_tile.dart';
import '../../todo/todo_detail.dart';
import '../../../view_model/calander_view.dart';
import 'package:get/get.dart';

class CalanderTaskViewSegment extends StatelessWidget {
  CalanderTaskViewSegment({Key? key}) : super(key: key);
  final CalendarPageViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Tasks",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000),
                height: 22 / 18,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Obx(
              () => Text(
                viewModel.unfinishedTasksCount.toString(),
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                  height: 22 / 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Obx(
              () => RotatedBox(
                quarterTurns: viewModel.showUnFinishedTasks.value ? -1 : -2,
                child: IconButton(
                  iconSize: 15,
                  padding: EdgeInsets.zero,
                  onPressed: viewModel.toggleUnfinishedTasksVisibility,
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
              ),
            ),
          ],
        ),
        Obx(
          () => viewModel.showUnFinishedTasks.value
              ? ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  itemCount: viewModel.unfinishedTasksCount,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => TodoDetailPage(
                            task: viewModel.unFinishedTasks![index],
                          ),
                        );
                      },
                      child: TodoTile(
                        task: viewModel.unFinishedTasks![index],
                      ),
                    );
                  },
                )
              : const SizedBox(),
        ),
        Row(
          children: [
            const Text(
              "Completed",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000),
                height: 22 / 18,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Obx(
              () => Text(
                viewModel.finishedTasksCount.toString(),
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),
                  height: 22 / 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Obx(
              () => RotatedBox(
                quarterTurns: viewModel.showFinishedTasks.value ? -1 : -2,
                child: IconButton(
                  iconSize: 15,
                  padding: EdgeInsets.zero,
                  onPressed: viewModel.togglefinishedTasksVisibility,
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                ),
              ),
            ),
          ],
        ),
        Obx(
          () => viewModel.showFinishedTasks.value
              ? ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  itemCount: viewModel.finishedTasksCount,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => TodoDetailPage(
                            task: viewModel.finishedTasks![index],
                          ),
                        );
                      },
                      child: TodoTile(
                        task: viewModel.finishedTasks![index],
                      ),
                    );
                  },
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
