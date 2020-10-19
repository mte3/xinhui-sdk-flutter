import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/red_package/red_money_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';

class SendRedPage extends StatefulWidget {
  @override
  _SendRedPageState createState() => _SendRedPageState();
}

class _SendRedPageState extends State<SendRedPage> {
  String money = "0.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new NavigationBar(
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
          title: '发红包'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 42,
            margin: EdgeInsets.only(left: 27, top: 20, right: 27),
            child: TextField(
              onChanged: (money1) {
                setState(() {
                  money = money1;
                });
              },
              focusNode: FocusNode(),
              textAlign: TextAlign.right,
              decoration: new InputDecoration(
                hintText: "0.00",
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                prefixIcon: Container(
                  margin: EdgeInsets.only(top: 12, left: 12),
                  height: 20,
                  width: 56,
                  child: new Text(
                    "单个金额",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                suffixIcon: Container(
                  margin: EdgeInsets.only(top: 12, left: 12),
                  height: 20,
                  width: 14,
                  child: new Text(
                    "元",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            height: 42,
            margin: EdgeInsets.only(left: 27, top: 20, right: 27),
            child: TextField(
              decoration: new InputDecoration(
                hintText: "恭喜发财，大吉大利。",
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 40),
            child: Text(
              "￥$money",
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
          ),
          GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: 110,
                height: 36,
                margin: EdgeInsets.only(top: 18),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  "塞钱进红包",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return RedMoneyPage(
                      title: "发红包",
                    );
                  })),
        ],
      ),
    );
  }
}
