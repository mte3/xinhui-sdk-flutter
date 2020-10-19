/*
* 好友-群组-群组聊天界面-其他-群管理
* 创建日期:2020-4-21
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/group/group_copy_new.dart';
import 'package:jh_im_sdk/page/group/group_invisible.dart';
import 'package:jh_im_sdk/page/group/group_managementpower.dart';
import 'package:jh_im_sdk/page/group/group_setnote.dart';
import 'package:jh_im_sdk/page/group/group_specify_management.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/list_item_chatsetup.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class GroupManagement extends StatefulWidget {
  @override
  _GroupManagementState createState() => _GroupManagementState();
}

class _GroupManagementState extends State<GroupManagement> {
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
              fit: BoxFit.none,
              package: packageName,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            textColor: Color(0xFF666666),
            title: '群主管理权转让',
            whatWidget: false,
            onTap: () => routePush(new ChangeManagementPower()),
          ),
          LineWidget(),
          ListItem(
            textColor: Color(0xFF666666),
            title: '指定管理人',
            whatWidget: false,
            onTap: () => routePush(new GroupSpecifyAministrator()),
          ),
          ListItem(
            textColor: Color(0xFF666666),
            title: '指定隐身人',
            whatWidget: false,
            onTap: () => routePush(new GroupInvisible()),
          ),
          LineWidget(),
          ListItem(
            textColor: Color(0xFF666666),
            whatWidget: false,
            title: '一键复制新群',
            onTap: () => routePush(new CopyNewGroup()),
          ),
          LineWidget(),
          ListItem(
            textColor: Color(0xFF666666),
            whatWidget: false,
            title: '对群成员备注',
            onTap: () => routePush(new GroupSetNote()),
          ),
          LineWidget(),
          Column(
            children: textList.map(_itemBuild).toList(),
          )
        ],
      ),
    );
  }

  Widget _itemBuild(item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListItem(
          textColor: Color(0xFF666666),
          title: item['title'],
          val: item['val'],
          whatWidget: true,
        ),
        Container(
          padding:
              EdgeInsets.only(left: 16.0, top: 12.0, right: 16.0, bottom: 12),
          child: Text(
            item['introduction'],
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff999999),
            ),
          ),
        )
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
  {
    'val': false,
    'title': '允许普通成员上传',
    'introduction': '关闭时，普通成员将不能上传群共享文件和发送文件信息。'
  },
  {
    'val': false,
    'title': '允许普通成员发起会议',
    'introduction': '关闭时，普通成员将不能主动发起语言会议或视频会议'
  },
  {'val': false, 'title': '允许普通成员发起课间', 'introduction': '关闭时，普通成员将不能在群内发送他的课间'},
];
