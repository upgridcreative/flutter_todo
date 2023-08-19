enum FirstDayOfTheWeek {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

enum SwipeAction {
  nothing,
  delete,
  check,
  reschedule,
}

const firstDayOfTheWeekMapping = {
  'Sunday': FirstDayOfTheWeek.sunday,
  'Monday': FirstDayOfTheWeek.monday,
  'Tuesday': FirstDayOfTheWeek.tuesday,
  'Wednesday': FirstDayOfTheWeek.wednesday,
  'Thursday': FirstDayOfTheWeek.thursday,
  'Friday': FirstDayOfTheWeek.friday,
  'Saturday': FirstDayOfTheWeek.saturday,
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
