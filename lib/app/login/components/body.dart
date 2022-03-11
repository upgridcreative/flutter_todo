import 'package:flutter/material.dart';
import 'package:flutter_todo/app/login/components/bottomLinks.dart';
import 'package:flutter_todo/app/login/components/topCurve.dart';
import 'package:flutter_todo/shared/components/customProceedButton.dart';
import 'package:flutter_todo/shared/components/customTextField.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          child: const TopCurve(),
          height: width * .7,
        ),
        Expanded(
          child: Form(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: const [
                  SizedBox(height: 20),
                  CustomTextField(
                    hint: 'Enter your email',
                    title: 'Email',
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    hint: 'Enter your password',
                    title: 'Password',
                    obscure: true,
                  ),
                  SizedBox(height: 25),
                  CustomProceedButton(title: 'Login'),
                  BottomLinks(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
