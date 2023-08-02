import 'package:dio/dio.dart' as dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../service/api_manager.dart';

class SyncDataUpSteam extends GetxController {
  static final SyncDataUpSteam instance = Get.find();

  late final String? accessToken;

  final apiManager = ApiManager();
  final _storage = const FlutterSecureStorage();

  @override
  onInit() {
    super.onInit();
    initializeToken();
  }

  Future<void> initializeToken() async {
    accessToken = await _storage.read(key: '');
  }

  Future<dio.Response> syncUpstream(upStreamActionData) async {
    final response = await apiManager.postResponseUsingDio(
      endPoint: 'api/sync/v1/',
      payload: upStreamActionData,
    );

    response as dio.Response;

    print(response.data);
    return response;
  }
}
