import 'package:flutter/material.dart';
import 'package:flutter_todo/public.dart';
import 'package:flutter_todo/shared/functions/date_functions.dart';
import 'package:get/route_manager.dart';

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
      this.year,
      this.month,
      this.day - (day == weekday ? 7 : (weekday - day) % DateTime.daysPerWeek),
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
              children: const [
                Icon(
                  Icons.date_range_sharp,
                  size: 22,
                ),
                SizedBox(width: 15),
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Text('Wed'),
                SizedBox(width: 10),
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
              children: const [
                Icon(
                  Icons.sunny,
                  size: 22,
                ),
                SizedBox(width: 15),
                Text(
                  'Tomorrow',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Text('Thu'),
                SizedBox(width: 10),
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
                const Icon(
                  Icons.weekend,
                  size: 22,
                ),
                const SizedBox(width: 15),
                const Text(
                  'Next weekend',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Text(dateFormatterTwo.format(DateTime.now().next(6))),
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
              children: const [
                Icon(
                  Icons.block,
                  size: 22,
                ),
                SizedBox(width: 15),
                Text(
                  'No Date',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
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
