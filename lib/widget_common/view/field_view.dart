import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';

class FieldView extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  FieldView({
    this.title,
    this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle _hintStyle = TextStyle(
      color: AppColors.accentText,
      fontFamily: "PingFang SC",
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
    return new Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 16, top: 8),
            child: Text(
              "新密码",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xff11152B), width: 0.3)),
          ),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  controller:
                      controller != null ? controller : TextEditingController(),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '设置新密码',
                    hintStyle: _hintStyle,
                  ),
                ),
              ),
              new Image.asset(
                'assets/images/commom/eye_close.png',
                width: 15.0,package: packageName,
              )
            ],
          ),
        ),
      ],
    );
  }
}
