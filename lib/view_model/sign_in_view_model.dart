import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repository/auth.dart';
import '../shared/route_manager/route_manager.dart';
import '../sync/usecases/sync.dart';

class SignInViewModel extends GetxController {
  final repo = AuthenticationRepository();

  final loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  RxBool invalidEmail = false.obs;
  RxBool invalidPassword = false.obs;
  RxBool disablePage = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.onClose();
  }


  Future<void> signIn() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    invalidPassword.value = false;
    invalidEmail.value = false;

    disablePage(true); 

    final code =
        await repo.signIn(emailController.text, passwordController.text);

    switch (code) {
      case 'proceed':
        RouteManager().getToHome();
        disablePage(false);
        SyncToolKit().syncData();
        break;
      case 'no-user-exists':
        disablePage.value = false;
        invalidEmail.value = true;
        update();
        break;
      case 'no-internet':
        disablePage.value = false;
        _onNetworkException();
        break;
      case 'incorrect-password':
        disablePage.value = false;
        invalidPassword.value = true;
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
}
