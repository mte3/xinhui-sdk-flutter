import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/group/announcement_inform.dart';
import 'package:jh_im_sdk/util/tools.dart';

class AnnouncementSend extends StatefulWidget {
  AnnouncementSend({Key key}) : super(key: key);

  @override
  _AnnouncementSendState createState() => _AnnouncementSendState();
}

class _AnnouncementSendState extends State<AnnouncementSend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('群组公告',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
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
                  MaterialPageRoute(builder: (context) => AnnouncementInform()),
                );
              },
              child:
                  Image.asset('assets/images/5847.png', width: 20, height: 20,
                      package: packageName)),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            height: MediaQuery.of(context).size.height-85,
            color: Colors.white,
            child: TextField(
              maxLines: 10,
              maxLength: 600,
//              decoration: InputDecoration(
//                border: InputBorder.none,
//                hintText: '鍒嗕韩鑷繁鐨勭敓娲绘晠浜媬(涓嶅皯浜?00瀛?',
//                // // labelText: 'data1',
//                // counterText: 'number' + '/500',
//                // // prefixText: 'data3',
//                fillColor: Colors.grey[900],
//                hintMaxLines: 20,

                decoration: InputDecoration(
                  hintText: '填写公告不超过600字',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  
            ),
          ),
          Expanded(child: Container(color: Colors.white))
        ],
      ),
    );
  }
}
