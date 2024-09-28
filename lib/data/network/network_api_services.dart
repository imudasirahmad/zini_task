import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:zini_task/data/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getPostApiResponse(dynamic data, String url, String token) async {
    dynamic responseJson;
    if (kDebugMode) {
      print(url);
      print(data);
      print(token);
    }

    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
            },
            body: data == null ? null : jsonEncode(data),
          )
          .timeout(
            const Duration(
              seconds: 20,
            ),
          );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getGetApiResponse(String url, String token, {dynamic data}) async {
    dynamic responseJson;
    if (kDebugMode) {
      print(url);
      print(token);
      print(data);
    }

    try {
      final request = http.Request("GET", Uri.parse(url));

      if (data != null) {
        request.body = jsonEncode(data);
      }

      request.headers.addAll(
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final response = await request.send().timeout(
            const Duration(
              seconds: 20,
            ),
          );

      responseJson = returnResponse(await http.Response.fromStream(response));
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print("Response API : ${response.request}");
      print("StatusCode: ${response.statusCode}");
      print("Response: ${response.body}");
    }
    final responseBody = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        return responseBody;
      case 201:
        return responseBody;
      case 204:
        return true;
      case 400:
        throw BadRequestException(
          responseBody["message"],
        );
      case 401:
        throw UnauthorizedException(
          responseBody["message"],
        );
      case 403:
        throw UnauthorizedException(
          responseBody["message"],
        );
      case 422:
        throw UnauthorizedException(
          responseBody["message"],
        );
      default:
        throw BadRequestException(
          "Status-Code: ${response.statusCode}\n${responseBody['errors']}",
        );
    }
  }
}
