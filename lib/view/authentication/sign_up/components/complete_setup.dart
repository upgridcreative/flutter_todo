import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../components/customProceedButton.dart';
import '../../../components/customTextField.dart';
import '../../../components/custom_progress_button.dart';
import '../../../../shared/utils/validitors.dart';
import '../../../../view_model/sign_up_view_model.dart';

class SignUpScreenBodyCompletetion extends StatefulWidget {
  const SignUpScreenBodyCompletetion({Key? key}) : super(key: key);

  @override
  State<SignUpScreenBodyCompletetion> createState() =>
      _SignUpScreenBodyCompletetionState();
}

class _SignUpScreenBodyCompletetionState
    extends State<SignUpScreenBodyCompletetion> {
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
    isKeyboardVisible = true;
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
              height: isKeyboardVisible
                  ? 50
                  : MediaQuery.of(context).size.height * 0.3,
              child: AnimatedContainer(
                curve: Curves.linear,
                duration: const Duration(milliseconds: 200),
                height: isKeyboardVisible
                    ? 0
                    : MediaQuery.of(context).size.height * 0.3,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                  opacity: isKeyboardVisible ? 0 : 1,
                  child: SvgPicture.asset('assets/svg/sign_up.svg'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Complete Setup',
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
                    key: controller.credentialScreenFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: controller.emailController,
                          hint: 'Email',
                          textFieldType: CustomTextFieldType.email,
                          node: controller.emailFocusNode,
                          validator: emailValidator,
                          autoFocus: true,
                          enabled: !controller.disablePage.value,
                          nextNode: controller.passwordFocusNode,
                          errorMessage: controller.emailExists.value
                              ? 'Email already Exists'
                              : null,
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
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.color
                        ?.withOpacity(.4),
                    fontFamily: 'Metro',
                    fontWeight: FontWeight.w500,
                  ),
                  children: const [
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
