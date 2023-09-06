import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

import '../../../../shared/utils/date_functions.dart';

extension MyDateTime on DateTime {
  DateTime next(int day) {
    return DateTime(
      this.year,
      this.month,
      this.day + (day == weekday ? 7 : (day - weekday) % DateTime.daysPerWeek),
    );
  }

  DateTime previous(int day) {
    return DateTime(
      year,
      month,
      day - (day == weekday ? 7 : (weekday - day) % DateTime.daysPerWeek),
    );
  }

  String asString() {
    return DateFormat.EEEE().format(
      DateTime(
        year,
        month,
        day,
      ),
    );
  }
}

class QuickDatesAccess extends StatelessWidget {
  const QuickDatesAccess({super.key, required this.saveDate});

  final saveDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 4),
      height: 250,
      child: Column(
        children: [
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              saveDate(DateTime.now());
              Get.back();
            },
            child: Row(
              children: [
                Icon(
                  Icons.date_range_sharp,
                  size: 22,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 15),
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                  ),
                ),
                const Spacer(),
                Text(
                  DateTime.now().asString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              saveDate(
                DateTime.now().add(const Duration(days: 1)),
              );
              Get.back();
            },
            child: Row(
              children: [
                Icon(
                  Icons.sunny,
                  size: 22,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 15),
                Text(
                  'Tomorrow',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                  ),
                ),
                const Spacer(),
                Text(
                  DateTime.now().add(const Duration(days: 1)).asString(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              saveDate(DateTime.now().next(6));
              Get.back();
            },
            child: Row(
              children: [
                Icon(
                  Icons.weekend,
                  size: 22,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 15),
                Text(
                  'Next weekend',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                  ),
                ),
                const Spacer(),
                Text(
                  dateFormatterTwo.format(
                    DateTime.now().next(6),
                  ),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              saveDate(null);
              Get.back();
            },
            child: Row(
              children: [
                Icon(
                  Icons.block,
                  size: 22,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 15),
                Text(
                  'No Date',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
