import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shiku_flutter/http/api.dart';
import 'package:shiku_flutter/tools/util.dart';

// 请求计数
var _id = 0;

// 连接超时时间为5秒
const int connectTimeOut = 5 * 1000;

// 响应超时时间为7秒
const int receiveTimeOut = 7 * 1000;

/*
* 请求类型枚举
* */
enum RequestType { GET, POST }

class Req {
  /*
  * get请求
  * */
  Future<dynamic> get({@required String url, params}) async {
    return this._request(
      url: url,
      method: RequestType.GET,
      params: params,
    );
  }

  /*
  * post请求
  * */
  Future post(
      {@required String url, Map params, bool isParamsUrl = false}) async {
    return this._request(
      url: url,
      method: RequestType.POST,
      params: params,
      isParamsUrl: isParamsUrl,
    );
  }

  /*
  * post请求-文件上传方式
  * */
  Future postUpload(
    ProgressCallback progressCallBack, {
    FormData formData,
    @required String url,
    params,
  }) async {
    return this._request(
      url: url,
      method: RequestType.POST,
      formData: formData,
      progressCallBack: progressCallBack,
      params: params,
    );
  }

  /*
  * 请求方法
  * */
  Future _request({
    String url,
    RequestType method,
    Map<dynamic, dynamic> params,
    FormData formData,
    ProgressCallback progressCallBack,
    bool isParamsUrl,
  }) async {
    Dio _client;
    final BaseOptions options = new BaseOptions();

    if (_client == null) {
      options.connectTimeout = connectTimeOut;
      options.receiveTimeout = receiveTimeOut;
      options.headers = const {
        'Content-Type': 'application/json',
        HttpHeaders.userAgentHeader:
            "shiku_im/1.3.2 (Linux; U; Android 5.1.1; Nexus 5 Build/LMY48B)",
//            "shiku_im/1.3.2 (Linux; U; Android 9; SEA-AL10 Bu",
      };
//      options.baseUrl = API.reqUrl;
      _client = new Dio(options);
    }

    final id = _id++;
    int statusCode;
    Response response;

//    var firstCookies = response.headers[HttpHeaders.setCookieHeader];
//    options.headers[HttpHeaders.cookieHeader] = firstCookies;

//    if (params != null && !params.containsKey('language')) {
//      params["language"] = "zh";
//    }

    if (method == RequestType.GET) {
      ///组合GET请求的参数
      if (mapNoEmpty(params)) {
        response = await _client.get(
          url,
          queryParameters: params,
        );
      } else {
        response = await _client.get(
          url,
        );
      }
    } else {
      if (mapNoEmpty(params) && isParamsUrl) {
        var query = new StringBuffer('?');

        final map = jsonDecode(jsonEncode(params));
        map.forEach((k, v) {
          if (v == null || v == 'null' || k == 'isFirstPage') return;

          query..write(k)..write('=')..write(v)..write('&');
        });

        response = await _client.post(
          '$url$query',
          onSendProgress: progressCallBack,
        );
        print('HTTP_REQUEST_TATOL::[$id]::${API.reqUrl}$url$query');
      } else if (mapNoEmpty(params) || formData != null) {
        response = await _client.post(
          url,
          data: formData ?? params,
          onSendProgress: progressCallBack,
        );
      } else {
        response = await _client.post(
          url,
        );
      }
    }

    statusCode = response.statusCode;

    if (response != null) {
      print('HTTP_REQUEST_URL::[$id]::$url');
      if (mapNoEmpty(params)) {
        print('HTTP_REQUEST_BODY::[$id]::${json.encode(params)}');
      }
      print('HTTP_RESPONSE_BODY::[$id]::${json.encode(response.data)}');
      return response.data;
    }

    ///处理错误部分
    if (statusCode < 0) {
      return _handError(statusCode);
    }
  }

  ///处理异常
  static Future _handError(int statusCode) {
    String errorMsg = 'Network request error';
    Map errorMap = {"errorMsg": errorMsg, "errorCode": statusCode};

    print("HTTP_RESPONSE_ERROR::$errorMsg code:$statusCode");
    return Future.value(errorMap);
  }
}
