import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';

class ChangePwPage extends StatefulWidget {
  @override
  _ChangePwPageState createState() => _ChangePwPageState();
}

class _ChangePwPageState extends State<ChangePwPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(title: '修改密码'),
      body: new MainInputBody(
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16, top: 17, right: 14),
                      child: Text(
                        "为了保证密码的安全性，密码至少应为8个字符，且同时\n包含数字和字母",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "PingFang SC",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    new Space(),
                    new FieldView(
                      title: '新密码',
                      hintText: '确定新密码',
                    ),
                    new Space(),
                    new FieldView(
                      title: '确定密码',
                      hintText: '请再次输入',
                    ),
                  ],
                ),
              ),
            ),
            new Container(
              height: 44,
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 38),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 136, 255),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    child: Text(
                      "确定",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "PingFang SC",
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
