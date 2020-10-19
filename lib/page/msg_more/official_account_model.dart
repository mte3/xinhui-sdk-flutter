
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class OfficialAccountModel extends StatefulWidget {
  @override
  _OfficialAccountModelState createState() => _OfficialAccountModelState();
}

class _OfficialAccountModelState extends State<OfficialAccountModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(title: "搜索公众号", leadingType: 1),
      body: Center(
        child: Text(
          "暂无数据",
          style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(153, 153, 153, 1),
          ),
        ),
      ),
    );
  }
}
