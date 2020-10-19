import 'package:flutter/material.dart';

import 'msg_login.dart';

class AccountLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AccountLoginPage();
  }
}

class AccountLoginPage extends State<AccountLogin> {
  String _value = "+86";

  FocusNode _focusNodeUserNum = new FocusNode();
  FocusNode _focusNodeUserPwd = new FocusNode();
  TextEditingController _loginController = TextEditingController();
  var _usernumber = '';
  var _userpwd = '';
  var _isShowPwd = false;

  @override
  void initState() {
    _focusNodeUserNum.addListener(_focusNodeListener);
    _focusNodeUserPwd.addListener(_focusNodeListener);

    super.initState();
  }

  @override
  void dispose() {
    // 移除焦点监听
    _focusNodeUserNum.removeListener(_focusNodeListener);
    _focusNodeUserPwd.removeListener(_focusNodeListener);
    _loginController.dispose();
    super.dispose();
  }

  Future _focusNodeListener() async {
    if (_focusNodeUserNum.hasFocus) {
      print("手机号输入框获取焦点");
      _focusNodeUserPwd.unfocus();
    }
    if (_focusNodeUserPwd.hasFocus) {
      print("密码输入框获取焦点");
      _focusNodeUserNum.unfocus();
    }
  }

  String validatePassWord(value) {
    if (value.isEmpty) {
      return '密码不能为空';
    } else if (value.trim().length18) {
      return '密码长度不正确';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 54.0, top: 13.0),
                  child: Text(
                    "账号登陆",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
                //文本输入
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffF0F0F0),
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _loginController,
                          focusNode: _focusNodeUserNum,
                          //设置键盘类型
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "请输入手机号",
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                          //保存数据
                          onSaved: (String value) {
                            _usernumber = value;
                          },
                        ),
                      ),
                      DropdownButton(
                        elevation: 0,
                        isDense: true,
                        items: <String>['+86', '+87', '+88']
                            .map<DropdownMenuItem<String>>((_value) {
                          return DropdownMenuItem<String>(
                            value: _value,
                            child: Text(_value),
                          );
                        }).toList(),
                        onChanged: (selectValue) {
                          setState(() {
                            _value = selectValue;
                          });
                        },
                        value: _value,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff333333),
                        ),
                        icon: Icon(Icons.keyboard_arrow_down,
                            color: Color(0xffCCCCCC)),
                        iconSize: 30,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffF0F0F0),
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  child: TextFormField(
                    focusNode: _focusNodeUserPwd,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "请输入密码",
                      hintStyle: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffCCCCCC),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon((_isShowPwd)
                            ? Icons.visibility
                            : Icons.visibility_off),
                        // 点击改变显示或隐藏密码
                        onPressed: () {
                          setState(() {
                            _isShowPwd = !_isShowPwd;
                          });
                        },
                      ),
                    ),
                    validator: validatePassWord,
                    //保存数据
                    onSaved: (String value) {
                      _userpwd = value;
                    },
                    onChanged: (text) {
                      print("onchang == >  $text");
                    },
                  ),
                ),
                //忘记密码  立即注册
                Container(
                  child: Row(
                    children: [
                      FlatButton(
                        highlightColor: Color(0xffFFFFFF),
                        splashColor: Color(0xffFFFFFF),
                        child: Text(
                          "快速注册",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 12.0,
                          ),
                        ),
                        //点击快速注册、执行事件
                        onPressed: () {
                          print("点击了立即注册。");
                        },
                      ),
                      Spacer(),
                      FlatButton(
                        highlightColor: Color(0xffFFFFFF),
                        splashColor: Color(0xffFFFFFF),
                        child: Text(
                          "忘记密码?",
                          style: TextStyle(
                            color: Color(0xff2D88FF),
                            fontSize: 12.0,
                          ),
                        ),
                        //忘记密码按钮，点击执行事件
                        onPressed: () {
                          print("点击了忘记密码。");
                        },
                      ),
                    ],
                  ),
                ),
                // 登录按钮区域
                Container(
                  height: 44.0,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 15.0, bottom: 73.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    color: Color(0xff2D88FF),
                    onPressed: () {
                      /* FocusScope.of(context).requestFocus(FocusNode());
                      if (_numberController.text.length != 11) {
                        print("请输入正确的手机号");
                      } */
                    },
                    child: Text(
                      "登陆",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),
                //其他方式登录区域
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff2D88FF),
                  ),
                  child: IconButton(
                    highlightColor: Color(0xffFFFFFF),
                    splashColor: Color(0xffFFFFFF),
                    color: Color(0xffFFFFFF),
                    icon: Icon(Icons.mail_outline),
                    iconSize: 40.0,
                    onPressed: () {
                      /* 改 */
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MsgLogin()));
                    },
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
