import 'package:flutter/material.dart';

class WelcomeScreenLogo extends StatelessWidget {
  const WelcomeScreenLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.black,
      ),
    );
  }
}
