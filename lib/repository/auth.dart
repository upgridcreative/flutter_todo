import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../model/sign_up.dart';
import '../service/api_manager.dart';
import '../service/network_exceptions.dart';

class AuthenticationRepository {
  ApiManager apiManager = ApiManager();
  final _storage = const FlutterSecureStorage();

  Future<String> signUp(
    String firstName,
    String lastName,
    String password,
    String email,
  ) async {
    final response = await apiManager.postResponse(
      endPoint: 'api/auth/register/',
      payload: {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
      },
    );

    return handleAuthenticationResponse(response);
  }

  Future<String> signIn(String email, String password) async {
    final response = await apiManager.postResponse(
      endPoint: 'api/auth/login/',
      payload: {
        'email': email,
        'password': password,
      },
    );

    return handleAuthenticationResponse(response);
  }

  Future<String> handleAuthenticationResponse(response) async {
    if (response is NetworkException) {
      return 'all-purpose'; //Return apprptre code for netwrk expection
    }

    response as Map<String, dynamic>;

    if (response['code'] != 'successful') {
      //Handle error by displaying message using viewmodel in the view
      return response['code'];
    }

    final _model = AuthenticationModel.fromJson(response);

    await _storage.write(key: 'access', value: _model.accessToken);
    await _storage.write(key: 'refresh', value: _model.refreshToken);

    return 'proceed';
  }
}
