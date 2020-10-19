import 'dart:async';
import 'dart:convert';
import 'dart:io' show HttpStatus; //Cookie, HttpHeaders

import 'package:jh_im_sdk/util/tools.dart';

/// 创建者：王增阳
/// 开发者：王增阳
/// 版本：1.0
/// 创建日期：2020-02-19
///
final _client = new HttpClient();

var _id = 0;

Future<dynamic> api(String url, bool doPost, bool retJson,
    [final obj, Duration cacheTime]) async {
//  Analytics.subEvent('API');

  final id = _id++;
  final httpUrl = '$serviceUrl$url';
  var requstBody;

  if (1 == 2) {
//    Analytics.subEvent('API_无网络');

    await new Future.delayed(
      const Duration(milliseconds: 100),
      () => new Future.error('-1::当前无可用网络::$url-$id'),
    );
  } else {
    AnHttpResponse response;

    if (doPost) {
      if (obj is BaseRequest) {
        requstBody = jsonDecode(jsonEncode(obj));

        for (final k in requstBody.keys.toList(growable: false)) {
          final v = requstBody[k];
          if (v == null || v == 'null') {
            requstBody.remove(k);
          }
        }
      } else {
        requstBody = obj;
      }

      try {
        response = await _client.post(
          httpUrl,
          body: requstBody,
          headers: const {
            'Content-Type': 'application/json'
          }, //application/x-www-form-urlencoded
        );
      } catch (e) {
        return '-1::网络连接失败::$url-$id';
      }
    } else {
      var query = new StringBuffer('?');

      if (obj is BaseRequest) {
        final map = jsonDecode(jsonEncode(obj));
        map.forEach((k, v) {
          if (v == null || v == 'null' || k == 'isFirstPage') return;

          query..write(k)..write('=')..write(v)..write('&');
        });
      } else if (query != null) {
        query.write(obj);
      }

      try {
        response = await _client.get('$httpUrl$query');
      } catch (e) {
        print(e);
        return '-1::网络连接失败::$url-$id';
      }
    }
    print(response);
    final statusCode = response?.code;

    switch (statusCode) {
      case HttpStatus.ok:
        final body = response.body;

        if (strNoEmpty(Data.token().toString())) {
          print('HTTP_REQUEST_TOKEN：' + Data.token().toString());
        }
        print('HTTP_REQUEST_URL::[$id]::$httpUrl');
        print('HTTP_REQUEST_BODY::[$id]::$requstBody');
        print('HTTP_RESPONSE_BODY::[$id]::$body');

        if (retJson) {
          final json = jsonDecode(body);

          /// 等后端指定规范，否则无法正常封装
//          if (json['Code'] == 0) {
          final result = json;

          return result;
//          } else if (json['Code'] == 10000102) {
//            //登录失效 去重新登录
////            LoginViewModel.loginOut();
//          }

//          return '${json['Code']}::${json['Message']}::$url-$id';
        } else {
          print('HTTP_REQUEST_URL::[$id]::$httpUrl');
          print('HTTP_REQUEST_BODY::[$id]::$requstBody');
          print('HTTP_RESPONSE_BODY::[$id]::$body');
          return body;
        }
        break;
      default:
        return '$statusCode::网络连接失败::$url-$id';
    }
  }
}

class HttpClient {
  Future<AnHttpResponse> get(url, {Map<String, String> headers}) async {
    final response = await Http.doGet(Uri.encodeFull(url), headers);
    return response;
  }

  Future<AnHttpResponse> post(url, {Map<String, String> headers, body}) async {
    final response = await Http.doPost(url, body, headers);
    return response;
  }
}
