import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:jh_im_sdk/page/chat_details/group/user_infrom.dart';
import 'package:jh_im_sdk/util/tools.dart';

import 'member_group_dialog.dart';

class MemberGroupGog extends StatefulWidget {
  @override
  _MemberGroupGogState createState() => _MemberGroupGogState();
}

class _MemberGroupGogState extends State<MemberGroupGog> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
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
              showPickerModal(context);
            },
            child: Container(
              margin: EdgeInsets.only(right: 16),
                alignment: Alignment.center,
                child:Text('禁言',style: TextStyle(fontSize: 16,color:Colors.blue),)),
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
                hintStyle: TextStyle(color:Colors.grey)
              ),
          ),
            ),
            Container(
              height:MediaQuery.of(context).size.height-132,
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
          ],
        ),
      ),
    );
  }
  showPickerModal(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter<String>(pickerdata: JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        hideHeader: false,
        cancelText: '取消',
        confirmText: '确定',
        cancelTextStyle: TextStyle(color:Colors.black,fontSize: 16),
        confirmTextStyle: TextStyle(color:Colors.blue,fontSize: 16),
        textStyle: const TextStyle(color: Colors.grey),
        selectedTextStyle: TextStyle(color: Colors.black),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.adapter.text);
        }
    ).showModal(this.context); //_scaffoldKey.currentState);
  }
}


const PickerData = '''
[
   "永久",
   "不禁言",
   "30分钟",
   "1小时",
    "1天"
           
]
    ''';


class ListTile01 extends StatefulWidget {
  ListTile01({Key key}) : super(key: key);

  @override
  _ListTile01State createState() => _ListTile01State();
}

class _ListTile01State extends State<ListTile01> {
  bool isClick = false;
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
                      setState(() {
                        if (isClick == false) {
                          isClick = true;
                        } else {
                          isClick = false;
                        }
                      });
                    },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: EdgeInsets.only(bottom: 12),
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
               Container(
                 margin: EdgeInsets.only(left:30),
                 child: Icon(
                   Icons.remove_circle,size: 18,
                 color: isClick == false ? Colors.white :Colors.red,
                 )),
               Expanded(child: Container(),),
                ],
              ),
            ),
          ),
          Container(

              height: 1,color:Colors.grey[300])
        ],
      ),
    );
  }
}
