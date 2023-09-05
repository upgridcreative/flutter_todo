import 'package:flutter/material.dart';
import 'package:flutter_todo/sync/usecases/sync.dart';
import 'package:get/get.dart';

import '../../view_model/auth_wrapper.dart';
import '../core/home/home.dart';
import 'welcome/welcome.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthWrapperViewModel viewModel = Get.put(AuthWrapperViewModel());

    return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData) {
          SyncToolKit().syncData();
        }
        return snap.hasData
            ? snap.data as bool
                ? const HomeScreen()
                : const WelcomeScreen()
            : const SizedBox();
      },
      future: viewModel.isLoggedIn,
    );
  }
}
