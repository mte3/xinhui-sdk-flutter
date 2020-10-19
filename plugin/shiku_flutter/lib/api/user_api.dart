import 'package:shiku_flutter/http/req.dart';
import 'package:shiku_flutter/model/api_config_model.dart';
import 'package:shiku_flutter/shiku_flutter.dart';
import 'package:shiku_flutter/tools/util.dart';

class UserApi {
  // 获取用户资料
  static Future<String> getUserInfo() async {
    Map<String, String> params = {
      "access_token": access_token,
      "language": 'zh',
    };

    Map newParams = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    Map<String, dynamic> p = Map.from(newParams);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'user/get',
      params: p,
    );

    return result.toString();
  }

  // 查询搜索列表
  static Future<String> searchUserList(String nickname) async {

    Map<String, String> params = {
      "access_token": access_token,
      "pageIndex": '0',
      "pageSize": '10',
      "nickname":nickname,
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    Map<String, dynamic> p = Map.from(newParamsStr);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'nearby/user',
      params: p,
    );

    return result.toString();
  }

  // 获取附近的人
  static Future<String> nearbyUser() async {

    Map params = {
      "access_token": access_token,
      "pageIndex": '0',
      "pageSize": "20",
      "latitude": '0.0',
      "longitude": '0.0',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;

    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'nearby/user',
      params: p,
    );

    return result.toString();
  }
}
