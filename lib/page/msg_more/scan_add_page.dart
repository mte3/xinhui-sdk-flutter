/*
*  讯息扫一扫添加好友widget.dart
*  郑南婉-IM-讯息
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';

class ScanAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(leadingType: 1),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 60,
            margin: EdgeInsets.only(left: 16, top: 7),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/u42683526271650643149fm11gp0-3.png",
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,package: packageName,
                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "小李的小书包",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "PingFang SC",
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          letterSpacing: -0.4,
                        ),
                      ),
                      Container(
                        height: 18,
                        margin: EdgeInsets.only(top: 11),
                        child: Row(
                          children: [
                            Container(
                              width: 21,
                              height: 18,
                              child: Image.asset(
                                "assets/images/-5719-2.png",
                                fit: BoxFit.cover,package: packageName,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 3),
                              child: Text(
                                "：广东，广州",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "PingFang SC",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: -0.28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 22,
            margin: EdgeInsets.only(left: 16, top: 37, right: 16),
            child: Row(
              children: [
                Text(
                  "个性签名",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: -0.32,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "噜啦啦噜啦啦噜啦咧",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.accentText,
                      fontFamily: "PingFang SC",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: -0.32,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 22,
            margin: EdgeInsets.only(left: 16, top: 20, right: 16),
            child: Row(
              children: [
                Text(
                  "来源",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    letterSpacing: -0.32,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 41),
                  child: Text(
                    "来自扫一扫",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.accentText,
                      fontFamily: "PingFang SC",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: -0.32,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              height: 44,
              margin: EdgeInsets.only(left: 16, top: 40, right: 16),
              decoration: BoxDecoration(
                color: AppColors.secondaryElement,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Text(
                "添加到通讯录",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.secondaryText,
                  fontFamily: "PingFang SC",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            onTap: () => showToast(context, '敬请期待'),
          ),
        ],
      ),
    );
  }
}
