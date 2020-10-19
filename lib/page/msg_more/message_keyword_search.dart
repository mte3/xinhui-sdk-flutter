import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'seek_take_notes.dart';

class MessageKeywordSearchContext extends StatefulWidget {
  @override
  _MessageKeywordSearchContextState createState() =>
      _MessageKeywordSearchContextState();
}

class _MessageKeywordSearchContextState
    extends State<MessageKeywordSearchContext> {
  String keywordText = '今天';
  String yesterdayText="昨天";
  String pastTimesText="2020年2月";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        leadingType: 1,
        titleW: SimpleInputBox(hitTitle: "输入查找内容"),
        rightDMActions: <Widget>[
          Center(
            child: Text(
              "取消",
              style: TextStyle(
                  color: Color.fromRGBO(153, 153, 153, 1), fontSize: 14),
            ),
          ),
          Space()
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        width: winWidth(context),
        child: ListView(
          children: <Widget>[
            timesContext(keywordText),
            keywordContext(3,keywordText),
            timesContext(yesterdayText),
            keywordContext(2, yesterdayText),
            timesContext(pastTimesText),
            keywordContext(1, pastTimesText),
          ],
        ),
      ),
    );
  }
Widget timesContext(String timeTitle){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        timeTitle,
        style: TextStyle(fontSize: 14),
      ),
    );
}
  Widget keywordContext(int length,String timeDate) {
    return Column(
        children: List.generate(length, (_) {
      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2337756152,1867712973&fm=26&gp=0.jpg",
                  width: 28,
                  height: 28,
                  fit: BoxFit.cover,
                ),
              ),
              Space(),
              Text('Chris', style: TextStyle(fontSize: 10)),
              Spacer(),
              Text(
                timeDate,
                style: TextStyle(
                    color: Color.fromRGBO(205, 205, 205, 1), fontSize: 10),
              ),
            ],
          ),
          ListTile(
            leading: CachedNetworkImage(
              imageUrl:
                  "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2337756152,1867712973&fm=26&gp=0.jpg",
              width: 61,
              height: 61,
              fit: BoxFit.cover,
            ),
            subtitle: Text(
              '网址/公众号名称',
              style: TextStyle(
                  color: Color.fromRGBO(153, 153, 153, 1), fontSize: 10),
            ),
            title: Text(
              '链接名称链接名称链接名称链接名称链接名称链接名称链接名称',
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      );
    }));
  }
}
