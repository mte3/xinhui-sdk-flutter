import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class SafetyModel {
  String label;
  bool value;

  SafetyModel(this.label, {this.value = false});
}

class SafetyItem extends StatelessWidget {
  final String label;
  final Widget rightW;
  final bool isBorder;

  SafetyItem({
    @required this.label,
    this.rightW,
    this.isBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: isBorder
            ? Border(bottom: BorderSide(color: Colors.grey, width: 0.3))
            : null,
      ),
      child: new Row(
        children: <Widget>[
          new Text(
            label,
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 14.0,
            ),
          ),
          new Spacer(),
          rightW,
        ],
      ),
    );
  }
}

class SafetyPage extends StatefulWidget {
  @override
  _SafetyPageState createState() => _SafetyPageState();
}

class _SafetyPageState extends State<SafetyPage> {
  List<SafetyModel> data = [
    new SafetyModel('开启设备锁'),
    new SafetyModel('换设备需要旧设备确认登录'),
  ];

  Widget itemBuild(SafetyModel item) {
    return SafetyItem(
      label: item.label,
      isBorder: item.label == '开启设备锁',
      rightW: new CupertinoSwitch(
        value: item.value,
        onChanged: (bool v) {
          setState(() {
            item.value = v;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(title: '安全', leadingType: 1),
      body: new ListView(children: data.map(itemBuild).toList()),
    );
  }
}
