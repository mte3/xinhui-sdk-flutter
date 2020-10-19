import 'package:flutter/material.dart';

class HomeNullView extends StatelessWidget {
  final String str;

  HomeNullView({this.str = '无会话消息'});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new InkWell(
        child: new Text(
          str ?? '',
        ),
//        onTap: () => routePush(new UserPage()),
      ),
    );
  }
}
