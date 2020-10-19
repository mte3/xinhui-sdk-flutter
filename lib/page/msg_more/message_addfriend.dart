import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';
import 'package:jh_im_sdk/widget_common/button/small_button.dart';

import 'addfriends_friends.dart';
import 'search_official_account.dart';
class MessageAddFriend extends StatefulWidget {
  @override
  _MessageAddFriendState createState() => _MessageAddFriendState();
}

class _MessageAddFriendState extends State<MessageAddFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(title: "添加好友", leadingType: 1),
      body: Column(
        children: <Widget>[
          SizedBox(height: 12),
          AddTextFieldAssembly(labelText:  "昵称或手机号",hitTitle: "请输入昵称或手机号"),
          SizedBox(height: 28),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 39),
            child: SmallButton(
              text: "搜索",
              onPressed: ()=>routePush(AddFriendsAndFriends()) ,
              color: Color.fromRGBO(45, 136, 255, 1),
              pressedOpacity: 1,
            ),
          ),
        ],
      ),
    );
  }
}
