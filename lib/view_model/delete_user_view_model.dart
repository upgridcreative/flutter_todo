import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/view_model/auth_wrapper_view_model.dart';
import 'package:get/get.dart';

import '../repository/auth.dart';

class DeleteUserViewModel extends GetxController {
  final repo = AuthenticationRepository();

  final resetPasswordFormKey = GlobalKey<FormState>();

  final TextEditingController passwordTextController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  RxBool disablePage = false.obs;

  RxBool incorrectPassword = false.obs;
  late AuthWrapperViewModel authWrapperViewModel;

  @override
  void onInit() {
    authWrapperViewModel = Get.find<AuthWrapperViewModel>();
    super.onInit();
  }

  @override
  void onClose() {
    passwordTextController.dispose();

    passwordFocusNode.dispose();

    super.onClose();
  }

  void deleteAccount() async {
    incorrectPassword(false);

    if (!resetPasswordFormKey.currentState!.validate()) {
      return;
    }

    disablePage(true);

    final code = await repo.deleteUser(passwordTextController.text);

    switch (code) {
      case 'proceed':
        _onProceed();
        break;
      case 'incorrect-password':
        disablePage(false);
        incorrectPassword(true);
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
    authWrapperViewModel.logout();
    disablePage(false);
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
