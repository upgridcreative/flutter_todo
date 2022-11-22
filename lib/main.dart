import 'package:flutter/material.dart';
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
    return MaterialApp(
      navigatorKey: navKey,
      theme: lightTextTheme,
      home: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                // maxWidth: screenSize.width > 600 ? 600 : screenSize.width
                ),
            child: HomeScreen(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
