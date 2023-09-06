import 'package:dio/dio.dart' as dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../../../repository/service/api_manager.dart';
import '../../../repository/service/network_exceptions.dart';

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

    if (response is NetworkException) {
      return dio.Response(
        requestOptions: dio.RequestOptions(
          data: {},
        ),
        statusCode: 500,
      );
    }

    response as dio.Response;

    print(response.data);
    return response;
  }
}
