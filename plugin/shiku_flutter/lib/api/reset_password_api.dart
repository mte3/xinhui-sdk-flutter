import 'package:flutter/foundation.dart';
import 'package:shiku_flutter/http/req.dart';
import 'package:shiku_flutter/model/api_config_model.dart';
import 'package:shiku_flutter/shiku_flutter.dart';
import 'package:shiku_flutter/tools/generate.dart';

class ResetPasswordApi {
  static Future<String> resetPasswordHandle({
    @required String phoneNumber,
    @required String authCode,
    @required String password,
  }) async {
    String loginPwMd5 = await ShikuFlutter.loginMd5(password);

    // 获取图形验证码
//    await getImgCode(phoneNumber);
//
//    await getRandCode(phoneNumber);

    Map params = {
      "telephone": phoneNumber,
      "randcode": authCode,
      "areaCode": '86',
      "newPassword": loginPwMd5,
    };

    Map newParamsStr = await generateBeforeLoginParam(params);

    Map<String, dynamic> p = Map.from(newParamsStr);

    Map result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'user/password/reset',
      params: p,
    );

    return result.toString();
  }

  /*
  * 获取图形验证码
  * */
  static Future<String> getImgCode(String telephone) async {
//    Map<String, dynamic> params = {'telephone': '86' + telephone};
    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'getImgCode',
//      params: params,
    );
    return result.toString();
  }

  /*
  * 获取手机验证码
  * */
  static Future<String> getRandCode(String phoneNumber) async {
    Map params = {
      'areaCode': '86',
      'telephone': phoneNumber,
      'imgCode': 'test',
      'isRegister': '0',
      'version': '1',
    };

    Map newParamsStr = await generateBeforeLoginParam(params);

    Map<String, dynamic> p = Map.from(newParamsStr);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'basic/randcode/sendSms',
      params: p,
    );
    return result.toString();
  }
}
