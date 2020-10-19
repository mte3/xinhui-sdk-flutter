import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

import 'cash_withdrawal_page.dart';
import 'recharge_page.dart';


class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
          appBar: NavigationBar(
          backgroundColor: Color(0xffFAFAFA),
          title: '我的钱包',
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
          rightDMActions: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.black,
            ),
            SizedBox(width: 14,)
          ],
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 79,
            ),
            Image.network('https://lanhu.oss-cn-beijing.aliyuncs.com/xd513b5260-e992-428e-a9db-9f80a5035ea3',
            height: 57,
            width: 57,),
            SizedBox(
              height: 20,
            ),
            Text('我的零钱',style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  'https://lanhu.oss-cn-beijing.aliyuncs.com/xd66e38329-fc61-48d9-9cb2-98f7167498ba',
                  height: 28,
                  width: 36,
                  color: Colors.black,
                ),
                Text(
                  '0.00',
                  style: TextStyle(fontSize: 51, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 108,
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
             color: Color.fromRGBO(4,217,25,1),
                child: MaterialButton(
                    child: Center(
                        child: Text(
                      '充值',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                    onPressed: () {
                      routePush(RechargePage());
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  border: Border.all(width: 1, color: Colors.blue),
                ),
                child: MaterialButton(
                    child: Center(
                        child: Text(
                      '提现',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    )),
                    onPressed: () {
                      routePush(CashwithdarwalPage());
                    }),
                    
              ),
            ),
           
          ],
        ));
  }
}
