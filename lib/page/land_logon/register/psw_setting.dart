import 'package:flutter/material.dart';

class PswSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PswSettingsPage();
  }
}

class PswSettingsPage extends State<PswSettings> {
  FocusNode _focusNodeUserPwd = FocusNode();

  TextEditingController _userPwdController = new TextEditingController();
  var _isShowPwd = false;
  bool _obscureText = false;
  List _tipsTitle = [
    "输入密码",
    "再次输入密码",
  ];

  @override
  void initState() {
    _focusNodeUserPwd.addListener(_focusNodeListener);

    _userPwdController.addListener(() {
      print(_userPwdController.text);
      if (_userPwdController.text.length > 0) {
        _isShowPwd = true;
      } else {
        _isShowPwd = false;
      }
      setState(() {});
    });
    super.initState();
  }

  Future _focusNodeListener() async {
    if (_focusNodeUserPwd.hasFocus) {
      print("密码框1获取焦点");
    }
  }

  @override
  void dispose() {
    _focusNodeUserPwd.removeListener(_focusNodeListener);
    _userPwdController.dispose();
    super.dispose();
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
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 32.0,
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
                  margin: EdgeInsets.only(top: 35.0, bottom: 18.0),
                  child: Text(
                    "密码设置",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 143,
                  child: ListView.builder(
                    itemCount: _tipsTitle.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Container(
                            height:20,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              _tipsTitle[index],
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xff333333),
                              ),
                            ),
                          ),
                          Container(
                            height: 25,
                            margin: EdgeInsets.symmetric(vertical: 13.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xffF0F0F0),
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: TextEditingController(),
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 10.0),
                                hintText: "请输入密码",
                                hintStyle: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xffCCCCCC),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.visibility_off,
                                    color: Color(0xff2D88FF),
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  height: 44.0,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color.fromRGBO(46, 136, 255, 1),
                    onPressed: () {
                    },
                    child: Text(
                      "下一步",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffFFFFFF),
                        /*  color: (_isShowButton)
                          ? Color.fromRGBO(46, 136, 255, 0.5)
                          : Color.fromRGBO(46, 136, 255, 1), */
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
