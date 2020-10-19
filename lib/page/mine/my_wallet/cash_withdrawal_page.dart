import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';


class CashwithdarwalPage extends StatefulWidget {
  @override
  _CashwithdarwalPageState createState() => _CashwithdarwalPageState();
}

class _CashwithdarwalPageState extends State<CashwithdarwalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        backgroundColor: Color(0xffFAFAFA),
        title: '提现',
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '提现金额',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(102, 102, 102, 1)),
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
                          Text(
                            '¥',
                            style: TextStyle(fontSize: 28),
                          ),
                          Expanded(
                              child: Theme(
                            data: ThemeData(
                                primaryColor: Colors.black,
                                hintColor: Colors.black),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 30.0),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                fillColor: Colors.white, //输入框背景
                                filled: true,
                                border: InputBorder.none,
                                // hintText: '10.00',
                                // hintStyle: TextStyle(fontSize:30,color: Colors.black )
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '总金额：',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(102, 102, 102, 1)),
                        ),
                        Space(),
                        Text(
                          '¥',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(102, 102, 102, 1)),
                        ),
                        Text(
                          '100.00',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(102, 102, 102, 1)),
                        ),
                        Space(),
                        InkWell(
                          child: Text(
                            '全部提现',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(45, 136, 255, 1)),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                        color: Color.fromRGBO(4, 217, 25, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              'https://lanhu.oss-cn-beijing.aliyuncs.com/xd0318f0a4-7fa0-44f4-95ba-27869c3473b8',
                              height: 18,
                              width: 22,
                            ),
                            Text(
                              '提现到微信',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: () {}),
                    MaterialButton(
                        color: Color.fromRGBO(2, 167, 240, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              'https://lanhu.oss-cn-beijing.aliyuncs.com/xd7c6918fe-ef2d-41f3-98e4-229f07cc8dd1',
                              height: 18,
                              width: 22,
                            ),
                            Text(
                              '提现到支付宝',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: () {}),
                    Space(),
                    Center(
                        child: Text(
                      '提现手续费为0.6%，最低提现金额为1元',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(153, 153, 153, 1)),
                    )),
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
