import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/enums/tabs.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emaiController = TextEditingController();
  final passwordController = TextEditingController();

  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  Rx<SignUpTabs> currentTab = SignUpTabs.name.obs;
  final pageController = PageController();

  void nextTab(context) {

    lastNameFocusNode.unfocus();
    pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.ease,
    );
    
    Future.delayed(const Duration(milliseconds: 350)).then((value) {
      FocusScope.of(context).requestFocus(emailFocusNode);
    });
  }

  void back() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }

  SignUpTabs get getCurrentTab => currentTab.value;
}
