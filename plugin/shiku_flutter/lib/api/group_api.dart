import 'package:shiku_flutter/http/req.dart';
import 'package:shiku_flutter/model/api_config_model.dart';
import 'package:shiku_flutter/shiku_flutter.dart';
import 'package:shiku_flutter/tools/util.dart';

class GroupApi {
  static Future<String> roomAdd() async {
    Map params = {
      "access_token": access_token,
      'jid': DateTime.now().microsecondsSinceEpoch.toString(),
      'name': '群' + DateTime.now().microsecondsSinceEpoch.toString(),
      'desc': '描述',
      'countryId': '0',
      // 群主设置 群内消息是否发送已读 回执 显示数量
      'showRead': '0',
      // 群组是否公开 1 不公开  0 公开群组
      "isLook": "1",
      // 加群是否需要验证 1 开启验证 0关闭验证
      "isNeedVerify": "0",
      'showMember': '1',
      'allowSendCard': '1',
      "allowInviteFriend": "1",
      "allowUploadFile": "1",
      "allowConference": "1",
      "allowSpeakCourse": "1",
      "category": "510",
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/add',
      params: p,
    );

    return result.toString();
  }

  // 加入群组
  static Future<String> roomJoin() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
      "type": "2",
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/join',
      params: p,
    );

    return result.toString();
  }

  // 添加成员
  static Future<String> roomAddMember() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
      "text": "[10004541,10007042]",
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/member/update',
      params: p,
    );

    return result.toString();
  }

  // 删除群组
  static Future<String> roomDelete() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/delete',
      params: p,
    );

    return result.toString();
  }

  // 删除成员 || 退出群组
  static Future<String> roomMemberDelete() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
      'userId': '188',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/member/delete',
      params: p,
    );

    return result.toString();
  }

  // 转让群组
  static Future<String> roomTransfer() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
      'toUserId': '188',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/transfer',
      params: p,
    );

    return result.toString();
  }

  // 群复制
  static Future<String> roomCopy() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/copyRoom',
      params: p,
    );

    return result.toString();
  }

  // 获取群组
  static Future<String> roomGet() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
      'pageSize': '20',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/get',
      params: p,
    );

    return result.toString();
  }

  // 获取群组列表
  static Future<String> roomList() async {
    Map params = {
      "access_token": access_token,
      'pageIndex': '0',
      'pageSize': '20',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/list',
      params: p,
    );

    return result.toString();
  }

  // 成员列表
  static Future<String> roomMemberList() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
      'joinTime': '0',
      'pageSize': '20',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/member/getMemberListByPage',
      params: p,
    );

    return result.toString();
  }

  // 获取某个用户已经加入的房间列表
  static Future<String> roomListHis() async {
    Map params = {
      "access_token": access_token,
      'type': '0',
      'pageIndex': '0',
      'pageSize': '1000',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/list/his',
      params: p,
    );

    return result.toString();
  }

  // 获取自己的成员信息以及群属性
  static Future<String> roomGetRoom() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    params = newParamsStr;
    Map<String, dynamic> p = Map.from(params);

    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'room/getRoom',
      params: p,
    );

    return result.toString();
  }

  // 设置群组
  static Future<String> roomUpdate() async {
//    参数名	参数类型	参数说明	是否必填
//    access_token	String	访问令牌	Y
//    roomId	String	房间Id	Y
//    roomName	String	群名名称	N
//    notice	String	群组公告内容	N
//    desc	String	群组说明	N
//    showRead	Int	显示群消息已读人数 1 显示 0关闭	N
//    isNeedVerify	int	加群是否需要验证 1 开启验证 0关闭验证	N
//    isLook	int	群组是否公开 1 不公开  0 公开群组	N
//    allowSendCard	int	允许成员私聊 1允许私聊 0不允许私聊	N
//    chatRecordTimeOut	long	群组聊天记录删除时间 秒 值为到期时间	N
//    allowInviteFriend	int	允许成员 邀请好友 1 允许 0 禁止	N
//    allowUploadFile	int	允许成员上传 群共享文件  1允许 0 禁止	N
//    allowConference	int	允许成员召开会议 1允许 0禁止	N
//    allowSpeakCourse	int	允许成员 开启讲课 1允许 0禁止	N
//    talkTime	long	全员禁言  long 到期时间	N
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
      'allowSpeakCourse': '1',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    Map<String, dynamic> p = Map.from(newParamsStr);

    var result = await Req().get(url: 'room/update', params: p);

    return result.toString();
  }

  // 指定管理员
  static Future<String> roomSetAdmin() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
      'touserId': defUserId,
      'type': '2',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    Map<String, dynamic> p = Map.from(newParamsStr);

    var result = await Req().get(url: 'room/set/admin', params: p);

    return result.toString();
  }

  // 指定隐身人，监控人，
  static Future<String> roomInvisibleGuardian() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
      'touserId': defUserId,
      'type': '5',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    Map<String, dynamic> p = Map.from(newParamsStr);

    var result = await Req().get(url: 'room/setInvisibleGuardian', params: p);

    return result.toString();
  }

  // 编辑群公告
  static Future<String> roomUpdateNotice() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
      'noticeId': defUserId,
      'noticeContent': '这是新公告',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    Map<String, dynamic> p = Map.from(newParamsStr);

    var result = await Req().get(url: 'room/updateNotice', params: p);

    return result.toString();
  }

  // 删除群公告
  static Future<String> roomDeleteNotice() async {
    Map params = {
      "access_token": access_token,
      'roomId': DateTime.now().microsecondsSinceEpoch.toString(),
      'noticeId': defUserId,
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    Map<String, dynamic> p = Map.from(newParamsStr);

    var result = await Req().get(url: 'room/notice/delete', params: p);

    return result.toString();
  }

  // 面对面建群查询
  static Future<String> roomLocationQuery() async {
    Map params = {
      "access_token": access_token,
      'longitude': '0.0',
      'latitude': '0.0',
      'password': '111111',
      'isQuery': '1',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    Map<String, dynamic> p = Map.from(newParamsStr);

    var result = await Req().get(url: 'room/location/query', params: p);

    return result.toString();
  }

  // 面对面建群加入
  static Future<String> roomLocationJoin() async {
    Map params = {
      "access_token": access_token,
      'jid': '111111',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    Map<String, dynamic> p = Map.from(newParamsStr);

    var result = await Req().get(url: 'room/location/join', params: p);

    return result.toString();
  }
  // 面对面建群退出
  static Future<String> roomLocationExit() async {
    Map params = {
      "access_token": access_token,
      'jid': '111111',
    };

    Map newParamsStr = await ShikuFlutter.generateBeforeLoginParamSpecial(
        params, defUserId, access_token, httpKey);

    Map<String, dynamic> p = Map.from(newParamsStr);

    var result = await Req().get(url: 'room/location/exit', params: p);

    return result.toString();
  }
}
