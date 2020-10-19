import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shiku_flutter/api/other_api.dart';
import 'package:shiku_flutter/entity/login_code_entity.dart';
import 'package:shiku_flutter/entity/private_key_entity.dart';
import 'package:shiku_flutter/http/req.dart';
import 'package:shiku_flutter/model/api_config_model.dart';
import 'package:shiku_flutter/shiku_flutter.dart';
import 'package:shiku_flutter/tools/generate.dart';

class LoginApi {
  /*
  * 设备id
  * */
  static String get deviceId {
    if (Platform.isAndroid) {
      // android
      return "android"; //Android SDK built for x86
    } else {
      return "ios";
    }
  }

  /*
  * 获取登录码
  * */
  static Future<Map> getLoginCode(String passWord, String account) async {
    String loginPwMd5 = await ShikuFlutter.loginMd5(passWord);

    ///{"areaCode":"86","salt":"1586756571646","language":"zh",
    ///"secret":"ERgY44zTcp16H8A1ZuVyMA==","deviceId":"android","account":"1511","mac":"/tjK4HOIx38eGIlsCjmYNA=="}
    String areaCode = '86';

    int salt = DateTime.now().millisecondsSinceEpoch;
    String macStr = '${ApiConfigModel.apiKey}$areaCode$account$salt';
    String mac = await ShikuFlutter.macEncodeBase64(macStr, loginPwMd5);

    Map params = {
      "areaCode": areaCode,
      "account": account,
      "mac": mac,
      "salt": '$salt',
      "deviceId": deviceId,
      "language": "zh",
    };

    Map newParamsStr = await generateBeforeLoginParam(params);

    Map<String, dynamic> p = Map.from(newParamsStr);

    Map result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'auth/getLoginCode',
      params: p,
    );

    if (result['resultCode'] == 10110) {
      return getLoginCode(passWord, account);
    }

    return result;
  }

  /*
  * 获取登录Rsa私钥
  * */
  static Future<PrivateKeyEntity> getRsaPrivateKey({
    @required String passWord,
    @required LoginCodeEntity loginCodeModel,
  }) async {
    String loginPwMd5 = await ShikuFlutter.loginMd5(passWord);

    int salt = DateTime.now().millisecondsSinceEpoch;
    String macStr =
        '${ApiConfigModel.apiKey}${loginCodeModel.data.userId}$salt';
    String mac = await ShikuFlutter.macEncodeBase64(macStr, loginPwMd5);

    Map params = {
      "userId": loginCodeModel.data.userId,
      "mac": mac,
      "salt": '$salt',
      "language": "zh",
    };
    Map newParamsStr = await generateBeforeLoginParam(params);

    Map<String, dynamic> p = Map.from(newParamsStr);

    Map result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'authkeys/getLoginPrivateKey',
      params: p,
    );

    PrivateKeyEntity model = PrivateKeyEntity.fromJson(result);
    if (model.resultCode == 10110) {
      return getRsaPrivateKey(
          passWord: passWord, loginCodeModel: loginCodeModel);
    }
    return model;
  }

  static Future<String> loginTest(String passWord, String account) async {
    print('登录账号:$account,登录密码:$passWord');

    Map loginCodeMap = await getLoginCode(passWord, account);
    if (loginCodeMap['resultCode'] == 1040102) return loginCodeMap.toString();
    LoginCodeEntity loginCodeModel = LoginCodeEntity.fromJson(loginCodeMap);

    PrivateKeyEntity privateKeyEntity = await getRsaPrivateKey(
        passWord: passWord, loginCodeModel: loginCodeModel);
    String resultUrl = await ShikuFlutter.loginMethod(
      encryptedCode: loginCodeModel.data.code,
      encryptedPrivateKey: privateKeyEntity.data.privateKey,
      loginPassword: passWord,
      userId: loginCodeModel.data.userId,
    );
    Map result = await Req().get(url: resultUrl);
    String resultData = await ShikuFlutter.decodeLoginResult(
      result['data']['data'],
      privateKeyEntity.data.privateKey,
      false,
      loginPassword: passWord,
      encryptedCode: loginCodeModel.data.code,
    );
    return resultData;
  }

  static Future<String> loginHandle(String passWord, String account) async {
    print('登录账号:$account,登录密码:$passWord');

    Map loginCodeMap = await getLoginCode(passWord, account);
    if (loginCodeMap['resultCode'] == 1040102) return loginCodeMap.toString();
    LoginCodeEntity loginCodeModel = LoginCodeEntity.fromJson(loginCodeMap);

    PrivateKeyEntity privateKeyEntity = await getRsaPrivateKey(
        passWord: passWord, loginCodeModel: loginCodeModel);

    int salt = DateTime.now().millisecondsSinceEpoch;

    String data = await ShikuFlutter.aesEncryptBase64(
      encryptedCode: loginCodeModel.data.code,
      privateKeyStr: privateKeyEntity.data.privateKey,
      userId: loginCodeModel.data.userId,
      passWord: passWord,
      salt: '$salt',
    );

    Map serverTime = await OtherApi.getCurrentTime;

    Map param = {
      "data": Uri.encodeComponent(data),
      "userId": loginCodeModel.data.userId,
      "salt": '${serverTime['data']}',
      "deviceId": deviceId,
      "language": "zh",
    };

    Map newParamsStr = await generateBeforeLoginParam(param);

    Map<String, dynamic> p = Map.from(newParamsStr);

//    print('第二次时间戳::${p['salt']}');

//    p['salt'] = serverTime['data'];
//    p['salt'] = DateTime.now().millisecondsSinceEpoch;
    Map result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'user/login/v1',
      params: p,
//      isParamsUrl: true,
    );

//      if (result['resultCode'] == 10110) {
//        print('LoginHandle:::不通过，重新执行');
//        return loginHandle(passWord);
//      }

    return result.toString();
  }
}
