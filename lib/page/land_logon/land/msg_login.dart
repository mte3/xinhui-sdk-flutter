import 'package:flutter/material.dart';

import 'account_login.dart';
import 'land_sms.dart';


class MsgLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MsgLoginPage();
  }
}

class MsgLoginPage extends State<MsgLogin> {
  String _value = "+86";
  bool _isshowButton = false;
  Color _buttoncolor = Color(0xff2D88FF).withOpacity(0.5);
  FocusNode _focusNodeUserNum = new FocusNode();
  TextEditingController _numberController = TextEditingController();
  var _usernumber = '';
  var _isShowClear = false;

  @override
  void initState() {
    _focusNodeUserNum.addListener(_focusNodeListener);
    _numberController.addListener(() {
      print(_numberController.text);
      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_numberController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // 移除焦点监听
    _focusNodeUserNum.removeListener(_focusNodeListener);
    _numberController.dispose();
    super.dispose();
  }

  Future _focusNodeListener() async {
    if (_focusNodeUserNum.hasFocus) {
      print("手机号输入框获取焦点");
      _buttoncolor = Color(0xff2D88FF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            // 点击空白区域，回收键盘
            print("点击了空白区域");
            _focusNodeUserNum.unfocus();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: <Widget>[
                //欢迎登陆
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 79.0, bottom: 54.0),
                  child: Text(
                    "欢迎登陆",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
                //输入手机号
                Container(
                  margin: EdgeInsets.only(bottom: 4.0),
                  height: 48.0,
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
                      Container(
                        child: DropdownButton(
                          elevation: 0,
                          items: <String>['+86', '+87', '+88']
                              .map<DropdownMenuItem<String>>((_numTypevalue) {
                            return DropdownMenuItem<String>(
                              value: _numTypevalue,
                              child: Text(_numTypevalue),
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
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 30,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _numberController,
                          focusNode: _focusNodeUserNum,
                          //设置键盘类型
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10.0),
                            border: InputBorder.none,
                            hintText: "请输入手机号",
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xffCCCCCC),
                            ),
                            //尾部添加清除按钮
                            suffixIcon: (_isShowClear)
                                ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                // 清空输入框内容
                                _numberController.clear();
                              },
                            )
                                : null,
                          ),
                          //保存数据
                          onSaved: (String value) {
                            _usernumber = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //注册提示
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "未注册的手机号验证后自动创建即时通讯账户",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xffCCCCCC),
                    ),
                  ),
                ),

                //获取短信验证码按钮
                Container(
                  height: 44.0,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: _buttoncolor,
                    onPressed: () {
                      if (_numberController.text.length != 11) {
                        print("请输入11位的手机号。");
                      }
                      _focusNodeUserNum.unfocus();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LandSms()));

                    },
                    child: Text(
                      "获取短信验证码",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                //忘记密码、寻找帮助按钮
                Container(
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AccountLogin()));
                        },
                        child: Text(
                          "密码登陆",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color(
                                0xff3333330,
                              )),
                        ),
                      ),
                      Spacer(),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "遇到问题",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color(
                                0xff3333330,
                              )),
                        ),
                      ),
                    ],
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
