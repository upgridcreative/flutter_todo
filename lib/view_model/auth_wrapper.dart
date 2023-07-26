import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthWrapperViewModel extends GetxController{
  final _storage = const FlutterSecureStorage();

  Future<bool> get isLoggedIn async {
    final isLoggedIn =  await _storage.read(key: 'access') != null;
    return isLoggedIn;
  }
}