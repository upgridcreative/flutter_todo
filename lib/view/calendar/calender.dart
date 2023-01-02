import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/shared/theme/light.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CalendarTimeline(
        shrink: false,
        initialDate: DateTime(2020, 4, 20),
        firstDate: DateTime(2019, 1, 15),
        lastDate: DateTime(2020, 11, 20),
        onDateSelected: (date) => print(date),
        leftMargin: 20,
        monthColor: Colors.blueGrey,
        dayColor: Colors.teal[200],
        activeDayColor: Colors.white,
        activeBackgroundDayColor: mainColor,
        dotsColor: Colors.transparent,
        locale: 'en_ISO',
        showYears: false,
      ),
    );
  }
}
