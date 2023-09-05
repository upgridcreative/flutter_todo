import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeViewModel extends GetxController {
  late RxBool _isDarkTheme;

  ThemeViewModel() {
    _isDarkTheme = Get.isDarkMode.obs;
  }

  void toggleTheme() {
    _isDarkTheme.value = !_isDarkTheme.value;
    Get.changeThemeMode(
      _isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
    );
  }

  RxBool get isDarkTheme => _isDarkTheme;
}
