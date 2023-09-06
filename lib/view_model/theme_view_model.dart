import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../singletons/shared_prefrences.dart';

class ThemeViewModel extends GetxController {
  late RxBool _isDarkTheme;

  ThemeViewModel() {
    _isDarkTheme =
        (SharedPreferencesClass().prefs.getBool('DARK_MODE') ?? false).obs;

    _setSystemOverlay();
  }

  void toggleTheme() {
    _isDarkTheme.value = !_isDarkTheme.value;
    SharedPreferencesClass().prefs.setBool('DARK_MODE', _isDarkTheme.value);
    Get.changeThemeMode(
      _isDarkTheme.value ? ThemeMode.dark : ThemeMode.light,
    );
    _setSystemOverlay();
  }

  void _setSystemOverlay() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: _isDarkTheme.value ? Colors.black : Colors.white,
        statusBarIconBrightness:
            _isDarkTheme.value ? Brightness.light : Brightness.dark,
        statusBarBrightness:
            _isDarkTheme.value ? Brightness.light : Brightness.dark,
        systemNavigationBarColor:
            _isDarkTheme.value ? Colors.black : Colors.white,
        systemNavigationBarIconBrightness:
            _isDarkTheme.value ? Brightness.light : Brightness.dark,
      ),
    );
  }

  RxBool get isDarkTheme => _isDarkTheme;
}
