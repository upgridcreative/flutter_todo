import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/customProceedButton.dart';
import '../../components/customTextField.dart';
import '../../components/custom_progress_button.dart';
import '../../../shared/utils/validitors.dart';
import '../../../view_model/reset_password_view_model.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordViewModel());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text(
                  'Reset Password',
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
                    key: controller.resetPasswordFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          hint: 'New Password',
                          textFieldType: CustomTextFieldType.password,
                          controller: controller.newPasswordTextController,
                          validator: passwordValidator,
                          enabled: !controller.disablePage.value,
                          node: controller.newPasswordFocusNode,
                          nextNode: controller.confirmNewPasswordFocusNode,
                          autoFocus: true,
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          hint: 'Confirm Password',
                          textFieldType: CustomTextFieldType.password,
                          controller:
                              controller.confirmNewPasswordTextController,
                          enabled: !controller.disablePage.value,
                          node: controller.confirmNewPasswordFocusNode,
                          onFieldSubmitted: (value) =>
                              controller.resetPassword(),
                          errorMessage: controller.misMatchingPasswords.value
                              ? 'Passwords Don\'t Match'
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
                          title: 'Resetting Password',
                        )
                      : CustomProceedButton(
                          title: 'Reset Password',
                          heightFactor: 1,
                          onPressed: controller.resetPassword,
                        ),
                ),
                const SizedBox(height: 10),
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
        ),
      ),
    );
  }
}
