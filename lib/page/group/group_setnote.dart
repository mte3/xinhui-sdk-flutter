/*
* 好友-群组-群组聊天界面-其他-群管理-设置备注
* */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/group_member.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class GroupSetNote extends StatefulWidget {
  @override
  _GroupSetNoteState createState() => _GroupSetNoteState();
}

class _GroupSetNoteState extends State<GroupSetNote> {
  List testList = [
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
    },
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
    },
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
    },
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
    },
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
    },
    {
      'image': 'assets/images/nopath----8.png',
      'userName': '我是昵称',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavigationBar(
        title: '设置备注',
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
          IconButton(
            color: Colors.black,
            icon: Icon(
              Icons.search,
              size: 24,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: List.generate(testList.length, (index) {
                return MemberItem(
                  isShowBox: false,
                  userName: testList[index]['userName'],
                  url: testList[index]['image'],
                  onTap: () {
                    _showRemarksDialog(context);
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// 备注名弹框(带输入框)
_showRemarksDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: MediaQuery.of(context).size.height / 3),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: <Widget>[
                        Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              leading:
                                  Image.asset('assets/images/nopath---.png',package: packageName),
                              title: Text(
                                '我是昵称',
                                style: TextStyle(
                                    color: Color(0xFF666666), fontSize: 14),
                              ),
                              subtitle: Text(
                                '管理员',
                                style: TextStyle(
                                    color: Color(0xFF999999), fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          child: Expanded(
                            child: Material(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8)), //边角为5
                                ),
                                child: TextField(
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      /*边角*/
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5), //边角为5
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(0XFFEEEEEE), //边线颜色为白色
                                        width: 1, //边线宽度为2
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFEEEEEE), //边框颜色为白色
                                        width: 1, //宽度为5
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5), //边角为30
                                      ),
                                    ),
                                    hintText: '输入新备注名',
                                    filled: true,
                                    fillColor: Color(0xFFF5F5F5),
                                    contentPadding: const EdgeInsets.all(5),
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFF999999)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: Color(0xFFF5F5F5),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 21),
                                      child: Text(
                                        '取消',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0XFF666666),
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                color: Color(0XFFF5F5F5),
                                width: 2,
                                height: 36,
                              ),
                              Expanded(
                                  child: Material(
                                child: InkWell(
                                  onTap: () {
                                    print('修改');
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Color(0xFF2D88FF),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 21),
                                    child: Text(
                                      '修改',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
      });
}
