import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/animations/animations.dart';
import 'package:flutter_todo/authentication/sign_up/sign_up.dart';
import 'package:flutter_todo/shared/components/customProceedButton.dart';
import 'package:flutter_todo/shared/components/customTextField.dart';

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({Key? key}) : super(key: key);

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  bool iskeyboardVisivle = false;
  late final StreamSubscription keyboardStream;
  @override
  void initState() {
    super.initState();
    final keyboardVisibilityController = KeyboardVisibilityController();

    keyboardStream =
        keyboardVisibilityController.onChange.listen((bool visible) {
      iskeyboardVisivle = visible;
      setState(() {});
    });
  }

  @override
  void dispose() {
    keyboardStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              curve: Curves.decelerate,
              height: iskeyboardVisivle
                  ? 50
                  : MediaQuery.of(context).size.height * 0.3,
              child: AnimatedContainer(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 450),
                height: iskeyboardVisivle
                    ? 0
                    : MediaQuery.of(context).size.height * 0.3,
                child: AnimatedOpacity(
                  child: SvgPicture.asset('assets/svg/sign_in.svg'),
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.decelerate,
                  opacity: iskeyboardVisivle ? 0 : 1,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Main',
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            const CustomTextField(hint: 'Email'),
            const SizedBox(height: 5),
            const CustomTextField(hint: 'Password'),
            const SizedBox(height: 20),
            const CustomProceedButton(
              title: 'Login',
              heightFactor: 1,
            ),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
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
                      color: Colors.black.withOpacity(.9),
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
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Main',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // if (!iskeyboardVisivle)
            // const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
