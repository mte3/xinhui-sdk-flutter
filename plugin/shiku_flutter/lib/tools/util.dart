import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

const access_token = "b5b2915326cd4cb980d8f0d0091bcaf9";
const defUserId = "10000041";
const httpKey = "y2E9hEap4/GwQVvE3Yq4Qw==";

/// statusBarHeight
///
/// 状态栏高度
double statusBarHeight(BuildContext context) {
  return MediaQueryData.fromWindow(window).padding.top;
}

/// Screen width
///
/// 屏幕宽度
double winWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Screen height
///
/// 屏幕高度
double winHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// 字符串不为空
bool strNoEmpty(String value) {
  if (value == null) return false;

  return value.trim().isNotEmpty;
}

/// Map不为空
bool mapNoEmpty(value) {
  if (value == null) return false;
  return value.isNotEmpty;
}

/// md5 加密
String generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}
