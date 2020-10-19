import 'package:shiku_flutter/http/req.dart';
import 'package:shiku_flutter/model/api_config_model.dart';
import 'package:shiku_flutter/shiku_flutter.dart';
import 'package:shiku_flutter/tools/generate.dart';
import 'package:shiku_flutter/tools/util.dart';

class RegisterApi {
  /*
  * 注册处理
  * */
  static Future<String> registerHandle(
      String telephone, String passWord, String nickname) async {
    Map verify = await verifyPhoneNumber(telephone, '86');
    if (verify['resultCode'] == 1040107 || verify['resultCode'] == 0) {
      return verify.toString();
    }
    return mixRegister(telephone, passWord, nickname);
  }

  /*
  * 混合注册
  * */
  static Future<String> mixRegister(
      String telephone, String passWord, String nickname) async {
    print('注册账户::$telephone');

    final Map<String, dynamic> params = new Map<String, dynamic>();
    String _password = generateMd5(passWord);
    params['userType'] = "0";
    params["birthday"] = '1585404611';
    params["telephone"] = telephone;
    params["password"] = _password;
    params["areaCode"] = '86';
// 页面信息
    params["nickname"] = nickname;
    params["sex"] = "1";
    params["xmppVersion"] = "1";
    params["isSmsRegister"] = "0";

    Map newParamsStr = await registerParamsChange(params);

    newParamsStr['deviceId'] = 'android';

    Map<String, dynamic> gParamsStr =
        await generateBeforeLoginParam(newParamsStr);

    Map result = await Req().get(
      url: ApiConfigModel.apiUrl + 'user/register/v1',
      params: gParamsStr,
    );

    String resultData = await ShikuFlutter.decodeLoginResult(
        result['data']['data'], ApiConfigModel.apiKey, true);

    return resultData.toString();
  }

  /*
  * 检测用户是否注册
  * */
  static Future<Map> verifyPhoneNumber(
      String telephone, String areaCode) async {
    try {
      Map<String, dynamic> params = {
        "telephone": telephone,
        "areaCode": areaCode,
      };

      Map<String, dynamic> newParamsStr =
          await generateBeforeLoginParam(params);

      var result = await Req().get(
        url: ApiConfigModel.apiUrl + 'verify/telephone',
        params: newParamsStr,
      );

      return result;
    } catch (e) {
      return {'resultCode': 0, 'resultMsg': '出现错误'};
    }
  }
}
