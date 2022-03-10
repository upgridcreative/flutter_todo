import 'package:flutter/material.dart';
import 'package:flutter_todo/app/login/components/body.dart';
import 'package:flutter_todo/utilts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(const Color(0xFF43506C));
    return const Scaffold(
      body: Body(),
    );
  }
}
