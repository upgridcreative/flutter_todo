import 'package:flutter/material.dart';
import 'package:flutter_todo/authentication/sign_up/components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpScreenBody(),
    );
  }
}
