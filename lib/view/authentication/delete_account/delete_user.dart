import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/utils/validitors.dart';
import '../../../view_model/delete_user_view_model.dart';
import '../../components/customProceedButton.dart';
import '../../components/customTextField.dart';
import '../../components/custom_progress_button.dart';

class DeletePassword extends StatelessWidget {
  const DeletePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeleteUserViewModel());

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
                  'Delete Account',
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
                          hint: 'Password',
                          textFieldType: CustomTextFieldType.password,
                          controller: controller.passwordTextController,
                          validator: passwordValidator,
                          enabled: !controller.disablePage.value,
                          node: controller.passwordFocusNode,
                          autoFocus: true,
                          errorMessage: controller.incorrectPassword.value ?
                              'Incorrect Password' : null,
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => controller.disablePage.value
                      ? const CustomProgressButton(
                          title: 'Deleting Account',
                          color: Colors.red,
                        )
                      : CustomProceedButton(
                          title: 'Delete Account',
                          heightFactor: 1,
                          color: Colors.red,
                          onPressed: controller.deleteAccount,
                        ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
