import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_management.dart';
import 'public.dart';
import 'repository/category.dart';
import 'repository/task.dart';
import 'shared/theme/themes.dart';
import 'singletons/shared_prefrences.dart';
import 'sync/data/datasources/local_datasource.dart';
import 'sync/data/datasources/remote_datasource.dart';
import 'sync/data/repository/sync_downstrea.dart';
import 'sync/data/repository/sync_upstream.dart';
import 'sync/usecases/sync.dart';
import 'view/authentication/wrapper.dart';
import 'view_model/auth_wrapper_view_model.dart';
import 'view_model/calander_view_model.dart';
import 'view_model/category_view_model.dart';
import 'view_model/home_page_view_model.dart';
import 'view_model/settings_page_view_model.dart';
import 'view_model/theme_view_model.dart';

void main() async {
  await Hive.initFlutter();
  HiveManagement.registerAdapters();
  await HiveManagement.openBoxes();
  await SharedPreferencesClass().onInit();

  Get.put(CategoryRepository());
  Get.put(TaskRepository());

  Get.put(SettingPageViewModel());
  Get.put(AuthWrapperViewModel());
  Get.put(HomePageViewModel());
  Get.put(CategoryPageViewModel());
  Get.put(CalendarPageViewModel());
  Get.put(SyncDataUpSteam());
  Get.put(SyncRemoteDataSource());
  Get.put(SyncDataDownStream());
  Get.put(SyncLocalDataSource());
  Get.put(ThemeViewModel());

  final cron = Cron();
  cron.schedule(
    Schedule(minutes: 1),
    () {
      SyncToolKit().syncData();
    },
  );

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(367, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: navKey,
          theme: lightTheme,
          themeMode: SharedPreferencesClass().prefs.getBool('DARK_MODE') == null
              ? ThemeMode.system
              : SharedPreferencesClass().prefs.getBool('DARK_MODE') == true
                  ? ThemeMode.dark
                  : ThemeMode.light,
          darkTheme: darkTheme,
          home: const SafeArea(
            child: AuthWrapper(),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
