import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/find/find_share_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';
import 'package:jh_im_sdk/widget/find/find_color.dart';

class Moments extends StatefulWidget {
  final Widget child;
  final bool y;
  Moments({this.child, this.y});
  @override
  _MomentsState createState() => _MomentsState();
}

class _MomentsState extends State<Moments> {
  int x;
  @override
  Widget build(BuildContext context) {
    List data = [
      {"imageUrl": "assets/images/-15--1.png"},
      {"imageUrl": "assets/images/-914-2.png"},
      {"imageUrl": "assets/images/-5727-2.png"},
      {"imageUrl": "assets/images/-918.png"},
      {"imageUrl": "assets/images/-915-2.png"},
      {"imageUrl": "assets/images/-5728-4.png"},
    ];

    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Image.asset(
              "assets/images/nopath----2.png",package: packageName,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Krystal",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "28分钟前",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.accentText,
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                Text(
                  widget.y ? "明月几时有，把酒问青天，不知天上宫阙 ，今夕是何年" : "",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Container(
                  child: widget.child,
                ),
                Container(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, value) {
                      return Row(
                        children: <Widget>[
                          Container(
                            width: 18,
                            child: InkWell(
                              child: Image.asset(data[value]["imageUrl"],package: packageName),
                              onTap: () {
                                if (value == 0) {
                                  print("0");
                                } else if (value == 1) {
                                  print("1");
                                } else if (value == 2) {
                                  print("2");
                                } else if (value == 3) {
                                  print("3");
                                } else if (value == 4) {
                                  print("4");
                                } else if (value == 5) {
                                  routePush(SharePage(
                                    string: "分享",
                                  ));
                                }
                                setState(() {
                                  return x = value;
                                });
                              },
                            ),
                          ),
                          Text(value == 1 ? "1" : ""),
                          Container(width: 20),
                        ],
                      );
                    },
                  ),
                ),
                x == 1
                    ? Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width - 140,
                        color: Color.fromARGB(255, 242, 242, 242),
                        child: TextColor(
                          text2: "Spring:",
                          text3: "明月几时有，把酒问青天，不知天上宫阙 ，今夕是何年",
                        ),
                      )
                    : Container(
                        height: 10,
                      ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Image.asset(
                "assets/images/-5725.png",
                fit: BoxFit.none,package: packageName,
              ),
              Text(
                "删除",
                style: TextStyle(
                  color: AppColors.secondaryElement,
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
