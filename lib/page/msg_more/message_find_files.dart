import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'seek_take_notes.dart';

class MessageFindFiles extends StatefulWidget {
  @override
  _MessageFindFilesState createState() => _MessageFindFilesState();
}

class _MessageFindFilesState extends State<MessageFindFiles> {
  String today = "今天";
  String yesterday = "昨天";
  String pastTimes="2020年2月22日";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        leadingType: 1,
        titleW: SimpleInputBox(hitTitle: "请输入查找内容"),
        rightDMActions: <Widget>[
          Center(
            child: Text(
              "取消",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Space(),
        ],
      ),
      body: ListView(
        children: <Widget>[
          filesTime(today),
          filesCard(1,today),
          filesTime(yesterday),
          filesCard(2,yesterday),
          filesTime(pastTimes),
          filesCard(3, pastTimes),
        ],
      ),
    );
  }

  Widget filesTime(String times) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8),
      child: Text(times, style: TextStyle(color: Colors.black, fontSize: 18)),
    );
  }

  Widget filesCard(int length,String date) {
    return Container(
        color: Colors.white,
        child: Column(
        children:List.generate(length, (_)
    {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2337756152,1867712973&fm=26&gp=0.jpg",
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
              ),
              title: Text('这是一个用户名称', style: TextStyle(fontSize: 16)),
              trailing: Text(date, style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(205, 205, 205, 1)),),
            ),
            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                color: Colors.red,
                alignment: Alignment.center,
                child: Text('PDF', style: TextStyle(color: Colors.white,
                    fontSize: 20),),
              ),
              title: Text('这是一个文件的名称.pdf', style: TextStyle(fontSize: 14)),
              trailing: Text('1.32MB', style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(205, 205, 205, 1)),),
            ),
//          SizedBox(height: 32),
          ],
        ),
      );
    },
        ),
    )
    );
  }
}
