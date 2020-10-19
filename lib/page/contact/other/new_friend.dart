import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/item/newfriend_item.dart';
import 'package:jh_im_sdk/widget_common/view/indicator_page_view.dart';

class NewFriendModel {
  String addTime;

  NewFriendModel([this.addTime = ""]);
}

class NewFriend extends StatefulWidget {
  @override
  _NewFriendState createState() => _NewFriendState();
}

class _NewFriendState extends State<NewFriend> {
  List<NewFriendModel> list = [
    NewFriendModel("一天前"),
    NewFriendModel("三天前"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            print("返回");
          },
          icon: Image.asset(
            'assets/images/-1.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,package: packageName,
          ),
        ),
        title: Text(
          '新的朋友',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return NewFriendItem();
          },
          itemCount: list.length,
        ),
      ),
    );
  }
}
