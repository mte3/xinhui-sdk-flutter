import 'package:flutter/material.dart';
import 'package:jh_im_sdk/widget_common/dialog/confirm_alert.dart';

class NewFriendItemModel {
  String newFriendItem;
  bool select;
  bool isTY;

  NewFriendItemModel(this.newFriendItem,
      [this.isTY = false, this.select = false]);
}

class NewFriendItem extends StatefulWidget {
  @override
  _NewFriendItemState createState() => _NewFriendItemState();
}

class _NewFriendItemState extends State<NewFriendItem> {
  List<NewFriendItemModel> newFriendList = [
    NewFriendItemModel("一"),
    NewFriendItemModel("二"),
    NewFriendItemModel("三"),
    NewFriendItemModel("一"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: newFriendList.map((NewFriendItemModel i) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    ///todo：头像需修改
                    "https://dss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3252521864,872614242&fm=26&gp=0.jpg",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Text(i.newFriendItem.toString()),
                Spacer(),
                Container(
                  width: 60,
                  height: 28,
                  child: i.select
                      ? Container(
                          child: Text(i.isTY ? "已添加" : "已拒绝"),
                        )
                      : FlatButton(
                          child: Text(
                            "添加",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => confirmAlert(context, (v) {
                            setState(() {
                              if (v)
                                i.isTY = true;
                              else
                                i.isTY = false;
                              i.select = !i.select;
                            });
                            print(v);
                          }, tips: "确定添加该用户为好友吗", okBtn: "添加", cancelBtn: "拒绝"),
                          color: Colors.blue,
                        ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
