import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'hive_management.dart';
import 'model/task/task_controller.dart';
import 'public.dart';
import 'repository/category.dart';
import 'repository/task.dart';
import 'repository/testing/dummy/taskRepo.dart';
import 'shared/theme/light.dart';
import 'view/home/home.dart';
import 'view_model/calander_view.dart';
import 'view_model/category.dart';
import 'view_model/home_page.dart';
import 'view_model/sign_in.dart';
import 'view_model/sign_up.dart';
import 'view_model/task_view_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  Get.put(SignUpController());
  Get.put(SignInViewModel());

  await Hive.initFlutter();
  HiveManagement.registerAdapters();
  await HiveManagement.openBoxes();

  // await HiveManagement.deleteAll();
  // await TaskRepoDummy.createDummyCategories();
  // await TaskRepoDummy.createDummyTasksWithCategory();

  Get.put(CategoryRepository());
  Get.put(TaskRepository());

  Get.put(HomePageViewModel());
  Get.put(CategoryPageViewModel());
  Get.put(TaskViewModel());
  Get.put(CalanderPageViewModel());

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
