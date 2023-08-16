import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/sign_up.dart';
import 'components/body.dart';
import 'components/complete_setup.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void dispose() {
    Get.delete<SignUpController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());

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
