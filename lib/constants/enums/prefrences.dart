enum FirstDayOfTheWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

enum SwipeAction {
  nothing,
  delete,
  check,
  reschedule,
}

const firstDayOfTheWeekMapping = {
  'Monday': FirstDayOfTheWeek.monday,
  'Tuesday': FirstDayOfTheWeek.tuesday,
  'Wednesday': FirstDayOfTheWeek.wednesday,
  'Thursday': FirstDayOfTheWeek.thursday,
  'Friday': FirstDayOfTheWeek.friday,
  'Saturday': FirstDayOfTheWeek.saturday,
  'Sunday': FirstDayOfTheWeek.sunday,
};

const swipeActionMapping = {
  'Nothing': SwipeAction.nothing,
  'Delete': SwipeAction.delete,
  'Check': SwipeAction.check,
  'Reschedule': SwipeAction.reschedule,
};

String getFirstDayOfTheWeekAsString(FirstDayOfTheWeek firstDayOfTheWeek) {
  return firstDayOfTheWeekMapping.keys
      .where(
          (element) => firstDayOfTheWeekMapping[element] == firstDayOfTheWeek)
      .first;
}

String getSwipeActionAsString(SwipeAction swipeAction) {
  return swipeActionMapping.keys
      .where((element) => swipeActionMapping[element] == swipeAction)
      .first;
}
