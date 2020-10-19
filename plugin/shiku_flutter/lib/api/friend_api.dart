import 'package:shiku_flutter/http/req.dart';
import 'package:shiku_flutter/model/api_config_model.dart';
import 'package:shiku_flutter/shiku_flutter.dart';
import 'package:shiku_flutter/tools/util.dart';

class FriendApi {
  // 获取关注列表
  static Future<String> attentionList() async {
    Map params = {
      "access_token": access_token,
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);
    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'friends/attention/list',
      params: p,
    );

    return result.toString();
  }

  // 获取黑名单列表
  static Future<String> blackList() async {
    Map params = {
      "access_token": access_token,
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'friends/blacklist',
      params: p,
    );

    return result.toString();
  }

  // 加关注 || 直接成为好友
  static Future<String> addFollow() async {
    Map params = {
      "access_token": access_token,
      'toUserId': defUserId,
      'fromAddType': '6',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    Map<String, dynamic> p = Map.from(newParamsStr);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'friends/attention/add',
      params: p,
    );

    return result.toString();
  }

  // 同意成为好友
  static Future<String> friendAgree() async {
    Map params = {
      "access_token": access_token,
      'toUserId': defUserId,
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'friends/add',
      params: p,
    );

    return result.toString();
  }

  // 拉黑
  static Future<String> friendBlackAdd() async {
    Map params = {
      "access_token": access_token,
      'toUserId': defUserId,
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'friends/blacklist/add',
      params: p,
    );

    return result.toString();
  }

  // 取消拉黑
  static Future<String> friendBlackDelete() async {
    Map params = {
      "access_token": access_token,
      'toUserId': defUserId,
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'friends/blacklist/delete',
      params: p,
    );

    return result.toString();
  }

  // 取消关注
  static Future<String> friendAttentionDelete() async {
    Map params = {
      "access_token": access_token,
      'toUserId': defUserId,
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'friends/attention/delete',
      params: p,
    );

    return result.toString();
  }

  // 删除好友
  static Future<String> friendDelete() async {
    Map params = {
      "access_token": access_token,
      'toUserId': defUserId,
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'friends/delete',
      params: p,
    );

    return result.toString();
  }

  // 备注好友
  static Future<String> friendsRemark() async {
    Map params = {
      "access_token": access_token,
      'toUserId': defUserId,
      'remarkName': '备注昵称',
      'describe': '备注描述',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'friends/remark',
      params: p,
    );

    return result.toString();
  }

  // 消息保存天数修改
  static Future<String> friendsMsgNumUpdate() async {
    Map params = {
      "access_token": access_token,
      'toUserId': defUserId,
      'chatRecordTimeOut': '30.0',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'friends/update',
      params: p,
    );

    return result.toString();
  }

  // 消息免打扰/阅后即焚/置顶聊天
//  参数名	参数类型	参数说明	是否必填
//  access_token	String	访问令牌	Y
//  offlineNoPushMsg	int	是否开启消息免打扰，阅后即焚，聊天置顶，0：关闭，1：开启	Y
//  toUserId	int	目标用户Id	Y
//  type	int	type = 0  消息免打扰 ,type = 1  阅后即焚 ,type = 2 聊天置顶	Y
  static Future<String> friendsOfflineNoPushMsg() async {
    Map params = {
      "access_token": access_token,
      'userId': defUserId,
      'toUserId': defUserId,
      'type': '1',
      'offlineNoPushMsg': '0',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'friends/update/OfflineNoPushMsg',
      params: p,
    );

    return result.toString();
  }
}
