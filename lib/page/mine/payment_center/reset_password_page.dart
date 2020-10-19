import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

import 'Payment_password_page.dart';

class Resetpassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
          child: Scaffold(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        appBar: NavigationBar(
          backgroundColor: Colors.grey[50],
          title: '重置支付密码',
          leading: new InkWell(
            child: Container(
              width: 22,
              height: 22,
              child: Image.asset(
                "assets/images/-1.png",
                fit: BoxFit.none,package: packageName,
              ),
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 283,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 52,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: 311,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                            color: Color.fromRGBO(240, 240, 240, 1),
                          )),
                        ),
                        child: Row(
                          children: <Widget>[
                            Text('+86'),
                            Expanded(
                              child: Input(
                                hintext: '1231324324324',
                                icon: Icons.keyboard_arrow_down,
                              ),
                            ),
                          ],
                        )),
                    Container(
                      width: 311,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Color.fromRGBO(240, 240, 240, 1),
                        )),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Input(
                              hintext: '图形码',
                              icon: Icons.collections_bookmark,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 52,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(205, 205, 205, 1),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                              ),
                              InkWell(child: Icon(Icons.refresh, size: 16),
                              onTap:(){
                                print('刷新');
                              },
                              ),//刷新的那个图标
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 311,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Color.fromRGBO(240, 240, 240, 1),
                        )),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Input(
                              hintext: '请输入验证码',
                              icon: Icons.security,
                            ),
                          ),
                          MaterialButton(
                              height: 23,
                              minWidth: 38,
                              color: Color.fromRGBO(45, 136, 255, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                "发送",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.white),
                              ),
                              onPressed: () {
                                print('发送');
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    MaterialButton(
                        minWidth: 311,
                        height: 30,
                        color: Color.fromRGBO(45, 136, 255, 1),
                         shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                        child: Text(
                          '修改密码',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          routePush(new main_keyboard());
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  final String hintext;
  final IconData icon;
  const Input({
    Key key,
    this.icon,
    this.hintext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Color.fromRGBO(240, 240, 240, 1),
          hintColor: Color.fromRGBO(205, 205, 205, 1)),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white, //输入框背景
          filled: true,
          border: InputBorder.none,
          hintText: hintext,
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
