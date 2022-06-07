import 'package:flutter/material.dart';
import 'package:flutter_todo/animations/page_transition.dart';
import 'package:flutter_todo/authentication/sign_up/sign_up.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            PageTransition(
              child: const SignUpScreen(),
              type: PageTransitionType.fromRight,
            ),
          ),
          child: Text.rich(
            TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(
                color: Colors.black.withOpacity(.7),
                fontFamily: 'Main',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              children: const [
                TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Main',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
