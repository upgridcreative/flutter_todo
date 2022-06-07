import 'package:flutter/material.dart';
import 'package:flutter_todo/animations/animations.dart';
import 'package:flutter_todo/authentication/sign_in/sign_in.dart';

class AuthenticationButtons extends StatelessWidget {
  const AuthenticationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            PageTransition(
              child: const SignInScreen(),
              type: PageTransitionType.fromRight,
            ),
          ),
          child: Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFF1F6FEB),
            ),
            alignment: Alignment.center,
            child:const Text(
              'Sign In With Email ID',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Main',
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 65,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/logos/google.png',
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Continue With Google',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Main',
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
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
