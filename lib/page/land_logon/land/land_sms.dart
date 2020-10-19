import 'package:flutter/material.dart';

class LandSms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LandSmsPage();
  }
}

class LandSmsPage extends State<LandSms> {
  FocusNode _focusNodeCheckCode = new FocusNode();
  //用户名输入框控制器，此控制器可以监听用户名输入框操作
  TextEditingController _checkCodeController = new TextEditingController();
  var _checkcode = '';
  @override
  void initState() {
    //设置焦点监听
    _focusNodeCheckCode.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _checkCodeController.addListener(() {
      print(_checkCodeController.text);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // 移除焦点监听
    _focusNodeCheckCode.removeListener(_focusNodeListener);
    _checkCodeController.dispose();
    super.dispose();
  }

  // 监听焦点
  Future _focusNodeListener() async {
    if (_focusNodeCheckCode.hasFocus) {
      print("验证码输入框获取焦点");
      _focusNodeCheckCode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.clear,
              size: 32.0,
              color: Color(0xff333333),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 35.0),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "输入验证码",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "验证码已发送至 " + "+86" + "18810235355",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xffCCCCCC),
                    ),
                  ),
                ),
                Container(
                  height: 40.0,
                  color: Colors.red,
                  margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: TextField(
                    controller: _checkCodeController,
                    autofocus: true,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " " + " s后重新发送",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xffCCCCCC),
                    ),
                  ),
                ),
                /* Container(
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    onPressed: () {},
                    color: Color(0xffFFFFFF),
                    child: Text(
                      "重新发送验证码",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xff2D88FF),
                      ),
                    ),
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
