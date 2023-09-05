import 'package:flutter/material.dart';
import '../../../../shared/animations/animations.dart';
import '../../../components/customProceedButton.dart';
import '../../sign_in/sign_in.dart';

class AuthenticationButtons extends StatelessWidget {
  const AuthenticationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        CustomProceedButton(
          title: 'Sign in with Email ID',
          customTextStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Metro',
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
          onPressed: () => Navigator.of(context).push(
            PageTransition(
              child: const SignInScreen(),
              type: PageTransitionType.fromRight,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 65,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).textTheme.displaySmall!.color!.withOpacity(.5),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/logos/google.png',
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  'Continue With Google',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.displaySmall?.color,
                    fontFamily: 'Metro',
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
