import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/animations/slide_animation.dart';
import 'package:flutter_todo/authentication/sign_up/components/body.dart';
import 'package:flutter_todo/authentication/sign_up/components/complete_setup.dart';
import 'package:flutter_todo/enums/tabs.dart';
import 'package:flutter_todo/view_model/sign_up.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.find();

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: const [
          SignUpScreenBody(),
          SignUpScreenBodyCompletetion(),
        ],
      ),
    );
  }
}
