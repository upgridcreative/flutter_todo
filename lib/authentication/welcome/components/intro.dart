import 'package:flutter/material.dart';

class WelcomeIntro extends StatelessWidget {
  const WelcomeIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          const FittedBox(
            child: Text(
              'Write And Acomplish',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Main',
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            'Your Goals',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Main',
              fontSize: 29,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 25),
          Text(
            'Task Your Goals.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0XFF0a0a0a).withOpacity(.7),
              fontFamily: 'Main',
              fontSize: 18,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
            ),
          ),
          // const SizedBox(height: 25),
          // Text(
          //   'Keep Track Of Your',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     color: const Color(0XFF0a0a0a).withOpacity(.9),
          //     fontFamily: 'Main',
          //     fontSize: 16,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
          // Text(
          //   'Tasks and Habits.',
          //   style: TextStyle(
          //     color: const Color(0XFF0a0a0a).withOpacity(.9),
          //     fontFamily: 'Main',
          //     fontSize: 16,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
        ],
      ),
    );
  }
}
