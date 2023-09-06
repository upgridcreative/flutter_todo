import 'package:flutter/material.dart';
import 'package:flutter_todo/view/authentication/delete_account/delete_user.dart';
import 'package:get/get.dart';

import '../../../view_model/settings_page_view_model.dart';
import '../../authentication/reset_password/reset_password.dart';
import '../components/list_group_tile.dart';
import '../components/listTite.dart';

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
            CustomListTile(
              'Delete account',
              Icons.delete,
              showTrailingArrow: false,
              iconColor: Colors.red,
              titleColor: Colors.red,
              navigate: () => Get.to(
                const DeletePassword(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
