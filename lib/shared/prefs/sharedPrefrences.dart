import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass {
  late final SharedPreferences _prefs;

  static final SharedPreferencesClass _singleton =
      SharedPreferencesClass._internal();

  factory SharedPreferencesClass() {
    return _singleton;
  }

  SharedPreferencesClass._internal() {

    onInit();
  }

  onInit() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs => _prefs;
}
