import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class ChatMessage extends StatefulWidget {
  @override
  _ChatMessageState createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  String groupValue = '永久';
  String value = '永久';

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
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: ChatMessageRadio(
                title: '永久',
                groupValue: '永久',
                value: value,
                onTap: () {
                  setState(() {
                    updateValue('永久');
                  });
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: ChatMessageRadio(
                title: '一年',
                groupValue: '一年',
                value: value,
                onTap: () {
                  setState(() {
                    updateValue('一年');
                  });
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: ChatMessageRadio(
                title: '一季度',
                groupValue: '一季度',
                value: value,
                onTap: () {
                  setState(() {
                    updateValue('一季度');
                  });
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: ChatMessageRadio(
                title: '一个月',
                groupValue: '一个月',
                value: value,
                onTap: () {
                  updateValue('一个月');
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: ChatMessageRadio(
                title: '一周',
                groupValue: '一周',
                value: value,
                onTap: () {
                  updateValue('一周');
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: ChatMessageRadio(
                title: '一天',
                groupValue: '一天',
                value: value,
                onTap: () {
                  updateValue('一天');
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: ChatMessageRadio(
                title: '一小时',
                groupValue: '一小时',
                value: value,
                onTap: () {
                  setState(() {});
                  updateValue('一小时');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessageRadio extends StatefulWidget {
  var groupValue;
  final Function onTap;
  final String title;
  var value;

  ChatMessageRadio(
      {Key key, this.onTap, this.title, this.groupValue, this.value})
      : super(key: key);

  @override
  _ChatMessageRadioState createState() => _ChatMessageRadioState();
}

class _ChatMessageRadioState extends State<ChatMessageRadio> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(color: Color(0xFF333333), fontSize: 16),
      ),
      trailing: widget.groupValue == widget.value
          ? Image.asset('assets/images/-927.png',
          package: packageName)
          : null,
      onTap: widget.onTap,
    );
  }
}
