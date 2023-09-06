import 'package:flutter/material.dart';

import '../../../../shared/animations/animations.dart';
import 'auth_options.dart';
import 'intro.dart';
import 'logo.dart';
import 'sign_up.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ScaleAnimation(
              child: WelcomeScreenLogo(),
            ),
            FadeAnimation(
              child: WelcomeIntro(),
            ),
            SlideAnimation(
              begin: Offset(0, 50),
              child: AuthenticationButtons(),
            ),
            Spacer(),
            SlideAnimation(
              begin: Offset(0, 50),
              child: SignUpLink(),
            ),
          ],
        ),
      ),
    );
  }
}
