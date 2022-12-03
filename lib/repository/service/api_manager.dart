import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

import './network_exceptions.dart';

class ApiManager {
  static const baseUrl = 'http://192.168.18.61:8000/';
  //get method
  Future<Object> getResponse({required String endPoint}) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + endPoint));
      responseJson = handleResponse(response);
    } on SocketException {
      throw NoInternetException();
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
      throw NoInternetException();
    }
    return responseJson;
  }

  //handle response
  dynamic handleResponse(http.Response response) {
    // final responseBody = jsonDecode(response.body);

    switch (response.statusCode) {
      case 429:
        return ThrottleRequestException();

      default:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
    }
  }
}
