import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/settings/add_mode_page.dart';
import 'package:jh_im_sdk/page/settings/online_time_page.dart';
import 'package:jh_im_sdk/util/tools.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(title: '隐私'),
      body: new ListView(
        children: <Widget>[
          new SettingsItem(
            label: '消息漫游时长',
            isBorder: false,
            subLabel: '不同步',
            onPressed: () {},
            rightW: new Container(),
          ),
          new Space(),
          new LabelTile(
            title: '谁可以看到我的上线时间',
            subTitle: '所有人不允许',
            onPressed: () => routePush(new OnlineTimePage()),
          ),
          new LabelTile(
            title: '谁可以看到我的上线时间',
            subTitle: '所有人不允许',
            isBorder: false,
            onPressed: () {},
          ),
          new Space(),
          new SettingsItem(
            label: '需要好友验证',
            padding: EdgeInsets.symmetric(vertical: 5),
            rightW: new CupertinoSwitch(value: true, onChanged: null),
          ),
          new SettingsItem(
            label: '允许通过手机号搜索我',
            padding: EdgeInsets.symmetric(vertical: 5),
            rightW: new CupertinoSwitch(value: true, onChanged: null),
          ),
          new SettingsItem(
            label: '允许通过昵称搜索我',
            padding: EdgeInsets.symmetric(vertical: 5),
            rightW: new CupertinoSwitch(value: true, onChanged: null),
          ),
          new LabelTile(
            title: '允许加我的方式',
            subTitle: '二维码、名片、群组、手机号搜索、昵称搜索',
            isBorder: false,
            onPressed: () => routePush(new AddModePage()),
          ),
          new Space(),
          new SettingsItem(
            label: '消息加密传输',
            padding: EdgeInsets.symmetric(vertical: 5),
            rightW: new CupertinoSwitch(value: true, onChanged: null),
          ),
          new SettingsItem(
            label: '消息来时震动',
            padding: EdgeInsets.symmetric(vertical: 5),
            rightW: new CupertinoSwitch(value: true, onChanged: null),
          ),
          new SettingsItem(
            label: '显示输入状态',
            padding: EdgeInsets.symmetric(vertical: 5),
            isBorder: false,
            rightW: new CupertinoSwitch(value: true, onChanged: null),
          ),
          new Space(),
          new SettingsItem(
            label: '支持多设备登录',
            padding: EdgeInsets.symmetric(vertical: 5),
            isBorder: false,
            rightW: new CupertinoSwitch(value: true, onChanged: null),
          ),
          new Space(height: mainSpace * 5),
        ],
      ),
    );
  }
}
