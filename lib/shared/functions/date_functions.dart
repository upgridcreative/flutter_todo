import 'package:intl/intl.dart';

//! Constants; will be used throughout the packages
final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');

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


