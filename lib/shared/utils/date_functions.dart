import '../enums/prefrences.dart';
import 'package:intl/intl.dart';

//! Constants; will be used throughout the packages
final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
final DateFormat dateFormatterTwo = DateFormat.MMMMd();

String convertDueDateToName(String dueDate) {
  final dueToDateTime = DateTime.parse(dueDate);
  final now = DateTime.now();
  final todayAsDateTime = DateTime(now.year, now.month, now.day);

  if (dueToDateTime.isAtSameMomentAs(todayAsDateTime)) {
    return 'Today';
  }

  if (dueToDateTime.isAfter(todayAsDateTime)) {
    if (dueToDateTime.difference(todayAsDateTime).inDays == 1) {
      return 'Tomorrow';
    }
    //Todo: For Rizwan
    //Todo: If the due date falls in the current week. Instead of   `Later` return the day name ie : Sunday, Saturday etc..
    return 'Later';
  }

  if (dueToDateTime.difference(todayAsDateTime).inDays == -1) {
    return 'Yesterday';
  }

  return 'Older';
}

DateTime findFirstDateOfTheWeek(
  DateTime dateTime,
  FirstDayOfTheWeek preferredFirstDayOfTheWeek,
) {
  return DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day -
        ((dateTime.weekday - preferredFirstDayOfTheWeek.index) % 7) +
        1,
  );

}

List<Map<String, int>> getNext7Days(DateTime startDate) {
  List<Map<String, int>> days = <Map<String, int>>[];
  for (int i = 0;
      i <= startDate.add(const Duration(days: 6)).difference(startDate).inDays;
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
