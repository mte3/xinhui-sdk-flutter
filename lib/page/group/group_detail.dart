import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/group/group_chat_interface.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';
import 'package:nav_router/nav_router.dart';

import 'group_search.dart';



class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

const String NETWORK_IMAGE =
    'https://p5.ssl.qhimgs1.com/bdr/326__/t01faa0569f68a773ff.jpg';

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '群组',
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
        rightDMActions: <Widget>[
          new InkWell(
            onTap: () => routePush(new Search()),
            child: new SizedBox(
              width: 40,
              child: new UnconstrainedBox(
                child: new Image.asset(
                  'assets/images/msg/ic_search.png',
                  width: 17,
                  fit: BoxFit.cover,package: packageName,
                ),
              ),
            ),
          ),
          new InkWell(
            child: new SizedBox(
              width: 40,
              child: new Icon(
                CupertinoIcons.add_circled,
                color: Color(0xff333333),
              ),
            ),
          ),
        ],
      ),
      body:ListView.builder(itemBuilder: (context,index){
        return GestureDetector(
          onTap: () => routePush(new GroupChat()),
          child: new Container(
            padding: EdgeInsets.fromLTRB(16,4,16,4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(width: 0.1)),
            ),
            child: new Row(
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: new NetworkImage(NETWORK_IMAGE),
                ),
                SizedBox(width: 16,),
                new Text('我是群昵称$index'),
              ],
            ),
          ),
        );
      }) ,
    );
  }
}
