import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/msg_more/face_group_page.dart';
import 'package:jh_im_sdk/page/msg_more/lmitiate_group_chat.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:jh_im_sdk/page/msg_more/message_addfriend.dart';
import 'package:jh_im_sdk/page/msg_more/near_page.dart';
import 'package:jh_im_sdk/page/msg_more/pay_code_page.dart';
import 'package:jh_im_sdk/page/msg_more/scan_page.dart';
import 'package:jh_im_sdk/page/msg_more/search_official_account.dart';
import 'package:jh_im_sdk/util/tools.dart';

action(name) {
  switch (name) {
    case '扫一扫':
      //routePush(new ScanPage());
      _scan();
      break;
    case '收付款':
      routePush(new PayCodePage());
      break;
    case '附近的人':
      routePush(new NearPage());
      break;
    case '面对面建群':
      routePush(new FaceGroupPage());
      break;
    case '搜索公众号':
      routePush(new SearchOfficialAccount());
      break;
    case '添加朋友':
      routePush(new MessageAddFriend());
      break;
      case '发起群聊':
      routePush(new InitiateGroupChat());
      break;
  }
}

//扫一扫
Future _scan() async {
  String barcode = await scanner.scan();
  //this._outputController.text = barcode;
}

msgMoreDialog(context) {
  Widget itemBuild(item) {
    String label = item['label'];
    return new InkWell(
      child: new Container(
        padding: EdgeInsets.all(10),
        width: 130,
        child: new Row(
          children: <Widget>[
            new Icon(Icons.map),
            new SizedBox(width: 10),
            new Text(label),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        action(label);
      },
    );
  }

  showDialog(
    context: context,
    builder: (context) {
      List data = [
        {'label': '发起群聊', 'icon': ''},
        {'label': '面对面建群', 'icon': ''},
        {'label': '添加朋友', 'icon': ''},
        {'label': '搜索公众号', 'icon': ''},
        {'label': '扫一扫', 'icon': ''},
        {'label': '收付款', 'icon': ''},
        {'label': '附近的人', 'icon': ''},
      ];
      return new GestureDetector(
        child: new Material(
          type: MaterialType.transparency,
          child: new Stack(
            children: <Widget>[
              new Positioned(
                top: topBarHeight(context) - statusBarHeight(context),
                right: 20,
                child: new Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: new Column(children: data.map(itemBuild).toList()),
                ),
              ),
            ],
          ),
        ),
        onTap: () => Navigator.of(context).pop(),
      );
    },
  );
}
