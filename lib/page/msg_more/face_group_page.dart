/*
*  face_group_page.dart
*  郑南婉-IM-讯息
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class FaceGroupPage extends StatefulWidget {
  @override
  _FaceGroupPageState createState() => _FaceGroupPageState();
}

class _FaceGroupPageState extends State<FaceGroupPage> {
  bool fourPasswords = false;
  String paw;
  List<int> pws = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        mainColor: Colors.white,
        backgroundColor: Color(0xff585858),
        title: '面对面建群',
        leadingType: 1,
        leading: InkWell(
          child: Container(
            width: 22,
            height: 22,
            child: Image.asset(
              "assets/images/-1-3.png",
              fit: BoxFit.none,package: packageName,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 88, 88, 88),
      body: Column(
        children: <Widget>[
          fourPasswords == false
              ? Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 40),
                  child: Text(
                    "和身边的朋友输入同样的四个数字，\n进入同一个群聊",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.accentText,
                      fontFamily: "PingFang SC",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                )
              : Container(
                  height: 18,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                height: 33,
                margin: EdgeInsets.only(top: 32),
                alignment: Alignment.center,
                child: pws.length != 0 && pws.length >= (index + 1)
                    ? Container(
                        width: 36,
                        child: Text(
                          pws[index].toString(),
                          style:
                              TextStyle(color: Color(0xff2D88FF), fontSize: 30),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                            color: Color(0xffFF5DA3FF),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
              );
            }),
          ),
          fourPasswords == true
              ? Container(
                  height: 33,
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Text(
                    "这些朋友也将进群",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff999999)),
                  ),
                )
              : Container(),
          fourPasswords == true
              ? Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20, left: 16, right: 16),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: List.generate(10, (index) {
                        return Container(
                          height: 81,
                          width: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipOval(
                                child: Image.asset(
                                  "assets/images/nopath.png",
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,package: packageName,
                                ),
                              ),
                              SizedBox(
                                height: 11,
                              ),
                              Text(
                                "sdfl",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff999999)),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                )
              : Expanded(child: Container()),
          fourPasswords == true
              ? GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 44,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    decoration: BoxDecoration(
                      color: Color(0xff2D88FF),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Text(
                      "进入该群",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(bottom: 26),
                  child: Wrap(
                    runSpacing: 26,
                    children: <Widget>[
                      KeyboardContext(
                        text: "1",
                        onTap: () {
                          pws.add(1);
                          if (pws.length == 4) {
                            fourPasswords = true;
                          }
                          setState(() {});
                        },
                      ),
                      KeyboardContext(
                        text: "2",
                        onTap: () {
                          pws.add(2);
                          if (pws.length == 4) {
                            fourPasswords = true;
                          }
                          setState(() {});
                        },
                      ),
                      KeyboardContext(
                        text: "3",
                        onTap: () {
                          pws.add(3);
                          if (pws.length == 4) {
                            fourPasswords = true;
                          }
                          setState(() {});
                        },
                      ),
                      KeyboardContext(
                        text: "4",
                        onTap: () {
                          pws.add(4);
                          if (pws.length == 4) {
                            fourPasswords = true;
                          }
                          setState(() {});
                        },
                      ),
                      KeyboardContext(
                        text: "5",
                        onTap: () {
                          pws.add(5);
                          if (pws.length == 4) {
                            fourPasswords = true;
                          }
                          setState(() {});
                        },
                      ),
                      KeyboardContext(
                        text: "6",
                        onTap: () {
                          pws.add(6);
                          if (pws.length == 4) {
                            fourPasswords = true;
                          }
                          setState(() {});
                        },
                      ),
                      KeyboardContext(
                        text: "7",
                        onTap: () {
                          pws.add(7);

                          if (pws.length == 4) {
                            fourPasswords = true;
                          }
                          setState(() {});
                        },
                      ),
                      KeyboardContext(
                        text: "8",
                        onTap: () {
                          pws.add(8);
                          if (pws.length == 4) {
                            fourPasswords = true;
                          }
                          setState(() {});
                        },
                      ),
                      KeyboardContext(
                        text: "9",
                        onTap: () {
                          pws.add(9);
                          if (pws.length == 4) {
                            fourPasswords = true;
                          }
                          setState(() {});
                        },
                      ),
                      KeyboardContext(text: "."),
                      KeyboardContext(
                        text: "0",
                        onTap: () {
                          pws.add(0);
                          if (pws.length == 4) {
                            fourPasswords = true;
                          }
                          setState(() {});
                        },
                      ),
                      KeyboardContext(
                        text: "assets/images/-5745.png",
                        isIma: true,
                        onTap: () {
                          if (pws.length > 0) {
                            pws.removeLast();
                            print(pws.toString());
                          }
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class KeyboardContext extends StatelessWidget {
  final String text;
  final bool isIma;
  final Function onTap;
  const KeyboardContext(
      {Key key, @required this.text, this.isIma = false, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: isIma == false
            ? Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            : Image.asset(text, width: 40, height: 25,package: packageName),
        width: MediaQuery.of(context).size.width / 3,
        height: 42,
      ),
    );
  }
}
