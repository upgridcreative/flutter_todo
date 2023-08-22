import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo/view_model/settings_page_view_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'hive_management.dart';
import 'public.dart';
import 'repository/category.dart';
import 'repository/task.dart';
import 'shared/prefs/sharedPrefrences.dart';
import 'shared/theme/light.dart';
import 'sync/data/datasources/local_datasource.dart';
import 'sync/data/datasources/remote_datasource.dart';
import 'sync/data/repository/sync_downstrea.dart';
import 'sync/data/repository/sync_upstream.dart';
import 'sync/usecases/sync.dart';
import 'view/authentication/wrapper.dart';
import 'view_model/auth_wrapper.dart';
import 'view_model/calander_view.dart';
import 'view_model/category.dart';
import 'view_model/home_page.dart';

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

  SharedPreferencesClass();

  SyncToolKit().syncData(); //Todo: only when the user is logged in

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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(367, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: navKey,
          theme: lightTextTheme,
          home: SafeArea(
            child: AuthWrapper(),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
