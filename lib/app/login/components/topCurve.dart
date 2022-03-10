import 'package:flutter/material.dart';
import 'package:flutter_todo/app/login/painter/painter.dart';

class TopCurve extends StatelessWidget {
  const TopCurve({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ClipPath(
          clipper: WelcomeScreenClipper(
            width: width,
            height: width,
          ),
          child: Container(
            color: const Color(0xFF43506C),
          ),
        ),
        Positioned(
          left: 20,
          top: 15,
          child: SizedBox(
            width: width * .9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  'Welcome back to  Trackify!',
                  style: TextStyle(
                    fontFamily: 'Main',
                    fontWeight: FontWeight.w900,
                    color: Colors.white.withOpacity(.95),
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Login below',
                  style: TextStyle(
                    fontFamily: 'Main',
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(.60),
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
