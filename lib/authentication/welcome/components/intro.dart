import 'package:flutter/material.dart';

class WelcomeIntro extends StatelessWidget {
  const WelcomeIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 20),
        Text(
          'Manage Your Tasks',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Main',
            fontSize: 29,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 25),
        Text(
          'Keep Track Of Your',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Main',
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Tasks and Habits',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Main',
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
