import 'package:flutter/material.dart';
import 'package:flutter_todo/shared/prefs/sharedPrefrences.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeViewModel extends GetxController {
  late RxBool _isDarkTheme;

  ThemeViewModel() {
    _isDarkTheme =
        (SharedPreferencesClass().prefs.getBool('DARK_MODE') ?? false).obs;
  }

  void toggleTheme() {
    _isDarkTheme.value = !_isDarkTheme.value;
    SharedPreferencesClass().prefs.setBool('DARK_MODE', _isDarkTheme.value);
    Get.changeThemeMode(
      _isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
    );
  }

  RxBool get isDarkTheme => _isDarkTheme;
}
