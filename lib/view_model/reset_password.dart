import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../repository/auth.dart';

class ResetPasswordViewModel extends GetxController {
  final repo = AuthenticationRepository();

  final resetPasswordFormKey = GlobalKey<FormState>();

  final TextEditingController newPasswordTextController =
      TextEditingController();
  final TextEditingController confirmNewPasswordTextController =
      TextEditingController();
  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode confirmNewPasswordFocusNode = FocusNode();

  RxBool disablePage = false.obs;

  RxBool misMatchingPasswords = false.obs;

  @override
  void onClose() {
    newPasswordTextController.dispose();
    confirmNewPasswordTextController.dispose();

    newPasswordFocusNode.dispose();
    confirmNewPasswordFocusNode.dispose();

    super.onClose();
  }

  void resetPassword() async {
    misMatchingPasswords(false);

    if (!resetPasswordFormKey.currentState!.validate()) {
      return;
    }

    if (newPasswordTextController.text !=
        confirmNewPasswordTextController.text) {
      misMatchingPasswords(true);
      return;
    }

    disablePage(true);

    final code = await repo.resetPassword(newPasswordTextController.text);

    switch (code) {
      case 'proceed':
        disablePage(false);
        _onProceed();
        break;
      case 'unexpected-error':
        disablePage(false);
        _onUnExpectedException();
        break;
      case 'no-internet':
        disablePage(false);
        _onNetworkException();
        break;
    }
  }

  void _onProceed() {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.back();
    Get.snackbar(
      'Password Change',
      'Your Password has been successfully changed',
    );
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

  void _onUnExpectedException() {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar(
      'Server Error',
      'An Expected Error Occured',
    );
  }
}
