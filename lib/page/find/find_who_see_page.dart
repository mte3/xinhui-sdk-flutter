import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class WhoSeePage extends StatefulWidget {
  @override
  _WhoSeePageState createState() => _WhoSeePageState();
}

class _WhoSeePageState extends State<WhoSeePage> {
  int check = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NavigationBar(
          title: "谁可以看",
          rightDMActions: <Widget>[
            Container(
              margin: EdgeInsets.all(13),
              child: InkWell(
                onTap: () {
                  print('触发完成');
                },
                child: Text(
                  "完成",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: a.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  check = index;
                  if (index == 2) {
                  } else if (index == 3) {
                    print('3');
                  }
                });
              },
              child: Container(
                height: 72,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(a[index]["title"]),
                        SizedBox(height: 10),
                        Text(
                          a[index]["subtitle"],
                          style: TextStyle(
                              color: Colors.transparent.withOpacity(0.5)),
                        ),
                        check == 1 ? Text("搜索") : Text(""),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      check == index
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      size: 22.0,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

List a = [
  {"title": "公开", "subtitle": "所有朋友可见"},
  {"title": "私密", "subtitle": "仅自己可见"},
  {"title": "部分可见", "subtitle": "选中朋友可见"},
  {"title": "不给谁看", "subtitle": "选中朋友不可见"}
];
