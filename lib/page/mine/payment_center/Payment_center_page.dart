import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/mine/mine_page.dart';
import 'package:jh_im_sdk/page/mine/payment_center/bill_page.dart';
import 'package:jh_im_sdk/page/mine/payment_center/reset_password_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:nav_router/nav_router.dart';

import 'Payment_password_page.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: NavigationBar(
          backgroundColor: Color(0xffFAFAFA),
          title: '支付中心',
          leading: new InkWell(
            child: Container(
              width: 22,
              height: 22,
              child: Image.asset(
                "assets/images/-1.png",
                fit: BoxFit.none,package: packageName,
              ),
            ),
            onTap: (){
                routePush(new MinePage());
            },
          ),
     
        ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '账单',
                    style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1), fontSize: 14),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 15,
                  ),
                ],
              ),
            ),
            onTap: () {
             Navigator.push(context,MaterialPageRoute(builder: (context) => Bill()) );
            },
          ),
         InkWell(
                      child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '设置密码',
                    style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1), fontSize: 14),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 15,
                  ),
                ],
              ),
            ),
            onTap: (){
               Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                return new main_keyboard();
              }));
            },
          ),
         InkWell(

                      child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '忘记密码',
                    style: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1), fontSize: 14),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 15,
                  ),
                ],
              ),
            ),
            onTap: (){
               routePush(new Resetpassword());
            },
          ),
        ],
      ),
    );
  }
}
