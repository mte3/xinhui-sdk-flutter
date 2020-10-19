import 'package:flutter/material.dart';

class Empower extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmpowerState();
  }
}

class EmpowerState extends State<Empower> {
  List empowerHeavyTitle = [
    "  状态 :  ",
    "  相机 :  ",
    "  录音 :  ",
    "  储存 :  ",
  ];
  List empowerTitle = [
    "将用于设备状态显示",
    "将用于照相、视频等",
    "将用于语音通话等",
    "将用于存储文件等",
  ];

  List authorityDescription = [
    "即时通讯高度重视用户隐私，调用以上权限，不影响您的资讯安全。",
    "允许调用，代表您无条件同意即时通讯的用户协议及相关的解释和说明。",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: 286.0,
            height: 346.0,
            padding: EdgeInsets.symmetric(vertical: 3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.black12,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 47.0,
                  alignment: Alignment.center,
                  child: Text(
                    "请同意即时通讯获得以下权限：",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
                Divider(
                  height: 1.0,
                  color: Color(0xffF0F0F0),
                ),
                Container(
                  height: 97.0,
                  margin: EdgeInsets.only(top: 4.0),
                  padding: EdgeInsets.only(left: 48.0),
                  child: ListView.builder(
                    itemCount: empowerTitle.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.lens,
                              size: 4.0,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: empowerHeavyTitle[index],
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: empowerTitle[index],
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xff333333),
                                        wordSpacing: 10.0,
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  height: 1.0,
                  color: Color(0xffF0F0F0),
                ),
                Container(
                  height: 130.0,
                  padding:
                  EdgeInsets.symmetric(horizontal: 24.0, vertical: 19.0),
                  child: ListView.builder(
                    itemCount: authorityDescription.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Text(
                          authorityDescription[index],
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xff333333),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 44.0,
                  width: 237.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xff2D88FF),
                    onPressed: () {},
                    child: Text(
                      "同意",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffF0F0F0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}