import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class OfficialAccountSettings extends StatefulWidget {
  @override
  _OfficialAccountSettingsState createState() =>
      _OfficialAccountSettingsState();
}

class _OfficialAccountSettingsState extends State<OfficialAccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        leadingType: 1,
        title: "公众号设置",
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 16),
          rowContext("接收文章推送", 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Text(
              '关闭此开关，你将不会受到该公众号的文章消息，但其他消息类型不受此影响',
              style: TextStyle(
                  fontSize: 12, color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ),
          ),
          rowContext("清空内容", 2),
        ],
      ),
    );
  }

  Widget rowContext(String text, int number) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      height: 48,
      child: Row(
        children: <Widget>[
          Text(text, style: TextStyle(fontSize: 16)),
          Spacer(),
          number == 1
              ? Switch(
                  value: true,
                  onChanged: (value) => setState(() => value = !value),
                )
              : Container(),
          number == 2
              ? Icon(
                  Icons.chevron_right,
                  size: 30,
                  color: Color.fromRGBO(153, 153, 153, 1),
                )
              : Container(),
        ],
      ),
    );
  }
}
