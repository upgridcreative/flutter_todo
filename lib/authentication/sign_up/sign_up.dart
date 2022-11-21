import 'package:flutter/material.dart';
import 'package:flutter_todo/authentication/sign_up/components/body.dart';
import 'package:flutter_todo/authentication/sign_up/components/complete_setup.dart';
import 'package:flutter_todo/view_model/sign_up.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.find();

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: const [
          SignUpScreenBody(),
          SignUpScreenBodyCompletetion(),
        ],
      ),
    );
  }
}
