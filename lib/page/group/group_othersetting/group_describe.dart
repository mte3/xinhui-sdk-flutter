import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class GroupDescribe extends StatefulWidget {
  @override
  _GroupDescribeState createState() => _GroupDescribeState();
}

class _GroupDescribeState extends State<GroupDescribe> {
  //Controller监听文本变化方法（1/3）
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    textEditingController.addListener((){
      print("controller的监听方法："+"${textEditingController.text.length}");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '群组描述',
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
                '修改',
                style: TextStyle(
                  color: textEditingController.text.length ==0 ?
                Colors.grey:Colors.black),),
            )
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            width: double.infinity,
            color: Colors.white,
            height: 100,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLength: 100,
              minLines: 1,
              decoration: new InputDecoration(
                  hintText: '请输入群组描述',
                  border: InputBorder.none),
              controller: textEditingController,
            ),
          ),
        ],
      ),
    );
  }
}
