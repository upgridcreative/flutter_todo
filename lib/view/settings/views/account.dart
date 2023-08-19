import 'package:flutter/material.dart';
import 'package:flutter_todo/view/authentication/reset_password/reset_password.dart';
import 'package:flutter_todo/view_model/settings_page_view_model.dart';

import '../components/listGroupTitle.dart';
import '../components/listTite.dart';
import 'package:get/get.dart';

class AccountAndPrivacySettings extends StatelessWidget {
  const AccountAndPrivacySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingPageViewModel viewModel = Get.find();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const ListGroupTitle(
              'Privicy',
              paddingtop: 0,
            ),
            const SizedBox(height: 10),
            CustomListTile(
              'Reset Password',
              Icons.lock,
              showTrailingArrow: false,
              navigate: () => Get.to(() => const ResetPassword()),
            ),
            const SizedBox(height: 5),
            const CustomListTile(
              'Clear Sessions',
              Icons.clear,
              showTrailingArrow: false,
            ),
            const ListGroupTitle('Account and sessions'),
            const SizedBox(height: 10),
            CustomListTile(
              'Sign  out',
              Icons.logout,
              showTrailingArrow: false,
              iconColor: Colors.red,
              titleColor: Colors.red,
              navigate: viewModel.signOut,
            ),
            const SizedBox(height: 5),
            const CustomListTile(
              'Delete account',
              Icons.delete,
              showTrailingArrow: false,
              iconColor: Colors.red,
              titleColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
