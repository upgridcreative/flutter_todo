import 'package:flutter/material.dart';
import 'package:flutter_todo/authentication/welcome/welcome.dart';
import 'package:flutter_todo/theme/light.dart';
import 'package:flutter_todo/view_model/sign_up.dart';
import 'package:get/get.dart';

void main() {
  Get.put(SignUpController());
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      theme: lightTextTheme,
      home: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                // maxWidth: screenSize.width > 600 ? 600 : screenSize.width
                ),
            child: WelcomeScreen(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
