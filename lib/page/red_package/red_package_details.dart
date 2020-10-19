/*
*  red_package_details.dart
*  郑南婉-IM-讯息
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';

class RedPackageDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 21, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    "assets/images/u42683526271650643149fm11gp0-3.png",
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,package: packageName,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "小李的红包",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Text(
              "恭喜发财，大吉大利！",
              style: TextStyle(
                color: Color.fromARGB(255, 205, 205, 205),
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.w600,
                fontSize: 14,
                //letterSpacing: -0.28,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 19),
            height: 56,
            child: Text(
              "￥200.00",
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.w600,
                fontSize: 40,
                //letterSpacing: -0.8,
              ),
            ),
          ),
          Text(
            "已存入余额",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color.fromARGB(255, 205, 205, 205),
              fontFamily: "PingFang SC",
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 26, right: 16, top: 76),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/u42683526271650643149fm11gp0-3.png",
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,package: packageName,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 150,
                  height: 40,
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 1),
                        child: Text(
                          "张三",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontFamily: "PingFang SC",
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Text(
                        "4月10日  02：23",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 205, 205, 205),
                          fontFamily: "PingFang SC",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 58,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    "200.00元",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "PingFang SC",
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1),
        ],
      ),
    );
  }
}
