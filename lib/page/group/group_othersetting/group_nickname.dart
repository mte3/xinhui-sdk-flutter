import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class GroupNickname extends StatefulWidget {
  @override
  _GroupNicknameState createState() => _GroupNicknameState();
}

class _GroupNicknameState extends State<GroupNickname> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '群内昵称',
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
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding:EdgeInsets.fromLTRB(16, 4, 16, 4),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('群内昵称'),
                Expanded(
                  child: Container(
                    child: TextField(
                      textAlign: TextAlign.end,
                      decoration: new InputDecoration(
                          hintText: '请输入群内昵称',
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(16, 24, 16, 0),
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
              child: Center(
                  child: Text('确定',
                    style: TextStyle(color: Colors.white),)
              ),
            ),
          )
        ],
      ),
    );
  }
}
