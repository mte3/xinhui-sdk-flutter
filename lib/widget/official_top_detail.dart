import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
class OfficialTopDetail extends StatelessWidget {

  final String title;// 公众号名称
  final String imageUrl;// 公众号头像
  final String synopsis;// 公众号简介
  final int tweetsNum;//推文数量
  final int fansNum;

  const OfficialTopDetail({Key key, this.title, this.imageUrl, this.synopsis, this.tweetsNum, this.fansNum}) : super(key: key);//粉丝数量
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 21,bottom: 8),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Image.asset(imageUrl,
                      package: packageName)),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: Text(
                         synopsis,
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF666666)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(right: 30),
                              child: Text(
                                '${tweetsNum}篇原创推文',
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${fansNum}名粉丝',
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
