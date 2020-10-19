import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/group/announcement_sand.dart';
import 'package:jh_im_sdk/page/chat_details/group/user_infrom.dart';
import 'package:jh_im_sdk/util/tools.dart';

class AnnouncementInform extends StatefulWidget {
  AnnouncementInform({Key key}) : super(key: key);

  @override
  _AnnouncementInformState createState() => _AnnouncementInformState();
}

class _AnnouncementInformState extends State<AnnouncementInform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('群公告', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/images/-1.png', width: 20, height: 20,package: packageName),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnnouncementSend()),
                );
              },child: Image.asset('assets/images/5847.png', width: 20, height: 20),)
          ],
        ),
        body: ListView(
            physics: BouncingScrollPhysics(),//去除水波
            shrinkWrap:true,
            children:<Widget>[
              Container01(),
              Container01(),
            ]
        )
    );
  }
}

class Container01 extends StatelessWidget {
  const Container01({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16,right: 16,top: 16),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserInfrom()),
              );
            },
            child: Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/5725.png',
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
                Text('这是一个用户名称1',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                Expanded(child: Container(),),
                Text('23小时前',style: TextStyle(color:Colors.grey),)
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top:10,bottom: 8),
              child: Text('填写公告不超过600字填写公告不超过600字填写公告不超过600字填写公告不超过600字填写公填写公告不超过600字告不超过600字')),
          Container(
              margin: EdgeInsets.only(top: 12),
              height: 1,color:Colors.grey[300])
        ],
      ),
    );
  }
}
