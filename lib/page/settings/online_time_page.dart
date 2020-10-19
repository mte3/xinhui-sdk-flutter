import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jh_im_sdk/util/tools.dart';

class OnlineTime {
  String title;
  String subTitle;

  OnlineTime(this.title, this.subTitle);
}

class OnlineTimePage extends StatefulWidget {
  @override
  _OnlineTimePageState createState() => _OnlineTimePageState();
}

class _OnlineTimePageState extends State<OnlineTimePage> {
  String groupValue = '好友';

  List<OnlineTime> data = [
    new OnlineTime('公开', '所有人可见'),
    new OnlineTime('好友', '所有好友可见'),
    new OnlineTime('私密', '仅自己'),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new NavigationBar(title: '谁可看我的上线时间'),
      body: new ListView(
        children: data.map((OnlineTime item) {
          return new LabelTile(
            title: item.title,
            subTitle: item.subTitle,
            onPressed: () {
              setState(() => groupValue = item.title);
            },
            rightW: new Radio(
              value: item.title,
              groupValue: groupValue,
              onChanged: (v) {
                setState(() => groupValue = item.title);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
