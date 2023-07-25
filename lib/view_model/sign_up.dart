import 'package:flutter/cupertino.dart';
import '../repository/auth.dart';
import '../constants/enums/tabs.dart';
import '../shared/route_manager/route_manager.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final repo = AuthenticationRepository();

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
  RxBool emailExists = false.obs;

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
      emaiController.text,
    );

    switch (code) {
      case 'proceed':
        RouteManager().getToHome();
        break;
      case 'already-exists':
        disablePage.value = false;
        emailExists(true);
        update();
        break;
    }
  }

  SignUpTabs get getCurrentTab => currentTab.value;
}
