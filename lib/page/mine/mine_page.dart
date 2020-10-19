import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/settings/settings_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/dialog/mine_add_dialog.dart';
import 'package:jh_im_sdk/widget/dialog/mine_vido_dialog.dart';

import 'courseware/my_courseware.page.dart';
import 'my_Collection/my_collection_page.dart';
import 'my_wallet/wallet_page.dart';
import 'payment_center/Payment_center_page.dart';

class MineItem {
  final String label;
  final String icon;

  MineItem(this.label, this.icon);
}

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  TextStyle labelStyle = TextStyle(color: Colors.white, fontSize: 12);
  List<MineItem> data = [
    new MineItem('我的钱包', 'assets/images/mine/item_dynamic.png'),
    new MineItem('我的动态', 'assets/images/mine/item_dynamic.png'),
    new MineItem('我的收藏', 'assets/images/mine/item_favorit.png'),
    new MineItem('我的课件', 'assets/images/mine/item_file.png'),
    new MineItem('视频会议', 'assets/images/mine/item_convasation.png'),
    new MineItem('设置', 'assets/images/mine/item_settings.png'),
  ];

  Widget itemBuild(MineItem item) {
    return new FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 20),
      onPressed: () => action(item.label),
      child: new Row(
        children: <Widget>[
          new Image.asset(item.icon, width: 25.67,package: packageName),
          new Space(),
          new Expanded(
            child: new Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.1)),
              ),
              child: new Text(item.label),
            ),
          )
        ],
      ),
    );
  }

  action(name) {
    switch (name) {
      case '设置':
        routePush(new SettingsPage());
        break;
    }
    switch (name) {
      case '我的收藏':
        routePush(new Collection());
        break;
    }
    switch (name) {
      case '视频会议':
        //  routePush(new Vido());
        showDialog(
            context: context,
            builder: (context) {
              return Vido();
            });
        break;
    }
    switch (name) {
      case '我的钱包':
        routePush(new Wallet());
        break;
    }
    switch (name) {
      case '我的动态':
        routePush(new Payment());
        break;
    }
    switch (name) {
      case '我的课件':
        routePush(new Courseware());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new NavigationBar(
        backgroundColor: THEME_COLOR,
        mainColor: Colors.white,
        showBackIcon: false,
        rightDMActions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print('分享');
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddDialog();
                    });
              })
        ],
      ),
      body: ListView(
              children: <Widget>[
          new Container(
            color: THEME_COLOR,
            padding:
                EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 50.0),
            child: new Row(children: <Widget>[
              new CircleAvatar(
                backgroundImage: NetworkImage(NETWORK_IMAGE),
                radius: 70 / 2,
              ),
              new Space(),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      '蓝蓝的海',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    new Space(height: mainSpace / 2),
                    new Text('13539777391', style: labelStyle),
                    new Text('广东 广州', style: labelStyle),
                  ],
                ),
              ),
              new Image.asset('assets/images/mine/ic_qr_code.png', width: 22.57,package: packageName),
              new Space(),
              new Icon(Icons.chevron_right, color: Colors.white),
            ]),
          ),
          Container(
              height: 450,
              child: new ListView(children: data.map(itemBuild).toList())
              ),
        ]),
      );
  }
}
