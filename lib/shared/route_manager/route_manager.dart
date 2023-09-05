import 'package:flutter/cupertino.dart';

import '../animations/page_transition.dart';
import '../../public.dart';
import '../../view/core/home/home.dart';

class RouteManager {
  void getToHome() {
    navKey.currentState!.pushAndRemoveUntil(
      PageTransition(
        child: const SafeArea(child: HomeScreen()),
        type: PageTransitionType.fromRight,
      ),
      (route) => false,
    );
  }
}
