import 'package:flutter/material.dart';
import 'package:jh_im_sdk/model/tabbar_model.dart';
import 'package:jh_im_sdk/page/contact/contacts_page.dart';
import 'package:jh_im_sdk/page/find/find_page.dart';
import 'package:jh_im_sdk/page/message/message_page.dart';
import 'package:jh_im_sdk/page/mine/mine_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/root_tabbar.dart';
import 'package:nav_router/nav_router.dart';
import 'package:shiku_flutter/shiku_flutter.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String tab = 'assets/images/tab/';

  List<TabBarModel> pages() {
    return [
      new TabBarModel(
        title: '讯息',
        icon: new Image.asset(tab + 'tab_msg_c.png', width: 25.96,package: packageName),
        selectIcon: new Image.asset(
          tab + 'tab_msg_c.png',
          width: 25.96,
          color: Color(0xff2D88FF),package: packageName,
        ),
        page: new MessagePage(),
      ),
      new TabBarModel(
        title: '好友',
        icon: new Image.asset(tab + 'tab_contact_c.png', width: 25.96,package: packageName),
        selectIcon: new Image.asset(tab + 'tab_contact_s.png', width: 25.96,package: packageName),
        page: new ContactsPage(),
      ),
      new TabBarModel(
        title: '主见',
        icon: new Image.asset(tab + 'tab_find_c.png', width: 25.96,package: packageName),
        selectIcon: new Image.asset(
          tab + 'tab_find_c.png',
          width: 25.96,
          color: Color(0xff2D88FF),package: packageName,
        ),
        page: new FindPage(),
      ),
      new TabBarModel(
        title: '我的',
        icon: new Image.asset(tab + 'tab_mine_c.png', width: 25.96,package: packageName),
        selectIcon: new Image.asset(
          tab + 'tab_mine_c.png',
          width: 25.96,
          color: Color(0xff2D88FF),package: packageName,
        ),
        page: new MinePage(),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    ShikuFlutter.config('http://120.25.249.32:8092');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new RootTabBar(pages: pages(), currentIndex: 0),
    );
  }
}
