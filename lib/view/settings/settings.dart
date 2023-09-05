import 'package:flutter/material.dart';
import 'package:flutter_todo/view/settings/views/privicy_policy.dart';
import 'package:flutter_todo/view_model/settings_page_view_model.dart';
import "package:get/get.dart";

import '../components/appbar.dart';
import '../../view_model/auth_wrapper.dart';
import 'components/listTite.dart';
import 'views/account.dart';
import 'views/prefrences.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final AuthWrapperViewModel viewModel = Get.find();
  @override
  Widget build(BuildContext context) {
    final settingsViewModel = Get.put(SettingPageViewModel());
    return Scaffold(
      body: ListView(
        children: [
          const MyAppBar(title: 'Settings Page'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 35),
                CustomListTile(
                  'Account & Privicy',
                  Icons.person,
                  navigate: () {
                    Get.to(() => const AccountAndPrivacySettings());
                  },
                ),
                const SizedBox(height: 5),
                CustomListTile(
                  'Preferences',
                  Icons.light_mode,
                  navigate: () {
                    Get.to(() => const PreferenceSettingsScreen());
                  },
                ),
                const SizedBox(height: 5),
                CustomListTile(
                  'Privacy Policy',
                  Icons.privacy_tip_sharp,
                  navigate: () {
                    Get.to(() => const PrivacyPolicyScreen());
                  },
                  showTrailingArrow: false,
                ),
                const SizedBox(height: 5),
                CustomListTile(
                  'Contact Me',
                  Icons.contacts,
                  navigate: () {
                    settingsViewModel.contactMe();
                  },
                  showTrailingArrow: false,
                ),
                const SizedBox(height: 5),
                CustomListTile(
                  'Source code',
                  Icons.source,
                  navigate: () {
                    settingsViewModel.sourceCode();
                  },
                  showTrailingArrow: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
