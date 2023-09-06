import 'package:flutter/cupertino.dart';

import '../../public.dart';
import '../../view/core/home/home.dart';
import '../animations/page_transition.dart';

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
