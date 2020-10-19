import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jh_im_sdk/util/tools.dart';

class AddModePage extends StatefulWidget {
  @override
  _AddModePageState createState() => _AddModePageState();
}

class _AddModePageState extends State<AddModePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new NavigationBar(title: '添加方式'),
      body: new ListView(
        children: <Widget>[
          new Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: mainSpace, horizontal: 15),
            child: new Text(
              '可通过以下方式添加我',
              style: TextStyle(
                color: Color(0xff333333),
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          new SettingsItem(
            label: '二维码',
            padding: EdgeInsets.symmetric(vertical: 5),
            rightW: new CupertinoSwitch(value: true, onChanged: (v) {}),
          ),
          new SettingsItem(
            label: '名片',
            padding: EdgeInsets.symmetric(vertical: 5),
            rightW: new CupertinoSwitch(value: true, onChanged: (v) {}),
          ),
          new SettingsItem(
            label: '群组',
            padding: EdgeInsets.symmetric(vertical: 5),
            rightW: new CupertinoSwitch(value: true, onChanged: (v) {}),
          ),
          new SettingsItem(
            label: '手机号搜索',
            padding: EdgeInsets.symmetric(vertical: 5),
            rightW: new CupertinoSwitch(value: false, onChanged: (v) {}),
          ),
          new SettingsItem(
            label: '昵称搜索',
            padding: EdgeInsets.symmetric(vertical: 5),
            rightW: new CupertinoSwitch(value: true, onChanged: (v) {}),
            isBorder: false,
          ),
        ],
      ),
    );
  }
}
