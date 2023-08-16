import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/enums/tabs.dart';
import '../repository/auth.dart';
import '../shared/route_manager/route_manager.dart';

class SignUpController extends GetxController {
  final repo = AuthenticationRepository();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
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
  RxBool emailExists = false.obs;

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.onClose();
  }

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

  void signUp() async {
    if (!credentialScreenFormKey.currentState!.validate()) {
      return;
    }

    disablePage(true);

    final String code = await repo.signUp(
      firstNameController.text,
      lastNameController.text,
      passwordController.text,
      emailController.text,
    );

    switch (code) {
      case 'proceed':
        RouteManager().getToHome();
        break;
      case 'no-internet':
        disablePage.value = false;
        _onNetworkException();
        break;
      case 'already-exists':
        disablePage.value = false;
        emailExists(true);
        update();
        break;
    }
  }

  void _onNetworkException() {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar(
      'Server Error',
      'Problem occurred while connecting to the server',
    );
  }

  SignUpTabs get getCurrentTab => currentTab.value;
}
