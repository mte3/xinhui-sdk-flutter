/*
*  讯息聊天信息发红包1_widget.dart
*  郑南婉-IM-讯息
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/values/values.dart';
import 'package:jh_im_sdk/widget/Passwordandkeyboard/custom_keyboard.dart';
import 'package:jh_im_sdk/widget/Passwordandkeyboard/password_style.dart';
import 'package:jh_im_sdk/widget_common/view/show_toast.dart';

class RedMoneyPage extends StatefulWidget {
  final String title;
  const RedMoneyPage({Key key, this.title}) : super(key: key);
  @override
  _RedMoneyPageState createState() => _RedMoneyPageState();
}

class _RedMoneyPageState extends State<RedMoneyPage> {
  bool isClick = false;
  String paw = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // VoidCallback：没有参数并且不返回数据的回调
  VoidCallback _showBottomSheetCallback;

  @override
  void initState() {
    _showBottomSheetCallback = _showBottomSheet;
  }

  /// 密码键盘 确认按钮 事件
  void onAffirmButton() {
    print(paw);
    Navigator.of(context).pop();
  }

  /// 密码键盘的整体回调，根据不同的按钮事件来进行相应的逻辑实现
  void _onKeyDown(KeyEvent data) {
// 如果点击了删除按钮，则将密码进行修改
    if (data.isDelete()) {
      if (paw.length > 0) {
        paw = paw.substring(0, paw.length - 1);
        setState(() {});
      }
    }
// 点击了确定按钮时
    else if (data.isCommit()) {
      if (paw.length != 6) {
        return showToast(context, "密码不足6位，请重试");
      }
      onAffirmButton();
    }
//点击了数字按钮时  将密码进行完整的拼接
    else {
      if (paw.length < 6) {
        paw += data.key;
      }
      setState(() {});
    }
  }

  void _showBottomSheet() {
    setState(() {
      // disable the button  // 禁用按钮
      _showBottomSheetCallback = null;
    });

    /*
      currentState：获取具有此全局键的树中的控件状态
      showBottomSheet：显示持久性的质感设计底部面板
      解释：联系上文，_scaffoldKey是Scaffold框架状态的唯一键，因此代码大意为，
           在Scaffold框架中显示持久性的质感设计底部面板
     */
    _scaffoldKey.currentState
        .showBottomSheet<void>((BuildContext context) {
          /// 将自定义的密码键盘作为其child   这里将回调函数传入
          return MyKeyboard(_onKeyDown);
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              // re-enable the button  // 重新启用按钮
              _showBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width - 290) / 2,
                bottom: 150),
            width: 290,
            height: isClick == false ? 193 : 225,
            decoration: BoxDecoration(
              color: Colors.white,

              //color: AppColors.primaryBackground,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isClick == true
                    ? Container(
                        color: Colors.white,
                        height: 22,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "请输入支付密码",
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "PingFang SC",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  color: Colors.white,
                  height: 22,
                  width: 50,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 17),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "PingFang SC",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  height: 42,
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "￥12.00",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "PingFang SC",
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "使用余额支付",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.accentText,
                        fontFamily: "PingFang SC",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                isClick == false
                    ? InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width: 235,
                          height: 40,
                          margin: EdgeInsets.only(top: 10, bottom: 14),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryElement,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Text(
                            "确认支付",
                            style: TextStyle(
                              color: AppColors.secondaryText,
                              fontFamily: "PingFang SC",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        onTap: () {
                          if (isClick == false) {
                            setState(() {
                              isClick = true;
                            });
                          }
                          _showBottomSheetCallback();
                        },
                      )
                    : GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, bottom: 14),
                          width: 250.0,
                          height: 40.0,
//      color: Colors.white,  自定义密码输入框的使用
                          child: new CustomJPasswordField(paw),
                        ),
// 用户点击输入框的时候，弹出自定义的键盘
                        onTap: () {
                          _showBottomSheetCallback();
                        },
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
