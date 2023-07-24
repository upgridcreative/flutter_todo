import 'package:flutter_todo/model/task/task_controller.dart';
import 'package:flutter_todo/repository/task.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalanderPageViewModel extends GetxController {
  final TaskRepository taskRepository = Get.find();
  final dateTime = DateTime.now();

  DateTime currentFirstWeekDay = DateTime.now();
  Rx<DateTime> currentSelectedDate = DateTime.now().obs;

  late RxList<Map<String, int>> daysOfWeek;

  final RxBool showFinishedTasks = true.obs;
  final RxBool showUnFinishedTasks = true.obs;

  @override
  onInit() {
    super.onInit();
    daysOfWeek = getNext7Days(findFirstDateOfTheWeek(dateTime));
  }

  RxBool isCurrentDaySelected(int day) {
    return RxBool(currentSelectedDate.value.day == day);
  }

  RxInt get currentDate => currentSelectedDate.value.day.obs;

  DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  RxList<Map<String, int>> getNext7Days(DateTime startDate) {
    RxList<Map<String, int>> days = <Map<String, int>>[].obs;
    for (int i = 0;
        i <=
            startDate.add(const Duration(days: 6)).difference(startDate).inDays;
        i++) {
      days.add(
        {
          DateFormat('EEE').format(
            startDate.add(
              Duration(days: i),
            ),
          ): startDate.add(Duration(days: i)).day
        },
      );
    }
    return days;
  }

  void toggleUnfinishedTasksVisibility() {
    showUnFinishedTasks(!showUnFinishedTasks.value);
  }

  void togglefinishedTasksVisibility() {
    showFinishedTasks(!showFinishedTasks.value);
  }

  void selectDateFromDateRow(int date) {
    currentSelectedDate.value = DateTime(
      currentSelectedDate.value.year,
      currentSelectedDate.value.month,
      date,
    );
    update();
  }

  int get unfinishedTasksCount {
    return taskRepository.getAllTasks.where((p0) {
      if (p0.due.value == null) {
        return false;
      }

      return p0.isChecked.value == false &&
          DateTime.parse(p0.due.value!).isAtSameMomentAs(
            DateTime(currentSelectedDate.value.year,
                currentSelectedDate.value.month, currentSelectedDate.value.day),
          );
    }).length;
  } 
  int get finishedTasksCount {
    return taskRepository.getAllTasks.where((p0) {
      if (p0.due.value == null) {
        return false;
      }

      return p0.isChecked.value == true &&
          DateTime.parse(p0.due.value!).isAtSameMomentAs(
            DateTime(currentSelectedDate.value.year,
                currentSelectedDate.value.month, currentSelectedDate.value.day),
          );
    }).length;
  }

  RxList<TaskController>? get unFinishedTasks {
    return RxList(taskRepository.getAllTasks.where((p0) {
      if (p0.due.value == null) {
        return false;
      }

      return p0.isChecked.value == false &&
          DateTime.parse(p0.due.value!).isAtSameMomentAs(
            DateTime(currentSelectedDate.value.year,
                currentSelectedDate.value.month, currentSelectedDate.value.day),
          );
    }).toList());
  }

  RxList<TaskController>? get finishedTasks {
    return RxList(taskRepository.getAllTasks
        .where((p0) => p0.isChecked.value == true)
        .toList());
  }
}
