import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../service/api_manager.dart';
import '../datasources/remote_datasource.dart';

class SyncDataDownStream extends GetxController {
  static final SyncDataDownStream instance = Get.find();

  final apiManager = ApiManager();
  final SyncRemoteDataSource dataSource = Get.find();

  Future<void> syncDataDownStream(Object? payload) async {
    final response = await apiManager.postResponseUsingDio(
      endPoint: 'api/sync/v1/',
      payload: payload,
    );

    response as dio.Response;

    final data = response.data;

    dataSource.processData(data);
  }
}
