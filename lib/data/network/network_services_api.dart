import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_clean_architecture_yt/data/exceptions/app_exceptions.dart';
import 'package:bloc_clean_architecture_yt/data/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 50));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      // RequestTimeOutException
      throw FetchDataException('Time out try again!!!');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, var data) async {
    dynamic jsonResponse;
    if (kDebugMode) {
      print('Url: $url');
      print('Data Send: $data');
    }
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {'x-api-key': 'reqres-free-v1'},
            body: data,
          )
          .timeout(Duration(seconds: 50));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      // RequestTimeOutException
      throw FetchDataException('Time out try again!!!');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .delete(Uri.parse(url))
          .timeout(Duration(seconds: 50));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      // RequestTimeOutException
      throw FetchDataException('Time out try again!!!');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorisedException();
      case 500:
        throw FetchDataException(
          'Error communicating with server' + response.statusCode.toString(),
        );
      default:
        throw FetchDataException('This is default state');
    }
  }
}
