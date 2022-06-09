import 'package:flutter/material.dart';

enum Frequency {
  // * Where to store this type in MVVM architecture?
  daily,
  weekly,
  monthly,
  yearly,
}

class HabitTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Frequency frequency;
  final Color color;
  const HabitTile(
      {Key? key,
      required this.title,
      this.color = Colors.lightBlue,
      this.icon = Icons.man,
      this.frequency = Frequency.daily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: color,
      ),
      child: Column(children: [
        Icon(
          icon,
          color: Colors.black,
          size: 40,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          frequency.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ]),
    );
  }
}
