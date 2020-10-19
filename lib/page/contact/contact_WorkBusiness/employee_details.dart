import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/contact/contact_WorkBusiness/location_information.dart';
import 'package:jh_im_sdk/page/contact/contact_WorkBusiness/qr_code.dart';
import 'package:jh_im_sdk/util/tools.dart';

class EmployeeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            routePush(pop());
          },
          icon: Image.asset('assets/images/contacts/back.png',
              package: packageName),
        ),
        title: Text(
          '基本信息',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Color.fromRGBO(255, 255, 255, 1),
              padding: EdgeInsets.only(left: 16, top: 16),
              height: 112,
              child: Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/contacts/touxiang2.png',package: packageName,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Harry',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Image.asset('assets/images/contacts/sex-man.png',package: packageName)
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                  'assets/images/contacts/employeeIcon1.png',package: packageName),
                              SizedBox(
                                width: 8,
                              ),
                              Text('123456789')
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset(
                                'assets/images/contacts/employeeIcon2.png',package: packageName),
                            SizedBox(
                              width: 8,
                            ),
                            Text('广东省-广州市'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  GetTitle1(
                    ontap: () {},
                    title: '主见',
                  ),
                  GetTitle(
                    ontap: () {},
                    title: '生日',
                    text1: "2020-03-12",
                  ),
                  GetTitle(
                    ontap: () {},
                    title: '手机号码',
                    text1: "1234567890",
                  ),
                  GetTitle(
                    ontap: () {},
                    title: '上次在线的时间',
                    text1: "昨天 22:22",
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 12),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      routePush(QrCode());
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            '二维码',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Container(
                            width: 45,
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/contacts/erweima.png',
                                  width: 20,
                                  height: 20,package: packageName,
                                ),
                                Icon(Icons.keyboard_arrow_right,
                                    color: Color.fromRGBO(205, 205, 205, 1))
                              ],
                            ),
                          )),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 0.5,
                                  color: Color.fromRGBO(240, 240, 240, 1)))),
                    ),
                  ),
                  GetTitle1(
                    ontap: () {
                      routePush(LocationInformation());
                    },
                    title: '我的位置',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GetTitle1 extends StatelessWidget {
  final Function ontap;
  final String title;

  const GetTitle1({
    Key key,
    this.ontap,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Color.fromRGBO(205, 205, 205, 1)),
        ),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromRGBO(240, 240, 240, 1)))),
      ),
    );
  }
}

class GetTitle extends StatelessWidget {
  final Function ontap;
  final String title;
  final String text1;

  const GetTitle({Key key, this.ontap, this.title, this.text1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            text1,
            style: TextStyle(color: Color.fromRGBO(205, 205, 205, 1)),
          ),
        ),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromRGBO(240, 240, 240, 1)))),
      ),
    );
  }
}