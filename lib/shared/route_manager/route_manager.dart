import '../../animations/page_transition.dart';
import '../../public.dart';
import '../../view/home/home.dart';

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
