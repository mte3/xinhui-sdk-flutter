import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/group/user_infrom.dart';
import 'package:jh_im_sdk/util/tools.dart';

import 'member_group_dialog.dart';

class MemberGroupDelate extends StatefulWidget {
  @override
  _MemberGroupDelateState createState() => _MemberGroupDelateState();
}

class _MemberGroupDelateState extends State<MemberGroupDelate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "群组成员",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: "PingFang SC",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/images/-1.png',width:20,height:20,package: packageName),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              print('移除');
              showDialog(
                  context: context,
                  builder: (context) {
                    return MemberGroupDialog();
                  });
            },
            child: Container(
                margin: EdgeInsets.only(right: 16),
                alignment: Alignment.center,
                child:Icon(Icons.search,color: Colors.black,)
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16,right: 16),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20)
              ),
              height: 30,
              child: TextField(
//            textAlign: TextAlign.center,
                decoration: InputDecoration(
                    icon: Container(
//                alignment: Alignment.center,
                        margin: EdgeInsets.only(left:MediaQuery.of(context).size.width/3),
                        child: Icon(Icons.search)),
                    border: InputBorder.none,
                    hintText:'搜索成员',
                    hintStyle: TextStyle(color:Colors.black)
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height-132-44,
              child: ListView(
                physics: BouncingScrollPhysics(),//去除水波
                shrinkWrap: true,
                children: <Widget>[
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
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('移除');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => MultiselectPromptWidget()),
                // );
                    ;
                showDialog(
                    context: context,
                    builder: (context) {
                      return MemberGroupDialog();
                    });
              },
              child: Container(
                height: 44,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 16, right: 16,top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 45, 136, 255),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "移除",
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
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.only(left: 16,right: 16,top: 16),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/5725.png',
                          width: 50,
                          height: 50,
                          package: packageName,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8,right: 8),
                          child: Image.asset(
                            'assets/images/5746.png',
                            width: 32,
                            height: 21,
                            package: packageName,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      child: Text('这是一个用户名称1',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                  Expanded(child: Container(),),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      child: isClick == false
                          ? Icon(
                        Icons.panorama_fish_eye,
                        size: 20,
                        color: Colors.black,
                      )
                          : Icon(
                        Icons.check_circle,
                        size: 20,
                        color: Colors.blue,
                      ),

                    ),
                  ),

                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 12),
                height: 1,color:Colors.grey[300]),
          ],
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
