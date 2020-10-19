import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jh_im_sdk/page/group/group_othersetting/group_name_modification.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

//import 'package:jh_im_sdk/page/group/group_othersetting/group_ delete_chat_records.dart';
import 'group_management.dart';

//import 'group_othersetting/group_ delete_chat_records.dart';
//import 'group_othersetting/group_ qr_code.dart';
import 'group_othersetting/group_chat_record.dart';
import 'group_othersetting/group_describe.dart';
import 'group_othersetting/group_members.dart';
import 'group_othersetting/group_nickname.dart';
import 'group_othersetting/group_notice.dart';
import 'group_othersetting/group_shared_files.dart';

class GroupChatOther extends StatefulWidget {
  @override
  _GroupChatOtherState createState() => _GroupChatOtherState();
}

const String NETWORK_IMAGE =
    'https://p5.ssl.qhimgs1.com/bdr/326__/t01faa0569f68a773ff.jpg';

class _GroupChatOtherState extends State<GroupChatOther> {
  bool val = true;
  bool disturb = false;
  bool placement = false;
  bool shield = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '我的群昵称（34）',
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
          Container(
            padding: EdgeInsets.fromLTRB(16, 4, 12, 4),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  height: 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('群组成员'),
                      Row(
                        children: <Widget>[
                          Text('共34人'),
                          Icon(Icons.chevron_right)
                        ],
                      )
                    ],
                  ),
                ),
                new Wrap(
                  spacing: 5,
                  runSpacing: 8,
                  children: Boxs() + Noxs(),
                ),
                SizedBox(
                  height: 6,
                ),
                GestureDetector(
                  onTap: () => routePush(GroupMembers()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('查看更多成员'),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 4, 12, 4),
            color: Colors.white,
            margin: EdgeInsets.only(top: 8),
            child: Column(
              children: <Widget>[
                GroupSetting(
                  title: '群组名称',
                  choice: Text('我是群昵称'),
                  onTap: () => routePush(NameModification()),
                ),
                GroupSetting(
                  title: '群组描述',
                  choice: Text('我是群组描述，描述我自己'),
                  onTap: () => routePush(GroupDescribe()),
                ),
                GroupSetting(
                  title: '群二维码',
                  choice: Container(
                    width: 20,
                    height: 20,
                    color: Colors.black,
                  ),
//                  onTap: () => routePush(GroupQRCode()),
                ),
                GroupSetting(
                  title: '群组公告',
                  choice: Text('我是群组公告，我是群组公告'),
                  onTap: () => routePush(GroupNotice()),
                ),
                GroupSetting(
                  title: '群内名称',
                  choice: Text('我是群内名称，群内的名字'),
                  onTap: () => routePush(GroupNickname()),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 4, 12, 4),
            color: Colors.white,
            margin: EdgeInsets.only(top: 8),
            child: Column(
              children: <Widget>[
                GroupSetting(
                  title: '设置群头像',
                  choice: Container(
                    width: 40,
                    height: 40,
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage(NETWORK_IMAGE),
                    ),
                  ),
                  onTap: () {},
                ),
                GroupSetting(
                  title: '群共享文件',
                  choice: Text(' '),
                  onTap: () => routePush(GroupSharedFiles()),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 8),
            child: Column(
              children: <Widget>[
                SwitchListTile(
                    title: Text(
                      '置顶聊天',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: placement,
                    onChanged: (value) {
                      setState(() {
                        placement = value;
                      });
                    }),
                SwitchListTile(
                    title: Text(
                      '消息免打扰',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: disturb,
                    onChanged: (value) {
                      setState(() {
                        disturb = value;
                      });
                    }),
                SwitchListTile(
                    title: Text(
                      '屏蔽群消息',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: shield,
                    onChanged: (value) {
                      setState(() {
                        shield = value;
                      });
                    }),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 4, 12, 4),
            color: Colors.white,
            margin: EdgeInsets.only(top: 8),
            child: Column(
              children: <Widget>[
                GroupSetting(
                  title: '查看聊天记录',
                  choice: Text(' '),
                  onTap: () => routePush(GroupChatRecord()),
                ),
                GroupSetting(
                  title: '消息过期自动删除',
                  choice: Text('永久'),
//                  onTap: () => routePush(GroupDeleteChat()),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 8),
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(16, 4, 12, 4),
                    child: GroupSetting(
                      title: '禁言',
                      choice: Text(' '),
                      onTap: () {},
                    )),
                SwitchListTile(
                    title: Text(
                      '全体禁言',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: val,
                    onChanged: (value) {
                      setState(() {
                        val = value;
                      });
                    }),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 4, 12, 4),
            color: Colors.white,
            margin: EdgeInsets.only(top: 8, bottom: 8),
            child: GroupSetting(
              title: '群管理',
              choice: Text(' '),
              onTap: () => routePush(GroupManagement()),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 4, 12, 4),
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 16),
            child: GroupSetting(
              title: '举报',
              choice: Text(' '),
              onTap: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    '清空聊天记录',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                GestureDetector(
                  child: Text(
                    '解散群组',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> Boxs() => List.generate(
      18,
      (index) {
        return Column(
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              child: new CircleAvatar(
                backgroundImage: new NetworkImage(NETWORK_IMAGE),
              ),
            ),
            Text('群成员${index}')
          ],
        );
      },
    );

List<Widget> Noxs() => List.generate(2, (index) {
      return Column(
        children: <Widget>[
          Container(
              width: 70,
              height: 90,
              child: Center(
                  child: InkWell(
                      child: new Icon(
                Icons.add,
                size: 50,
              )))),
        ],
      );
    });

class GroupSetting extends StatelessWidget {
  final String title;
  final Widget choice;
  final Function onTap;

  const GroupSetting({Key key, @required this.title, this.choice, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title),
            Row(
              children: <Widget>[choice, Icon(Icons.chevron_right)],
            )
          ],
        ),
      ),
    );
  }
}

class ListPhotoModel {
  final String networkph;
  final String name;

  ListPhotoModel({this.networkph, this.name});
}

List<ListPhotoModel> manber = [
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
  ListPhotoModel(networkph: NETWORK_IMAGE, name: '群昵称${manber.length}'),
];
List iconadd = ['0'];
