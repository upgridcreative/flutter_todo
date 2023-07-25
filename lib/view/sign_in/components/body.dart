import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../animations/animations.dart';
import '../../../shared/components/customProceedButton.dart';
import '../../../shared/components/customTextField.dart';
import '../../../shared/components/custom_progress_button.dart';
import '../../../shared/validitors.dart';
import '../../sign_up/sign_up.dart';
import '../../../view_model/sign_in.dart';
import 'package:get/get.dart';

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({Key? key}) : super(key: key);

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  final SignInViewModel _viewModel = Get.find();
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
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 200),
                height: iskeyboardVisivle
                    ? 0
                    : MediaQuery.of(context).size.height * 0.3,
                child: AnimatedOpacity(
                  child: SvgPicture.asset('assets/svg/sign_in.svg'),
                  duration: const Duration(milliseconds: 200),
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
                fontFamily: 'Metro',
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Form(
                key: _viewModel.loginFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hint: 'Email',
                      textFieldType: CustomTextFieldType.email,
                      controller: _viewModel.emailController,
                      validator: emailValidator,
                      enabled: !_viewModel.disablePage.value,
                      node: _viewModel.emailFocusNode,
                      nextNode: _viewModel.passwordFocusNode,
                      autoFocus: true,
                      errorMessage: _viewModel.invalidEmail.value
                          ? 'Email doesn\'t exist'
                          : null,
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: 'Password',
                      textFieldType: CustomTextFieldType.password,
                      controller: _viewModel.passwordController,
                      enabled: !_viewModel.disablePage.value,
                      node: _viewModel.passwordFocusNode,
                      onFieldSubmitted: (value) => _viewModel.signIn(),
                      errorMessage: _viewModel.invalidPassword.value
                          ? 'Incorect Password'
                          : null,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => _viewModel.disablePage.value
                  ? const CustomProgressButton(
                      title: 'Loging in',
                    )
                  : CustomProceedButton(
                      title: 'Login',
                      heightFactor: 1,
                      onPressed: _viewModel.signIn,
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
                      color: Colors.black.withOpacity(.6),
                      fontFamily: 'Metro',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Sign Up',
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
            // if (!iskeyboardVisivle)
            // const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
