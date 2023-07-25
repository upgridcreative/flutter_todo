import 'package:get/get.dart';

import '../model/task/task_controller.dart';
import '../repository/task.dart';
import '../shared/functions/date_functions.dart';

class CalanderPageViewModel extends GetxController {
  final TaskRepository taskRepository = Get.find();
  final dateTime = DateTime.now();

  late DateTime currentFirstWeekDay;
  Rx<DateTime> currentSelectedDate = DateTime.now().obs;

  RxList<Map<String, int>> daysOfWeek = <Map<String, int>>[].obs;

  final RxBool showFinishedTasks = true.obs;
  final RxBool showUnFinishedTasks = true.obs;

  @override
  onInit() {
    super.onInit();
    currentFirstWeekDay = findFirstDateOfTheWeek(dateTime);
    daysOfWeek.value = getNext7Days(findFirstDateOfTheWeek(dateTime));
  }

  RxBool isCurrentDaySelected(int day) {
    return RxBool(currentSelectedDate.value.day == day);
  }

  void setDate(DateTime? newDate) {
    if (newDate == null) {
      return;
    }
    currentSelectedDate.value = newDate;
    daysOfWeek.value = getNext7Days(findFirstDateOfTheWeek(newDate));
    currentFirstWeekDay = findFirstDateOfTheWeek(newDate);
    update();
  }

  void resetDate() {
    currentFirstWeekDay = findFirstDateOfTheWeek(dateTime);
    currentSelectedDate(dateTime);
    daysOfWeek.value = getNext7Days(findFirstDateOfTheWeek(dateTime));
  }

  RxInt get currentDate => currentSelectedDate.value.day.obs;


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
