import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../animations/animations.dart';
import '../../../../shared/components/customProceedButton.dart';
import '../../../../shared/components/customTextField.dart';
import '../../../../shared/components/custom_progress_button.dart';
import '../../../../shared/validitors.dart';
import '../../sign_up/sign_up.dart';
import '../../../../view_model/sign_in.dart';
import 'package:get/get.dart';

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({Key? key}) : super(key: key);

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  bool isKeyboardVisible = false;
  late final StreamSubscription keyboardStream;
  @override
  void initState() {
    super.initState();

    final keyboardVisibilityController = KeyboardVisibilityController();
    isKeyboardVisible = keyboardVisibilityController.isVisible;

    keyboardStream =
        keyboardVisibilityController.onChange.listen((bool visible) {
      isKeyboardVisible = visible;
      setState(() {});
    });
  }

  @override
  void dispose() {
    keyboardStream.cancel();
    Get.delete<SignInViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInViewModel());

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
              height: isKeyboardVisible
                  ? 50
                  : MediaQuery.of(context).size.height * 0.3,
              child: AnimatedContainer(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 200),
                height: isKeyboardVisible
                    ? 0
                    : MediaQuery.of(context).size.height * 0.3,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.decelerate,
                  opacity: isKeyboardVisible ? 0 : 1,
                  child: SvgPicture.asset('assets/svg/sign_in.svg'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Sign In',
              style: TextStyle(
                color: Theme.of(context).textTheme.displayMedium?.color,
                fontFamily: 'Metro',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Form(
                key: controller.loginFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hint: 'Email',
                      textFieldType: CustomTextFieldType.email,
                      controller: controller.emailController,
                      validator: emailValidator,
                      enabled: !controller.disablePage.value,
                      node: controller.emailFocusNode,
                      nextNode: controller.passwordFocusNode,
                      autoFocus: true,
                      errorMessage: controller.invalidEmail.value
                          ? 'Email doesn\'t exist'
                          : null,
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: 'Password',
                      textFieldType: CustomTextFieldType.password,
                      controller: controller.passwordController,
                      enabled: !controller.disablePage.value,
                      node: controller.passwordFocusNode,
                      onFieldSubmitted: (value) => controller.signIn(),
                      errorMessage: controller.invalidPassword.value
                          ? 'Incorrect Password'
                          : null,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => controller.disablePage.value
                  ? const CustomProgressButton(
                      title: 'Logging in',
                    )
                  : CustomProceedButton(
                      title: 'Login',
                      heightFactor: 1,
                      onPressed: controller.signIn,
                    ),
            ),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                  PageTransition(
                    child: const SignUpScreen(),
                    type: PageTransitionType.fromRight,
                  ),
                ),
                child: Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.color
                          ?.withOpacity(.5),
                      fontFamily: 'Metro',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color:
                              Theme.of(context).textTheme.displaySmall?.color,
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
            const SizedBox(height: 5),
            const Center(
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Metro',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
