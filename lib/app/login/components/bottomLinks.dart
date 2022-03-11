import 'package:flutter/material.dart';

class BottomLinks extends StatelessWidget {
  const BottomLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 10),
        Text(
          'Forgot password?',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Main',
            fontWeight: FontWeight.w600,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Sign up',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Main',
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
