import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo/hive_management.dart';
import 'package:flutter_todo/model/task/task_controller.dart';
import 'package:flutter_todo/public.dart';
import 'package:flutter_todo/repository/category.dart';
import 'package:flutter_todo/repository/task.dart';
import 'package:flutter_todo/repository/testing/dummy/taskRepo.dart';
import 'package:flutter_todo/shared/theme/light.dart';
import 'package:flutter_todo/view/home/home.dart';
import 'package:flutter_todo/view_model/category.dart';
import 'package:flutter_todo/view_model/home_page.dart';
import 'package:flutter_todo/view_model/sign_in.dart';
import 'package:flutter_todo/view_model/sign_up.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  Get.put(SignUpController());
  Get.put(SignInViewModel());

  await Hive.initFlutter();
  HiveManagement.registerAdapters();
  await HiveManagement.openBoxes();

  await HiveManagement.deleteAll();
  await TaskRepoDummy.createDummyCategories();
  await TaskRepoDummy.createDummyTasksWithCategory();

  Get.put(CategoryRepository());
  Get.put(TaskRepository());

  Get.put(HomePageViewModel());
  Get.put(CategoryPageViewModel());

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
          home: const SafeArea(
            child: HomeScreen(),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
