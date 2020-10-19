import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart' as adio;
import 'package:jh_im_sdk/util/tools.dart';

/// 创建者：王增阳
/// 开发者：王增阳
/// 版本：1.0
/// 创建日期：2020-02-19
///
class Http {
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  static Future<AnHttpResponse> doGet(
      String url, Map<String, String> headers) async {
    adio.BaseOptions options = new adio.BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
    );

    Map result;
    adio.Dio dio = new adio.Dio(options);
    AnHttpResponse httpResponse;

    try {
      adio.Response response = await dio.get(url,
          options: adio.Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'authorization': '${Data.token()}',
          }));

      if (response.statusCode == HttpStatus.ok) {
        result = await response.data;
      } else {
        result = {};
      }

      httpResponse = new AnHttpResponse(
          jsonEncode(result), response.statusCode, result['headers']);
    } on adio.DioError catch (e) {
      if (strNoEmpty(Data.token().toString())) {
        print('request.token：' + Data.token().toString());
      }

      print('request.url：' + url.toString());
      print('response.error：' + e.toString());
    }

    return httpResponse;
  }

  static Future<AnHttpResponse> doPost(
      String url, body, Map<String, String> headers) async {
    adio.BaseOptions options = new adio.BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
    );

    Map result;
    adio.Dio dio = new adio.Dio(options);
    AnHttpResponse httpResponse;

    try {
      adio.Response response = await dio.post(url,
          data: body,
          options: adio.Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            'authorization': '${Data.token()}',
          }));

      if (response.statusCode == HttpStatus.ok) {
        result = await response.data;
      } else {
        result = {};
      }

      httpResponse = new AnHttpResponse(
          jsonEncode(result), response.statusCode, result['headers']);
    } on adio.DioError catch (e) {
      if (strNoEmpty(Data.token().toString())) {
        print('request.token：' + Data.token().toString());
      }

      print('request.url：' + url.toString());
      print('request.body：' + jsonEncode(body));
      print('response.error：' + e.toString());
    }

    return httpResponse;
  }
}

class AnHttpResponse {
  final String body;
  final int code;
  final Map headers;

  AnHttpResponse(this.body, this.code, this.headers);
}
