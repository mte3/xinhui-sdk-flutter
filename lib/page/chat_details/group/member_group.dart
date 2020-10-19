import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/group/user_infrom.dart';
import 'package:jh_im_sdk/util/tools.dart';

import 'member_group_dialog.dart';

class MemberGroup extends StatefulWidget {
  @override
  _MemberGroupState createState() => _MemberGroupState();
}

class _MemberGroupState extends State<MemberGroup> {
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
          Container(
              margin: EdgeInsets.only(right: 16),
              child: Icon(Icons.search,color: Colors.black,))
        ],
      ),
      body: ListView(
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
    );
  }
}

class ListTile01 extends StatefulWidget {
  ListTile01({Key key}) : super(key: key);

  @override
  _ListTile01State createState() => _ListTile01State();
}

class _ListTile01State extends State<ListTile01> {
  bool Value = false;
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
//                      Image.asset(
//                        'assets/images/5725.png',
//                        width: 50,
//                        height: 50,
//                package: packageName,
//                      ),
                      Image.asset(
                        'assets/images/5725.png',
                        width: 50,
                        height: 50,
                        package: packageName,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        height: 20,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent[100],
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child:
                        Value == false
                        ? Text('群主',style:TextStyle(fontSize: 12,color: Colors.white)) : Text('成员',style:TextStyle(fontSize: 12,color: Colors.white))
                        ,
                      ),
                    ],
                  ),
                ),
             Text('这是一个用户名称1',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
             Expanded(child: Container(),),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 12),
              height: 1,color:Colors.grey[300])
        ],
      ),
    );
  }
}
