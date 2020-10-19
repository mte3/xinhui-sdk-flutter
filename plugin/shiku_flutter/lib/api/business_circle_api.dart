import 'package:shiku_flutter/http/req.dart';
import 'package:shiku_flutter/model/api_config_model.dart';
import 'package:shiku_flutter/shiku_flutter.dart';
import 'package:shiku_flutter/tools/util.dart';

class BusinessCircleApi {
  // 获取公共消息
  static Future<String> circleMsgList() async {
    Map params = {"access_token": access_token, "pageSize": "20"};

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);
    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'b/circle/msg/list',
      params: p,
    );

    return result.toString();
  }

  // 发布一条公共消息
  static Future<String> msgDdd() async {
    Map params = {"access_token": access_token};
    // 消息类型：1=文字消息；2=图文消息；3=语音消息；4=视频消息；
    params["type"] = "3";
    // 消息标记：1：求职消息；2：招聘消息；3：普通消息；
    params["flag"] = "3";
    // 消息隐私范围：1=公开；2=私密；3=部分选中好友可见；4=不给谁看
    params["visible"] = "1";
    // 消息内容
    params["text"] = 'test';
    params["audios"] = 'http://example.com/';
    params["isAllowComment"] = '1';
    params["cityId"] = "0";
    // 纬度
    params["latitude"] = '0.0';
    // 经度
    params["longitude"] = '0.0';
    // 位置
    params["location"] = '0.0';
    // 手机型号
    params["model"] = '未知';
    // 手机操作系统版本号
    params["osVersion"] = '10';

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);
    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'b/circle/msg/add',
      params: p,
    );

    return result.toString();
  }

  // 获取某个用户的最新公共消息
  static Future<String> getMsgUser() async {
    Map params = {
      "access_token": access_token,
      "userId": defUserId,
      'flag': '3',
      'pageSize': '20',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);
    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'b/circle/msg/user',
      params: p,
    );

    return result.toString();
  }

  // 根据IDS批量获取公共消息的接口(我的商务圈使用)
  static Future<String> getIDSMsg() async {
    Map params = {
      "access_token": access_token,
      "ids": defUserId,
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);
    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'b/circle/msg/gets',
      params: p,
    );

    return result.toString();
  }
}
