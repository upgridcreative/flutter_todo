import 'welcome/welcome.dart';
import '../core/home/home.dart';
import '../../view_model/auth_wrapper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AuthWrapper extends StatelessWidget {
  AuthWrapper({Key? key}) : super(key: key);

  final AuthWrapperViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
       return snap.hasData
            ? snap.data as bool
                ? const HomeScreen()
                : const WelcomeScreen()
            : SizedBox();
      },
      future: viewModel.isLoggedIn,
    );
  }
}
