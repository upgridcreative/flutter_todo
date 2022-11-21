import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/animations/animations.dart';
import 'package:flutter_todo/shared/components/customProceedButton.dart';
import 'package:flutter_todo/shared/components/customTextField.dart';
import 'package:flutter_todo/shared/validitors.dart';
import 'package:flutter_todo/view/sign_in/sign_in.dart';
import 'package:flutter_todo/view_model/sign_up.dart';

import 'package:get/get.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({Key? key}) : super(key: key);

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  bool iskeyboardVisivle = false;
  late final StreamSubscription keyboardStream;
  @override
  void initState() {
    super.initState();
    final keyboardVisibilityController = KeyboardVisibilityController();

    // iskeyboardVisivle = true;

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

  SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
              height: iskeyboardVisivle
                  ? 50
                  : MediaQuery.of(context).size.height * 0.3,
              child: AnimatedContainer(
                curve: Curves.linear,
                duration: const Duration(milliseconds: 200),
                height: iskeyboardVisivle
                    ? 0
                    : MediaQuery.of(context).size.height * 0.3,
                child: AnimatedOpacity(
                  child: SvgPicture.asset('assets/svg/sign_up.svg'),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                  opacity: iskeyboardVisivle ? 0 : 1,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter Your Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Metro',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: controller.nameScreenFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: controller.firstNameController,
                        hint: 'First Name',
                        textFieldType: CustomTextFieldType.regular,
                        node: controller.firstNameFocusNode,
                        validator: (value) => lengthValidator(value, 3),
                        nextNode: controller.lastNameFocusNode,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        controller: controller.lastNameController,
                        hint: 'Last Name',
                        textFieldType: CustomTextFieldType.regular,
                        node: controller.lastNameFocusNode,
                        onFieldSubmitted: (p0) => controller.nextTab(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            CustomProceedButton(
              title: 'Next',
              heightFactor: 1,
              onPressed: () => controller.nextTab(context),
            ),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                  PageTransition(
                    child: const SignInScreen(),
                    type: PageTransitionType.fromLeft,
                  ),
                ),
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: Colors.black.withOpacity(.6),
                      fontFamily: 'Metro',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Metro',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
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
