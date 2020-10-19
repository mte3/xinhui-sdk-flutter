import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shiku_flutter/api/business_circle_api.dart';
import 'package:shiku_flutter/api/friend_api.dart';
import 'package:shiku_flutter/api/group_api.dart';
import 'package:shiku_flutter/api/user_api.dart';
import 'package:shiku_flutter/api/init_api.dart';
import 'package:shiku_flutter/api/login_api.dart';
import 'package:shiku_flutter/api/register_api.dart';
import 'package:shiku_flutter/api/reset_password_api.dart';

class ShikuFlutter {
  static const MethodChannel _channel = const MethodChannel('shiku_flutter');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> loginMethod({
    @required String encryptedCode,
    @required String encryptedPrivateKey,
    @required String loginPassword,
    @required String userId,
  }) async {
    final String result = await _channel.invokeMethod(
      'loginMethod',
      <String, dynamic>{
        'encryptedCode': encryptedCode,
        'encryptedPrivateKey': encryptedPrivateKey,
        'loginPassword': loginPassword,
        'userId': userId,
      },
    );
    return result;
  }

  static Future<String> showToast(String text) async {
    final String result = await _channel.invokeMethod(
      'toast',
      <String, dynamic>{'text': text},
    );
    return result;
  }

  static Future<String> decodeLoginResult(
    String data,
    String code,
    bool isRegister, {
    String loginPassword,
    String encryptedCode,
  }) async {
    final String result = await _channel.invokeMethod(
      'decodeLoginResult',
      <String, dynamic>{
        'data': data,
        'code': code,
        'isRegister': isRegister,
        'loginPassword': loginPassword,
        'encryptedCode': encryptedCode,
      },
    );
    return result;
  }

  static Future<String> base64Decode(String value) async {
    final String result = await _channel.invokeMethod(
      'base64Decode',
      <String, dynamic>{'value': value},
    );
    return result;
  }

  static Future<String> macEncodeBase64(
      String text, String loginPasswordMd5) async {
    final String result = await _channel.invokeMethod(
      'MacEncodeBase64',
      <String, dynamic>{'text': text, 'loginPasswordMd5': loginPasswordMd5},
    );
    return result;
  }

  static Future<String> loginMd5(String loginPassword) async {
    final String result = await _channel.invokeMethod(
      'LoginMd5',
      <String, dynamic>{'loginPassword': loginPassword},
    );
    return result;
  }

//
//  static Future<String> joinValues(Map<String, String> params) async {
//    final String result = await _channel.invokeMethod(
//      'joinValues',
//      <String, dynamic>{'params': params},
//    );
//    return result;
//  }

  static Future<String> aesEncryptBase64({
    @required String encryptedCode,
    @required String privateKeyStr,
    @required String userId,
    @required String passWord,
    @required String salt,
  }) async {
    final String result = await _channel.invokeMethod(
      'aesEncryptBase64',
      <String, dynamic>{
        'encryptedCode': encryptedCode,
        'privateKeyStr': privateKeyStr,
        'userId': userId,
        'passWord': passWord,
        'salt': salt,
      },
    );
    return result;
  }

  static Future<dynamic> generateBeforeLoginParamSpecial(
      Map params, String userId, accessToken, String httpKey) async {
    final result = await _channel.invokeMethod(
      'generateBeforeLoginParamSpecial',
      <String, dynamic>{
        'params': params,
        'userId': userId,
        'accessToken': accessToken,
        'httpKey': httpKey,
      },
    );
    return result;
  }

  static Future<String> singleAESEncryptBase64(String text, String apiKey,
      {Uint8List code}) async {
    final result = await _channel.invokeMethod(
      'singleAESEncryptBase64',
      <String, dynamic>{
        'text': text,
        'apiKey': apiKey,
        'code': code,
      },
    );
    return result;
  }

  static Future<String> config(String url) => InitApi.config(url);

  static Future<String> loginHandle(String passWord, String account) =>
      LoginApi.loginHandle(passWord, account);

  static Future<String> loginTest(String passWord, String account) =>
      LoginApi.loginTest(passWord, account);

  /// 注册
  static Future<String> registerHandle({
    @required String telephone,
    @required String passWord,
    @required String nickname,
  }) {
    return RegisterApi.registerHandle(telephone, passWord, nickname);
  }

  /// 重置密码
  static Future<String> resetPassword({
    @required String phoneNumber,
    @required String authCode,
    @required String password,
  }) {
    return ResetPasswordApi.resetPasswordHandle(
        phoneNumber: phoneNumber, authCode: authCode, password: password);
  }

  /// 获取用户资料
  static Future<String> getUserInfo() => UserApi.getUserInfo();

