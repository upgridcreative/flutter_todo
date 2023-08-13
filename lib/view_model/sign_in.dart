import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repository/auth.dart';
import '../shared/route_manager/route_manager.dart';

class SignInViewModel extends GetxController {
  final repo = AuthenticationRepository();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  RxBool invalidEmail = false.obs;
  RxBool invalidPassword = false.obs;
  RxBool disablePage = false.obs;

  void onWidgetDispose() {
    //Dispose stuff
  }

  Future<void> signIn() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    invalidPassword.value = false;
    invalidEmail.value = false;

    disablePage(true); //Disable touches from the page

    final code =
        await repo.signIn(emailController.text, passwordController.text);

    switch (code) {
      case 'proceed':
        RouteManager().getToHome();
        disablePage(false);
        break;
      case 'no-user-exists':
        disablePage.value = false;
        invalidEmail.value = true;
        update();
        break;
      case 'no-internet':
        disablePage.value = false;
        _onNetwrokException();
        break;
      case 'incorrect-password':
        disablePage.value = false;
        invalidPassword.value = true;
        update();
        break;
    }
  }

  void _onNetwrokException() {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar(
      'Server Error',
      'Problem occurred while connecting to the server',
    );
  }
}
