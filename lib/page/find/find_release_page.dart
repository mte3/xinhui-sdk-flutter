import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/find/find_who_see_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/checkBox/round_check_box.dart';

import 'find_share_page.dart';

class ReleasePage extends StatefulWidget {
  final String string;
  final String text;
  final IconData icon;
  final Function function;
  ReleasePage({this.string, this.icon, this.text, this.function});
  @override
  _ReleasePageState createState() => _ReleasePageState();
}

class _ReleasePageState extends State<ReleasePage> {
  bool x = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NavigationBar(
          title: widget.string,
          rightDMActions: <Widget>[
            Container(
              margin: EdgeInsets.all(13),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "发布",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
        body: MainInputBody(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15),
                height: 146,
                child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        border: InputBorder.none,
                        hintText: "向大家说说你的想法",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)))),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(150, 236, 236, 236),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:
                    EdgeInsets.only(top: 12, left: 9, bottom: 12, right: 9),
                margin: EdgeInsets.only(bottom: 12, left: 15),
                child: InkWell(
                  onTap: widget.function,
                  child: Column(
                    children: <Widget>[
                      Icon(widget.icon),
                      Text(
                        widget.text,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Color.fromARGB(100, 236, 236, 236),
                height: 20,
              ),
              Container(
                  height: 300,
                  child: ListView(
                    children: list.map((v) {
                      return SetTitle(
                        icon: Icons.chevron_right,
                        string: v["string"],
                        image: "assets/images/${v["images"]}",
                        widget: Text("hhh"),
                        strings: v["strings"],
                        right: v["right"],
                        function: () {
                          setState(() {
                            if (v["index"] == 0) {
                              routePush(WhoSeePage());
                            } else if (v["index"] == 1) {
                              routePush(SharePage(
                                string: "提醒谁看",
                              ));
                            } else if (v["index"] == 2) {
                              print("2");
                            } else if (v["index"] == 3) {
                              print("3");
                            }
                          });
                        },
                      );
                    }).toList(),
                  ))
            ],
          ),
        ));
  }
}

class SetTitle extends StatefulWidget {
  final String string;
  final String strings;
  final String image;
  final IconData icon;
  final Widget widget;
  final bool right;
  final Function function;
  final int index;

  SetTitle({
    this.widget,
    this.icon,
    this.string,
    this.right = true,
    this.strings,
    this.image,
    this.function,
    this.index,
  });
  @override
  _SetTitleState createState() => _SetTitleState();
}

class _SetTitleState extends State<SetTitle> {
  bool x = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.function,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Image.asset(
              widget.image,
              height: 20,
              width: 20,package: packageName,
            ),
          ),
          Text(
            widget.string,
            style: TextStyle(fontSize: 15),
          ),
          Spacer(),
          Text(
            widget.strings != null ? widget.strings : "",
            style: TextStyle(
              color: Colors.transparent.withOpacity(0.6),
            ),
          ),
          widget.right
              ? RoundCheckBox(
                  value: x,
                  onChanged: (v) {
                    setState(() {
                      return x = !x;
                    });
                  },
                )
              : Icon(widget.icon),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}

List list = [
  {
    "string": "谁可以看",
    "images": "chat/-5859.png",
    "strings": "公开",
    "index": 0,
    "right": false
  },
  {
    "string": "提醒谁看",
    "images": "chat/-5859.png",
    "strings": "",
    "index": 1,
    "right": false
  },
  {
    "string": "所在位置",
    "images": "chat/-5859.png",
    "strings": "",
    "index": 2,
    "right": false
  },
  {
    "string": "禁止评论",
    "index": 3,
    "images": "chat/location.png",
    "strings": "禁止后，此主见将不可评论",
    "right": true
  }
];
