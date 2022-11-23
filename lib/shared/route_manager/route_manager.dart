import 'package:flutter_todo/animations/page_transition.dart';
import 'package:flutter_todo/public.dart';
import 'package:flutter_todo/view/home/home.dart';

class RouteManager {
  void getToHome() {
    navKey.currentState!.pushAndRemoveUntil(
      PageTransition(
        child: const HomeScreen(),
        type: PageTransitionType.fromRight,
      ),
      (route) => false,
    );
  }
}
