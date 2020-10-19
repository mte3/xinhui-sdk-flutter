import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class SetLangPage extends StatefulWidget {
  @override
  _SetLangPageState createState() => _SetLangPageState();
}

class _SetLangPageState extends State<SetLangPage> {
  String currentLang = '简体中文';

  List data = ['简体中文', '繁體中文', 'English', 'Pilipino'];

  Widget itemBuild(item) {
    return new FlatButton(
      color: Colors.white,
      child: new Container(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xff11152B).withOpacity(0.8),
              width: 0.3,
            ),
          ),
        ),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Text(
                '$item',
                style: TextStyle(
                  color: currentLang == item
                      ? Color(0xff333333)
                      : Color(0xff333333).withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            new Visibility(
              visible: currentLang == item,
              child: new Image.asset(
                'assets/images/commom/ic_tick.png',
                width: 20.0,package: packageName,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        if (currentLang == item) return;
        setState(() => currentLang = item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(title: '语言'),
      backgroundColor: Colors.white,
      body: new ListView(children: data.map(itemBuild).toList()),
    );
  }
}
