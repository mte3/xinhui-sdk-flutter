import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class OpinionLimit extends StatefulWidget {
  @override
  _OpinionLimitState createState() => _OpinionLimitState();
}

class _OpinionLimitState extends State<OpinionLimit> {
  bool noSeeOther = false;

  bool notAllowSee = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Image.asset(
            'assets/images/-1.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,package: packageName,
          ),
        ),
        title: Text(
          '设置主见权限',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text(
                "不让他看我的主见",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              value: notAllowSee,
              onChanged: (bool v) {
                setState(() {
                  notAllowSee = v;

                });
              },
            ),
            SwitchListTile(
              title: Text(
                "不看他的主见",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              value: noSeeOther,
              onChanged: (bool v) {
                setState(() {
                  noSeeOther = v;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
