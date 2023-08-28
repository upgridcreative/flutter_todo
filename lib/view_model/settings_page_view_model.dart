import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/enums/prefrences.dart';
import '../repository/category.dart';
import '../repository/task.dart';
import '../shared/prefs/sharedPrefrences.dart';
import '../view/authentication/welcome/welcome.dart';

class SettingPageViewModel extends GetxController {
  final _storage = const FlutterSecureStorage();
  final _prefs = SharedPreferencesClass().prefs;

  late RxBool isSmartDateRecognitionEnabled;
  late Rx<FirstDayOfTheWeek> firstDayOfTheWeek;
  late Rx<SwipeAction> swipeRightAction;
  late Rx<SwipeAction> swipeLeftAction;

  static final SettingPageViewModel instance = Get.find();

  @override
  onInit() {
    isSmartDateRecognitionEnabled =
        (_prefs.getBool('isSmartDateRecognitionEnabled') ?? true).obs;

    firstDayOfTheWeek = (FirstDayOfTheWeek.values[
            (_prefs.getInt('firstDayOfTheWeek') ??
                FirstDayOfTheWeek.monday.index)])
        .obs;

    swipeRightAction = (SwipeAction.values[
            (_prefs.getInt('swipeRightAction') ?? SwipeAction.delete.index)])
        .obs;

    swipeLeftAction = (SwipeAction.values[
            (_prefs.getInt('swipeLeftAction') ?? SwipeAction.check.index)])
        .obs;

    super.onInit();
  }

  Future<void> signOut() async {
    await CategoryRepository.instance.onLogout();
    await TaskRepository.instance.onLogout();

    await _storage.deleteAll();

    Get.offAll(() => const WelcomeScreen());
  }

  void toggleSmartDateRecognition() {
    _prefs.setBool(
      'isSmartDateRecognitionEnabled',
      !isSmartDateRecognitionEnabled.value,
    );

    isSmartDateRecognitionEnabled(!isSmartDateRecognitionEnabled.value);
  }

  void setFirstDayOfTheWeek(String day) {
    final dayAsInt = firstDayOfTheWeekMapping.keys.toList().indexWhere(
          (element) => element == day,
        );

    _prefs.setInt(
      'firstDayOfTheWeek',
      dayAsInt,
    );

    firstDayOfTheWeek(FirstDayOfTheWeek.values[dayAsInt]);
    Get.back();
  }

  void setRightAction(String action) {
    final actionIndex = swipeActionMapping.keys.toList().indexWhere(
          (element) => element == action,
        );

    _prefs.setInt(
      'swipeRightAction',
      actionIndex,
    );

    swipeRightAction(SwipeAction.values[actionIndex]);
    Get.back();
  }

  void setLeftAction(String action) {
    final actionIndex = swipeActionMapping.keys.toList().indexWhere(
          (element) => element == action,
        );

    _prefs.setInt(
      'swipeLeftAction',
      actionIndex,
    );

    swipeLeftAction(SwipeAction.values[actionIndex]);
    Get.back();
  }

  RxBool get hasSwipeLeft => (swipeLeftAction.value != SwipeAction.nothing).obs;
  RxBool get hasSwipeRight =>
      (swipeRightAction.value != SwipeAction.nothing).obs;

  RxString getCurrentFirstDayOfTheWeek() =>
      getFirstDayOfTheWeekAsString(firstDayOfTheWeek.value).obs;

  RxString getCurrentLeftSwipeAction() =>
      getSwipeActionAsString(swipeLeftAction.value).obs;

  RxString getCurrentRightSwipeAction() =>
      getSwipeActionAsString(swipeRightAction.value).obs;

  List<String> get getDaysOfWeek {
    return firstDayOfTheWeekMapping.keys.toList();
  }

  List<String> get getSwipeActions {
    return swipeActionMapping.keys.toList();
  }

  void contactMe() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'farhansyedain@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Hey I was looking at your TODO list app',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void sourceCode() {
    Uri url = Uri.parse("https://github.com/upgridcreative/TodolistBackend");
    launchUrl(url);
  }
}
