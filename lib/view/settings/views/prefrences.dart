import 'package:flutter/material.dart';
import '../../../view_model/theme_view_model.dart';
import 'package:get/get.dart';

import '../../../view_model/settings_page_view_model.dart';
import '../components/custom_switch_tile.dart';
import '../components/list_group_tile.dart';
import '../components/list_tile_pop_up.dart';

class PreferenceSettingsScreen extends StatelessWidget {
  const PreferenceSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingPageViewModel viewModel = Get.find();
    final ThemeViewModel themeViewModel = Get.find();
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const ListGroupTitle(
              'General',
              paddingtop: 0,
            ),
            const SizedBox(height: 10),
            Obx(
              () => CustomSwitchTile(
                title: 'Smart Date Recognition',
                value: viewModel.isSmartDateRecognitionEnabled.value,
                onTap: viewModel.toggleSmartDateRecognition,
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => CustomSwitchTile(
                title: 'Dark Theme',
                value: themeViewModel.isDarkTheme.value,
                onTap: themeViewModel.toggleTheme,
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => CustomListTileWithSubtitle(
                text: 'First Day of Week',
                subText: viewModel.getCurrentFirstDayOfTheWeek().value,
                values: viewModel.getDaysOfWeek,
                selectedValue: viewModel.getCurrentFirstDayOfTheWeek,
                onSelectOption: viewModel.setFirstDayOfTheWeek,
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => CustomListTileWithSubtitle(
                text: 'Swipe Right Action',
                subText: viewModel.getCurrentRightSwipeAction().value,
                values: viewModel.getSwipeActions,
                selectedValue: viewModel.getCurrentRightSwipeAction,
                onSelectOption: viewModel.setRightAction,
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => CustomListTileWithSubtitle(
                text: 'Swipe Left Action',
                subText: viewModel.getCurrentLeftSwipeAction().value,
                values: viewModel.getSwipeActions,
                selectedValue: viewModel.getCurrentLeftSwipeAction,
                onSelectOption: viewModel.setLeftAction,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
