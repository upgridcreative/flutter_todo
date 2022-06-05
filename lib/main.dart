import 'package:flutter/material.dart';
import 'package:flutter_todo/authentication/welcome/welcome.dart';
import 'package:flutter_todo/theme/light.dart';
import 'theme/extentions.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTextTheme,
      home: const SafeArea(
        child: WelcomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
