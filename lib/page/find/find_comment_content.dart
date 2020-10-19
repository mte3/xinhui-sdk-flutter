import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavigationBar(
          title: "我的评论",
          rightDMActions: <Widget>[
            Container(
              margin: EdgeInsets.all(13),
              child: InkWell(
                onTap: () {
                  confirmAlert(
                    context,
                    (v) {
                      if (!v) return;
                      setState(() {
                        flag = false;
                        print("触发下面的事件");
                      });
                    },
                    tips: '确定清空所有聊天记录',
                  );
                  print("触发清空");
                },
                child: Text(
                  "清空",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
        body: flag == true
            ? ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print("hhh");
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipOval(
                            child: CachedNetworkImage(
                              imageUrl:
                                  "http://pic1.win4000.com/wallpaper/2017-12-04/5a2515a21bd43.jpg",
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("谢欣欣"),
                              Text("点赞你的评论"),
                            ],
                          ),
                          Spacer(),
                          Text("12:20")
                        ],
                      ),
                    ),
                  );
                })
            : Container(
                height: MediaQuery.of(context).size.height,
                child: NoDataView(
                  onRefresh: () {
                    print("已清空");
                  },
                ),
              ));
  }
}
