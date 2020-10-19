import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';

import 'red_money_page.dart';

class TransferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '转账',
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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 20),
            child: ClipOval(
              child: Image.asset(
                "assets/images/u42683526271650643149fm11gp0-3.png",
                fit: BoxFit.cover,
                width: 40,
                height: 40,package: packageName,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            alignment: Alignment.center,
            child: Text(
              "小李（*李）",
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 26, top: 49),
            child: Text(
              "转账金额",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 26, top: 20),
            child: TextField(
              style: TextStyle(fontSize: 30),
              decoration: new InputDecoration(
                hintText: "0.00",
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                prefixIcon: Container(
                  height: 20,
                  width: 56,
                  child: new Text(
                    "￥",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (a) {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return RedMoneyPage(
                        title: "转账",
                      );
                    });
              },
            ),
          ),
          Divider(
            height: 8,
          ),
          Container(
            margin: EdgeInsets.only(left: 26, top: 13),
            child: Text(
              "添加转账说明",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.accentText,
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
