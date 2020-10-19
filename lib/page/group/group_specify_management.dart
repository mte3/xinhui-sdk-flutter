/*
* 好友-群组-群组聊天界面-其他-群管理-指定管理员转让
* 创建日期:2020-4-22
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/group_member.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class GroupSpecifyAministrator extends StatefulWidget {
  @override
  _GroupSpecifyAministratorState createState() =>
      _GroupSpecifyAministratorState();
}

class _GroupSpecifyAministratorState extends State<GroupSpecifyAministrator> {
  List testList = [
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
      'value': false
    },
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
      'value': false
    },
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
      'value': false
    },
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
      'value': false
    },
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
      'value': false
    },
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
      'value': false
    },
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
      'value': false
    },
  ];
  bool btnColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavigationBar(
        title: '指定管理员',
        backgroundColor: Color(0xfffafafa),
        leading: new InkWell(
          child: Container(
            width: 22,
            height: 22,
            child: Image.asset(
              "assets/images/-1.png",
              fit: BoxFit.none,package: packageName,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        rightDMActions: <Widget>[
          InkWell(
            child: Container(
              width: 21,
              height: 21,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 15),
              child: Image.asset(
                "assets/images/-1-7.png",
                fit: BoxFit.none,package: packageName,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: List.generate(testList.length, (index) {
                return MemberItem(
                  userName: testList[index]['userName'],
                  url: testList[index]['image'],
                  val: testList[index]['value'],
                  onTap: () {
                    testList[index]['value'] = !testList[index]['value'];
                    setState(() {
                      for (var i = 0; i < testList.length; i++) {
                        if (testList[i]['value'] == true) {
                          btnColor = true;
                          break;
                        } else {
                          btnColor = false;
                        }
                        continue;
                      }
                    });
                  },
                );
              }),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 33),
        width: MediaQuery.of(context).size.width,
        height: 43,
        child: FlatButton(
          onPressed: () {},
          child: Text(
            '确定',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          color: btnColor ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
