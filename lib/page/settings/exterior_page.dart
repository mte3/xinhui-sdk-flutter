/*
*  exterior_page.dart
*  我的-设置
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';

class ExteriorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(title: '外观'),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 16, top: 17),
                child: Text(
                  "来挑选符合你眼球的颜色吧",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 102, 102),
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Container(
              height: 168,
              margin: EdgeInsets.only(left: 24, top: 27, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 70,
                      height: 168,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 70,
                              height: 168,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 97, 217, 153),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(11)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                            left: 46,
                            top: 5,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.fromBorderSide(
                                    Borders.primaryBorder),
                                borderRadius: Radii.k10pxRadius,
                              ),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            top: 11,
                            child: Image.asset(
                              "assets/images/-18-2.png",
                              fit: BoxFit.none,package: packageName,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 70,
                      height: 168,
                      margin: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBackground,
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 70,
                      height: 168,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 254, 128, 129),
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 70,
                      height: 168,
                      decoration: BoxDecoration(
                        color: AppColors.ternaryBackground,
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              margin: EdgeInsets.only(left: 38, top: 17, right: 38),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "浅豆绿",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 102, 102, 102),
                        fontFamily: "PingFang SC",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 44),
                      child: Text(
                        "清水蓝",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 102, 102),
                          fontFamily: "PingFang SC",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(right: 44),
                      child: Text(
                        "珊瑚红",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 102, 102),
                          fontFamily: "PingFang SC",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "流霞粉",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 102, 102, 102),
                        fontFamily: "PingFang SC",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 168,
              margin: EdgeInsets.only(left: 24, top: 31, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 70,
                      height: 168,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 85, 190, 183),
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 70,
                      height: 168,
                      margin: EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 108, 84, 172),
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 70,
                      height: 168,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 59, 86, 153),
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 70,
                      height: 168,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 253, 79, 78),
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                      ),
                      child: Container(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              margin: EdgeInsets.only(left: 38, top: 17, right: 38),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "丹钻绿",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 102, 102, 102),
                        fontFamily: "PingFang SC",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 44),
                      child: Text(
                        "葡萄紫",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 102, 102),
                          fontFamily: "PingFang SC",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(right: 44),
                      child: Text(
                        "商务蓝",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 102, 102, 102),
                          fontFamily: "PingFang SC",
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "经典红",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 102, 102, 102),
                        fontFamily: "PingFang SC",
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
