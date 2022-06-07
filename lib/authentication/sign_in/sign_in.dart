import 'package:flutter/material.dart';
import 'package:flutter_todo/authentication/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInScreenBody(),
    );
  }
}
