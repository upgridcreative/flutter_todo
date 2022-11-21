import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/shared/enums/tabs.dart';
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

  final nameScreenFormKey = GlobalKey<FormState>();
  final credentialScreenFormKey = GlobalKey<FormState>();

  final pageController = PageController();

  Rx<SignUpTabs> currentTab = SignUpTabs.name.obs;
  RxBool disablePage = false.obs;

  void nextTab(context) {
    lastNameFocusNode.unfocus();

    if (!nameScreenFormKey.currentState!.validate()) {
      firstNameFocusNode.requestFocus();
      return;
    }

    lastNameFocusNode.unfocus();
    pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.ease,
    );

    Future.delayed(const Duration(milliseconds: 350)).then(
      (value) {
        FocusScope.of(context).requestFocus(emailFocusNode);
      },
    );
  }

  void signUp() {
    if (!credentialScreenFormKey.currentState!.validate()) {
      return;
    }
    disablePage(true);
  }

  SignUpTabs get getCurrentTab => currentTab.value;
}
