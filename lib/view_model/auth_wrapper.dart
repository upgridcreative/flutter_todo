import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../repository/category.dart';
import '../repository/task.dart';
import '../view/authentication/welcome/welcome.dart';
import 'package:get/get.dart';

class AuthWrapperViewModel extends GetxController {
  final _storage = const FlutterSecureStorage();
  final isLoggingOut = false.obs;

  Future<bool> get isLoggedIn async {
    // await _storage.delete(key: 'access');
    final isLoggedIn = await _storage.read(key: 'access') != null;
    return isLoggedIn;
  }

  Future<void> logout() async {

    await CategoryRepository.instance.onLogout();
    await TaskRepository.instance.onLogout();

    await _storage.deleteAll();

    Get.offAll(() => const WelcomeScreen());
  }
}
