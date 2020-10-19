import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/group/announcement_sand.dart';
import 'package:jh_im_sdk/util/tools.dart';

class AnnouncementNone extends StatefulWidget {
  AnnouncementNone({Key key}) : super(key: key);

  @override
  _AnnouncementNoneState createState() => _AnnouncementNoneState();
}

class _AnnouncementNoneState extends State<AnnouncementNone> {
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
              },child: Image.asset('assets/images/5847.png', width: 20, height: 20,package: packageName),)
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top:220),
          child: Column(
            children: <Widget>[
              Text('暂无公告', style: TextStyle(fontSize: 14, color: Colors.grey)),
              Container(
                margin: EdgeInsets.only(top:10),
                child: Image.asset('assets/images/notinform.png', width: 100, height: 100,
                    package: packageName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
