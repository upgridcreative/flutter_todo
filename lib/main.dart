import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo/public.dart';
import 'package:flutter_todo/shared/theme/light.dart';
import 'package:flutter_todo/view/home/home.dart';
import 'package:flutter_todo/view/welcome/welcome.dart';
import 'package:flutter_todo/view_model/sign_in.dart';
import 'package:flutter_todo/view_model/sign_up.dart';
import 'package:get/get.dart';

import 'view/manage_categories/manage_categories.dart';

void main() {
  Get.put(SignUpController());
  Get.put(SignInViewModel());
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
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
        return MaterialApp(
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
