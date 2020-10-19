/*
* 好友-群组-群组聊天界面-其他-群管理
* 创建日期:2020-4-21
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/group/list_item2.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class ManagementSetting extends StatefulWidget {
  @override
  _ManagementSettingState createState() => _ManagementSettingState();
}

class _ManagementSettingState extends State<ManagementSetting> {
  bool _val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        backgroundColor: Color(0xfffafafa),
        title: '群管理',
        leading: new InkWell(
          child: Container(
            width: 22,
            height: 22,
            child: Image.asset(
              "assets/images/-1.png",
              fit: BoxFit.none,package: packageName,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),//去除水波
        children: <Widget>[
          ListItem2(
            textColor: Color(0xFF666666),
            title: '群主转让',

            whatWidget: false,
          ),
          LineWidget(),
          ListItem2(
            textColor: Color(0xFF666666),
            title: '指定管理员',
            whatWidget: false,
          ),
          ListItem2(
            textColor: Color(0xFF666666),
            title: '指定隐身人',
            whatWidget: false,
          ),
          LineWidget(),
          ListItem2(
            textColor: Color(0xFF666666),
            whatWidget: false,
            title: '一键复制新群',
          ),
          LineWidget(),
          ListItem2(
            textColor: Color(0xFF666666),
            whatWidget: false,
            title: '对群成员备注',
          ),
          LineWidget(),
          Column(
            children: textList.map(_itemBuild).toList(),
          ),
          GestureDetector(
            onTap: () {
              print('解散群组');
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => MultiselectPromptWidget()),
              // );
                  ;
            },
            child: Container(
              height: 44,
              margin: EdgeInsets.only(top:16,left: 16, right: 16, bottom: 30),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 136, 255),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "解散群组",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PingFang SC",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemBuild(item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListItem2(
          textColor: Colors.black,
          title: item['title'],
          val: item['val'],
          whatWidget: true,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding:
          EdgeInsets.only(left: 16.0, right: 16.0,bottom: 12),
          child: Text(
            item['introduction'],
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        LineWidget(),
      ],
    );
  }
}

List textList = [
  {'title': '私密群组', 'val': false, 'introduction': '启用后，无法搜索到当前群'},
  {
    'val': false,
    'title': '显示已读人数',
    'introduction': '启用后，当前群组的信息页面，每条信息左侧都会显示该条信息的已读人数，点击后还可查看已读人员列表'
  },
  {'val': false, 'title': '群组邀请确认', 'introduction': '启用后，群成员需群主确认后才能邀请朋友进群'},
  {
    'val': false,
    'title': '群组减员通知',
    'introduction': '启用后，当群内成员被踢出群组或主动退群时，群组内将进行通知'
  },
  {
    'val': false,
    'title': '允许显示群成员',
    'introduction': '关闭后，普通成员在群组信息内将看不到其他群成员，只显示群组与自己'
  },
  {
    'val': false,
    'title': '允许普通成员私聊',
    'introduction': '关闭后，不予许发送名片信息，且普通成员在群聊界面、群组信息内点击头像无反应'
  },
  {'val': false, 'title': '允许普通成员邀请好友', 'introduction': '关闭时，普通成员将不能使用邀请功能'},

];
