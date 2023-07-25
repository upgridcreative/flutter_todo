import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/complete_setup.dart';
import '../../../view_model/sign_up.dart';
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
