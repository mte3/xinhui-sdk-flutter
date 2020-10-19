import 'dart:collection';
import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:shiku_flutter/model/api_config_model.dart';
import 'package:shiku_flutter/shiku_flutter.dart';

/// 加密算法作者：王增阳

/*
* 算法生成登录前加密
* */
Future<dynamic> generateBeforeLoginParam(Map params) async {
  String salt = params.remove("salt");
  if (salt == null) salt = '${DateTime.now().millisecondsSinceEpoch}';

  SplayTreeMap<String, Object> st = new SplayTreeMap<String, Object>();
  st = SplayTreeMap.from(params);
  StringBuffer sb = new StringBuffer();
  for (String value in st.values) {
    sb.write(value);
  }

  String macContent = ApiConfigModel.apiKey + sb.toString() + salt;
  var key = crypto.md5.convert(utf8.encode(ApiConfigModel.apiKey));
  var mac = new crypto.Hmac(crypto.md5, key.bytes);
  var digest = mac.convert(utf8.encode(macContent));
  var encoded1 = base64Encode(digest.bytes);

  params["salt"] = salt;
  params["secret"] = encoded1;
  Map<String, dynamic> p = Map.from(params);

  return p;
}

/*
* 注册参数改变
* */
Future<dynamic> registerParamsChange(Map params) async {
  String salt = '${DateTime.now().millisecondsSinceEpoch}';
  var code = crypto.md5.convert(utf8.encode(ApiConfigModel.apiKey));

  SplayTreeMap<String, Object> st = new SplayTreeMap<String, Object>();
  st = SplayTreeMap.from(params);
  StringBuffer sb = new StringBuffer();
  for (String value in st.values) {
    sb.write(value);
  }
  String macContent = ApiConfigModel.apiKey + sb.toString() + salt;
  var mac = new crypto.Hmac(crypto.md5, code.bytes);
  var digest = mac.convert(utf8.encode(macContent));
  var encoded1 = base64Encode(digest.bytes);

  Map jsonMap = new Map();
  jsonMap.addAll(params);
  jsonMap['mac'] = encoded1;

  String data = await ShikuFlutter.singleAESEncryptBase64(
    json.encode(jsonMap),
    ApiConfigModel.apiKey,
    code: code.bytes,
  );
  Map p = new Map();
  p["data"] = data;
  p["salt"] = salt;

  return p;
}
