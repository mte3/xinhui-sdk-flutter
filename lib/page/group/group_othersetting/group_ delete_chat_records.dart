import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class GroupDeleteChat extends StatefulWidget {
  @override
  _GroupDeleteChatState createState() => _GroupDeleteChatState();
}

class _GroupDeleteChatState extends State<GroupDeleteChat> {
  String groupValue = 'forever';
  String value = 'forever';

  void updateValue(String v) {
    setState(() {
      value = v;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '消息过期时间',
        leading: new InkWell(
          child: Container(
            width: 22,
            height: 22,
            child: Image.asset(
              "assets/images/-1.png",
              fit: BoxFit.none,package: packageName,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: 400,
        child: Column(
          children: <Widget>[
             ChatDeleteRadio(
              title: '永久',
              groupValue: 'forever',
              value: value,
              onTap: () {
                setState(() {
                  updateValue('forever');
                });
              },
            ),
            ChatDeleteRadio(
              title: '1小时',
              groupValue: 'hour',
              value: value,
              onTap: () {
                setState(() {
                  updateValue('hour');
                });
              },
            ),
            ChatDeleteRadio(
              title: '1天',
              groupValue: 'day',
              value: value,
              onTap: () {
                setState(() {
                  updateValue('day');
                });
              },
            ),
            ChatDeleteRadio(
              title: '1周',
              groupValue: 'week',
              value: value,
              onTap: () {
                setState(() {
                  updateValue('week');
                });
              },
            ),
            ChatDeleteRadio(
              title: '1个月',
              groupValue: 'month',
              value: value,
              onTap: () {
                setState(() {
                  updateValue('month');
                });
              },
            ),
            ChatDeleteRadio(
              title: '1个季度',
              groupValue: '3month',
              value: value,
              onTap: () {
                setState(() {
                  updateValue('3month');
                });
              },
            ),
            ChatDeleteRadio(
              title: '1年',
              groupValue: '12month',
              value: value,
              onTap: () {
                setState(() {
                  updateValue('12month');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


class ChatDeleteRadio extends StatefulWidget {
  var groupValue;
  final Function onTap;
  final String title;
  var value;

  ChatDeleteRadio(
      {Key key, this.onTap, this.title, this.groupValue, this.value})
      : super(key: key);

  @override
  _ChatDeleteRadioState createState() => _ChatDeleteRadioState();
}

class _ChatDeleteRadioState extends State<ChatDeleteRadio> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(color: Color(0xFF333333), fontSize: 16),
      ),
      trailing: widget.groupValue == widget.value
          ? Image.asset('assets/images/-927.png',package: packageName)
          : null,
      onTap: widget.onTap,
    );
  }
}
