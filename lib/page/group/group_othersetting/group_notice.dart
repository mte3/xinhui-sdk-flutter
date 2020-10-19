import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class GroupNotice extends StatefulWidget {
  @override
  _GroupNoticeState createState() => _GroupNoticeState();
}
const String NETWORK_IMAGE =
    'https://p5.ssl.qhimgs1.com/bdr/326__/t01faa0569f68a773ff.jpg';

class _GroupNoticeState extends State<GroupNotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '群内公告',
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
        rightDMActions: <Widget>[
          InkWell(
              onTap: () => routePush(Notice()),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  '发布',
                  style: TextStyle(color: Colors.black),),
              )
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new CircleAvatar(
                          backgroundImage: new NetworkImage(NETWORK_IMAGE),
                        ),
                        SizedBox(width: 16,),
                        new Text('我是群昵称'),
                      ],
                    ),
                    Text('03-26 15:36')
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text('    我是群公告我是群公告我是群公告我是群公告我是群公告我是群公'
                    '告我是群公告我是群公告我是群公告我是群公告我是群公告我是群'
                    '公告我是群公告我是群公告我是群公告我是群公告我是群公告'
                    '我是群公告')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//发布页面
class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '群内公告',
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
        rightDMActions: <Widget>[
          InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  '发布',
                  style: TextStyle(
                    color: Colors.grey,),),
              )
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            width: double.infinity,
            color: Colors.white,
            height: 450,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLength: 600,
              minLines: 1,
              decoration: new InputDecoration(
                  hintText: '请输入群内公告',
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
