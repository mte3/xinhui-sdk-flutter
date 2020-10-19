import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';
import 'package:jh_im_sdk/page/find/moments.dart';
import 'package:jh_im_sdk/widget/find/find_home_dialog.dart';

/*
*  主见1_widget.dart
*  IM-主见-完整
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */
class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 1,
            top: 0,
            right: 1,
            child: Image.asset(
              "assets/images/nopath----4.png",
              fit: BoxFit.cover,package: packageName,
            ),
          ),
          Positioned(
            left: 1,
            top: 42,
            right: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ///加号代码
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 19,
                    height: 19,
                    margin: EdgeInsets.only(right: 15),
                    child: InkWell(
                      child: Image.asset(
                        "assets/images/-5724.png",
                        fit: BoxFit.none,package: packageName,
                      ),
                      onTap: () {
                        print("触发加号事件");
                        showDialog(
                            context: context,
                            builder: (context) {
                              return DialogWidget();
                            });
                      },
                    ),
                  ),
                ),

                ///悬浮圆形图代码
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 72,
                        height: 72,
                        margin: EdgeInsets.only(top: 23),
                        child: Image.asset(
                          "assets/images/nopath----5-5.png",
                          fit: BoxFit.none,package: packageName,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7),
                        child: Text(
                          "Spring",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///悬顶代码
                Container(
                  height: 513,
                  margin: EdgeInsets.only(top: 27),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBackground,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Container(),
                ),
              ],
            ),
          ),
          Positioned(
              left: 0,
              top: 239,
              right: 0,
              bottom: 14,
              child: ListView(
                children: <Widget>[
                  Moments(
                    y: true,
                    child: Container(
                      height: 76,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/nopath----7-2.png",package: packageName,
                          ),
                          Image.asset(
                            "assets/images/nopath----6.png",package: packageName,
                          ),
                          Image.asset(
                            "assets/images/nopath----8.png",
                            fit: BoxFit.none,package: packageName,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Moments(
                    y: true,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 39,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 242, 242, 242),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 13),
                            child: Image.asset(
                              "assets/images/-5736.png",package: packageName,
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 14),
                            child: Text(
                              "20\"",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromARGB(255, 205, 205, 205),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Moments(
                    y: false,
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Image.asset("assets/images/nopath----7-2.png",package: packageName),
                    ),
                  ),
                  Moments(
                    y: false,
                    child: Container(
                      height: 80,
                      width: 200,
                      child: Image.asset(
                        "assets/images/nopath----7-2.png",
                        fit: BoxFit.cover,package: packageName,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
