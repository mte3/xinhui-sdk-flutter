import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jh_im_sdk/page/chat_details/group/announcement_inform.dart';
import 'package:jh_im_sdk/page/chat_details/group/announcement_sand.dart';
import 'package:jh_im_sdk/page/chat_details/group/file_group_none.dart';
import 'package:jh_im_sdk/page/chat_details/group/member_group.dart';
import 'package:jh_im_sdk/page/chat_details/group/member_group_gog.dart';
import 'package:jh_im_sdk/page/chat_details/group/send_dialog.dart';
import 'package:jh_im_sdk/page/chat_details/group/code_group.dart';
import 'package:jh_im_sdk/page/chat_details/group/describe_group_dialog.dart';
import 'package:jh_im_sdk/page/chat_details/group/name_group_dialog.dart';
import 'package:jh_im_sdk/page/chat_details/group/name_persion_dialog.dart';
import 'package:jh_im_sdk/page/chat_details/group/user_infrom.dart';
import 'package:jh_im_sdk/util/tools.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';
import 'member_group_delate.dart';
import 'manament_setting.dart';

class GroupWidget extends StatefulWidget {
  GroupWidget({Key key}) : super(key: key);

  @override
  _GroupWidgetState createState() => _GroupWidgetState();
}

class _GroupWidgetState extends State<GroupWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String stateText;
  var _imgPath;
  bool isClick00 = false;
  bool isClick01 = false;
  bool isClick02 = false;
  bool isClick03 = false;
  _modelBottomSheet3() async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  alignment: Alignment.center,
                  child: Text('选择头像',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: _takePhoto,
                        child: Container(child: Text('拍照')))),
                Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: _openGallery,
                        child: Text('相册'))),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "群组信息",
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
        child: ListView(
          physics: BouncingScrollPhysics(),//去除水波
          shrinkWrap: true,
          children: <Widget>[
            Container(
              height: 136,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MemberGroup()),
                      );
                    },
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      height: 46,
                      child: Row(
                        children: <Widget>[
                          Text(
                            '群组信息',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            '共13人',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 18,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 5, right: 5, bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserInfrom()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 16, right: 9),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.asset('assets/images/327.png',
                                package: packageName),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserInfrom()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 16, right: 9),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.asset('assets/images/327.png',
                                package: packageName),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserInfrom()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 16, right: 9),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.asset('assets/images/327.png',
                                package: packageName),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserInfrom()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 16, right: 9),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.asset('assets/images/327.png',
                                package: packageName),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MemberGroup()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 16, right: 9),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.asset('assets/images/5723.png',
                                package: packageName),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MemberGroupDelate()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 16,
                            ),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.asset('assets/images/5724.png',
                                package: packageName),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return NameGroupDialog();
                    });
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '群组名称',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      '测试测试',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return DesribeGroupDialog();
                    });
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '群组描述',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      '一句简单的描述',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CodeGroup()),
                );
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '群组二维码',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    Image.asset(
                      'assets/images/3.0x/-5752.png',
                      width: 14,
                      height: 14,
                      package: packageName,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnnouncementInform()),
                );
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '群内公告',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      '暂无公告',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return NamePersionDialog();
                    });
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '群内昵称',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      'Lindlin',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                _modelBottomSheet3();
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '设置群头像',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FileGroupNone()),
                );
                ;
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '群共享文件',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 12,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 16, right: 16),
              height: 46,
              child: Row(
                children: <Widget>[
                  Text(
                    '置顶聊天',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: Container()),
                  CupertinoSwitch(
                    activeColor: Color(0xFF2D88FF),
                    value: isClick01,
                    onChanged: (bool value) {
                      setState(() {
                        isClick01 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 16, right: 16),
              height: 46,
              child: Row(
                children: <Widget>[
                  Text(
                    '消息免打扰',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: Container()),
                  CupertinoSwitch(
                    activeColor: Color(0xFF2D88FF),
                    value: isClick02,
                    onChanged: (bool value) {
                      setState(() {
                        isClick02 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 16, right: 16),
              height: 46,
              child: Row(
                children: <Widget>[
                  Text(
                    '屏蔽群消息',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: Container()),
                  CupertinoSwitch(
                    activeColor: Color(0xFF2D88FF),
                    value: isClick03,
                    onChanged: (bool value) {
                      setState(() {
                        isClick03 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                showPickerModal(context);
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '消息过期自动销毁',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      '永久',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return SendDialog();
                    });
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '清空聊天记录',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 12,
            ),
            GestureDetector(
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MemberGroupGog()),
                );

              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '禁言',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '全体禁言',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                       CupertinoSwitch(
                        activeColor: Color(0xFF2D88FF),
                        value: isClick00,
                        onChanged: (bool value) {
                          setState(() {
                            isClick00 = value;
                          });
                        },
                      ),
                  ],
                ),
              ),
            ),
            Container(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManagementSetting()),
                );
                ;
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16, right: 16),
                height: 46,
                child: Row(
                  children: <Widget>[
                    Text(
                      '群管理',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 12,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 16, right: 16),
              height: 46,
              child: Row(
                children: <Widget>[
                  Text(
                    '举报',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 18,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            Container(
              height: 32,
            ),
            GestureDetector(
              onTap: () {
                print('解散群组');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => MultiselectPromptWidget()),
                // );
                ;
              },
              child: Container(
                height: 44,
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 70),
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

  /*拍照*/
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imgPath = image;
    });
  }

  /*相册*/
  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imgPath = image;
    });
  }
}


const PickerData = '''
[
    "永久",
    "1小时", 
    "1天",
    "1周"
           
]
    ''';