import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo/shared/components/customProceedButton.dart';
import 'package:flutter_todo/shared/components/customTextField.dart';
import 'package:flutter_todo/shared/components/custom_progress_button.dart';
import 'package:flutter_todo/shared/validitors.dart';
import 'package:flutter_todo/view_model/sign_up.dart';
import 'package:get/get.dart';

class SignUpScreenBodyCompletetion extends StatefulWidget {
  const SignUpScreenBodyCompletetion({Key? key}) : super(key: key);

  @override
  State<SignUpScreenBodyCompletetion> createState() =>
      _SignUpScreenBodyCompletetionState();
}

class _SignUpScreenBodyCompletetionState
    extends State<SignUpScreenBodyCompletetion> {
  bool iskeyboardVisivle = false;
  // late final StreamSubscription keyboardStream;
  @override
  void initState() {
    super.initState();
    // final keyboardVisibilityController = KeyboardVisibilityController();

    // iskeyboardVisivle = keyboardVisibilityController.isVisible;
    // keyboardStream =
    //     keyboardVisibilityController.onChange.listen((bool visible) {
    //   iskeyboardVisivle = visible;
    //   setState(() {});
    // });
    iskeyboardVisivle = true;
  }

  @override
  void dispose() {
    // keyboardStream.cancel();
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
                  'Complete Setup',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Metro',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Form(
                    key: controller.credentialScreenFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: controller.emaiController,
                          hint: 'Email',
                          textFieldType: CustomTextFieldType.email,
                          node: controller.emailFocusNode,
                          validator: emailValidator,
                          autoFocus: true,
                          enabled: !controller.disablePage.value,
                          nextNode: controller.passwordFocusNode,
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          controller: controller.passwordController,
                          hint: 'Password',
                          enabled: !controller.disablePage.value,
                          validator: passwordValidator,
                          textFieldType: CustomTextFieldType.password,
                          node: controller.passwordFocusNode,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(
              () => controller.disablePage.value
                  ? const CustomProgressButton(
                      title: 'Signing in',
                    )
                  : CustomProceedButton(
                      title: 'Sign Up',
                      heightFactor: 1,
                      onPressed: controller.signUp,
                    ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Metro',
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: 'By continuing  you agree to our '),
                    TextSpan(
                      text: 'Terms of Conditions ',
                      style: TextStyle(
                        fontFamily: 'Metro',
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(text: 'and '),
                    TextSpan(
                      text: 'Privicy Policy ',
                      style: TextStyle(
                        fontFamily: 'Metro',
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
