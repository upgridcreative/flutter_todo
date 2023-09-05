import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import 'network_exceptions.dart';

class ApiManager {
  final _storage = FlutterSecureStorage();
  static const baseUrl = 'http://10.0.2.2:8000/';


  //get method
  Future<Object> getResponse({required String endPoint}) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + endPoint));
      responseJson = handleResponse(response);
    } on SocketException {
      return NoInternetException();
    }
    return responseJson;
  }

  Future<Object> postResponseUsingDio({
    required String endPoint,
    Object? payload,
  }) async {
    final token = await _storage.read(key: 'access');
    final dio = Dio();
    dio.options.headers["Authorization"] = 'Bearer $token';
    dynamic responseJson;
    try {
      final response = await dio.post(
        baseUrl + endPoint,
        data: payload,
      );
      responseJson = response;
    } on SocketException {
      return NoInternetException();
    }

    return responseJson;
  }

  //post method
  Future<Object> postResponse(
      {required String endPoint, Object? payload}) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + endPoint),
        body: payload,
      );
      responseJson = handleResponse(response);
    } on SocketException {
      return NoInternetException();
    }
    return responseJson;
  }

  Future<Object> postResponseWithToken(
      {required String endPoint, Object? payload}) async {
    dynamic responseJson;
    final token = await _storage.read(key: 'access');

    try {
      final response = await http.post(
        Uri.parse(baseUrl + endPoint),
        body: payload,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      responseJson = handleResponse(response);
    } on SocketException {
      return NoInternetException();
    }
    return responseJson;
  }

  //handle response
  dynamic handleResponse(http.Response response) {
    // final responseBody = jsonDecode(response.body);
    print(response.body);
    switch (response.statusCode) {
      case 429:
        return ThrottleRequestException();

      default:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
    }
  }
}
