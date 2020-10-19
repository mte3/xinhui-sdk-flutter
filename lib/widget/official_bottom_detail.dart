import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class OfficialBottomDetail extends StatelessWidget {
  final String imageUrl; // 推文图片
  final String title; // 推文标题
  final String subtitle; // 推文副标题

  const OfficialBottomDetail(
      {Key key, this.imageUrl, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: <Widget>[
          Container(
            child: Image.asset(
              imageUrl,
              width: winWidth(context),
              fit: BoxFit.fill,
              package: packageName,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              title,
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8, bottom: 12),
            alignment: Alignment.bottomLeft,
            child: Text(
              subtitle,
              style: TextStyle(color: Color(0xFF999999), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
