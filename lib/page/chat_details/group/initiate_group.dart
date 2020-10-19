import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/chat_details.dart';
import 'package:jh_im_sdk/page/chat_details/group/group_widget.dart';
import 'package:jh_im_sdk/util/tools.dart';

class InitiateGroup extends StatefulWidget {
  InitiateGroup({Key key}) : super(key: key);

  @override
  _InitiateGroupState createState() => _InitiateGroupState();
}

class _InitiateGroupState extends State<InitiateGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "群组成员",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/images/-1.png', width: 20, height: 20,package: packageName),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Container(
                  child: ListView(
                      physics: BouncingScrollPhysics(),//去除水波
                      shrinkWrap: true, children: <Widget>[
                    ListTile01(),
                    ListTile01(),
                    ListTile01(),
                    ListTile01(),
                    ListTile01(),
                    ListTile01(),
                    ListTile01(),
                    ListTile01(),
                    ListTile01(),
                    ListTile01(),
                    ListTile01(),
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('解散群组');
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => GroupWidget()),
                   );
                },
                child: Container(
                  height: 44,
                  width: 200,
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 10,top: 10),
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
        ),
      ),
    );
  }
}

class ListTile01 extends StatefulWidget {
  ListTile01({Key key}) : super(key: key);

  @override
  _ListTile01State createState() => _ListTile01State();
}

class _ListTile01State extends State<ListTile01> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('张三'),
      subtitle: Text('今天在干嘛呢'),
      leading: Image.asset(
        'assets/images/u42683526271650643149fm11gp0-3.png',
        width: 45,
        height: 45,
        package: packageName,
      ),
      trailing: GestureDetector(
        child: isClick == false
            ? Icon(
                Icons.panorama_fish_eye,
                size: 20,
                color: Colors.grey[300],
              )
            : Icon(
                Icons.check_circle,
                size: 20,
                color: Colors.blue[300],
              ),
      ),
      onTap: () {
        setState(() {
          if (isClick == false) {
            isClick = true;
          } else {
            isClick = false;
          }
        });
      },
    );
  }
}