  /// 获取用户资料
  static Future<String> nearbyUser() => UserApi.nearbyUser();

  /// 搜索用户
  static Future<String> searchUserList(String nickname) =>
      UserApi.searchUserList(nickname);

  /// 获取公共消息
  static Future<String> circleMsgList() => BusinessCircleApi.circleMsgList();

  /// 发布一条公共消息
  static Future<String> businessMsgDdd() => BusinessCircleApi.msgDdd();

  /// 获取某个用户的最新公共消息
  static Future<String> businessMsgUser() => BusinessCircleApi.getMsgUser();

  /// 根据IDS批量获取公共消息的接口(我的商务圈使用)
  static Future<String> businessIDSMsg() => BusinessCircleApi.getIDSMsg();

  //  好友
  /// 获取关注列表
  static Future<String> friendAttentionList() => FriendApi.attentionList();

  /// 获取黑名单列表
  static Future<String> friendBlackList() => FriendApi.blackList();

  /// 加关注 || 直接成为好友
  static Future<String> friendAddFollow() => FriendApi.addFollow();

  /// 同意成为好友
  static Future<String> friendAgree() => FriendApi.friendAgree();

  /// 拉黑
  static Future<String> friendBlackAdd() => FriendApi.friendBlackAdd();

  /// 取消拉黑
  static Future<String> friendBlackDelete() => FriendApi.friendBlackDelete();

  /// 取消关注
  static Future<String> friendAttentionDelete() =>
      FriendApi.friendAttentionDelete();

  /// 删除好友
  static Future<String> friendDelete() => FriendApi.friendDelete();

  /// 备注好友
  static Future<String> friendsRemark() => FriendApi.friendsRemark();

  /// 消息保存天数修改
  static Future<String> friendsMsgNumUpdate() =>
      FriendApi.friendsMsgNumUpdate();

  /// 消息免打扰/阅后即焚/置顶聊天
  static Future<String> friendsOfflineNoPushMsg() =>
      FriendApi.friendsOfflineNoPushMsg();

  /// 创建群组
  static Future<String> roomAdd() => GroupApi.roomAdd();

  /// 加入群组
  static Future<String> roomJoin() => GroupApi.roomJoin();

  /// 添加成员
  static Future<String> roomAddMember() => GroupApi.roomAddMember();

  /// 删除群组
  static Future<String> roomDelete() => GroupApi.roomDelete();

  /// 删除成员 || 退出群组
  static Future<String> roomMemberDelete() => GroupApi.roomMemberDelete();

  /// 转让群组
  static Future<String> roomTransfer() => GroupApi.roomTransfer();

  /// 群复制
  static Future<String> roomCopy() => GroupApi.roomCopy();

  /// 获取群组
  static Future<String> roomGet() => GroupApi.roomGet();

  /// 获取群组列表
  static Future<String> roomList() => GroupApi.roomList();

  /// 成员列表
  static Future<String> roomMemberList() => GroupApi.roomMemberList();

  /// 获取某个用户已经加入的房间列表
  static Future<String> roomListHis() => GroupApi.roomListHis();

  /// 获取自己的成员信息以及群属性
  static Future<String> roomGetRoom() => GroupApi.roomGetRoom();

  /// 设置群组
  static Future<String> roomUpdate() => GroupApi.roomUpdate();

  /// 指定管理员
  static Future<String> roomSetAdmin() => GroupApi.roomSetAdmin();

  /// 指定隐身人，监控人，
  static Future<String> roomInvisibleGuardian() =>
      GroupApi.roomInvisibleGuardian();

  /// 编辑群公告
  static Future<String> roomUpdateNotice() => GroupApi.roomUpdateNotice();

  /// 删除群公告
  static Future<String> roomDeleteNotice() => GroupApi.roomDeleteNotice();

  /// 面对面建群查询
  static Future<String> roomLocationQuery() => GroupApi.roomLocationQuery();

  /// 面对面建群加入
  static Future<String> roomLocationJoin() => GroupApi.roomLocationJoin();

  /// 面对面建群退出
  static Future<String> roomLocationExit() => GroupApi.roomLocationExit();

  /// 获取手机验证码
  static Future<String> getRandCode(phoneNumber) =>
      ResetPasswordApi.getRandCode(phoneNumber);

  /// 获取手机验证码
  static Future<String> getImgCode(phoneNumber) =>
      ResetPasswordApi.getImgCode(phoneNumber);

  /// 检测手机号有没有被注册
  static Future<String> verifyPhoneNumber(
      {@required String telephone, @required String areaCode}) async {
    return RegisterApi.verifyPhoneNumber(telephone, areaCode).toString();
  }
}
