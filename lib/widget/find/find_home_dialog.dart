import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/find/find_comment_content.dart';
import 'package:jh_im_sdk/page/find/find_release_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/find/find_video_check.dart';

///自定义dialog

class DialogWidget extends StatefulWidget {
  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  bool x = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            margin: EdgeInsets.only(left: 300, top: 40),
            width: 96,
            height: 165,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
            ),
            child: Column(
              children: <Widget>[
                Table(
                  icon: Icons.flag,
                  title: '发送图文',
                  function: () {
                    routePush(ReleasePage(
                        string: "发布图片",
                        icon: Icons.add,
                        text: "发布图片",
                        function: () {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 20,
                                      ),
                                      VideoCheckPage(),
                                    ],
                                  ),
                                );
                              });
                        }));
                  },
                ),
                Table(
                  icon: Icons.mic_none,
                  title: '发布语音',
                  function: () {
                    routePush(ReleasePage(
                      string: "添加语音",
                      icon: Icons.mic_none,
                      text: "添加语音",
                      function: () => print("添加语音"),
                    ));
                  },
                ),
                Table(
                  icon: Icons.videocam,
                  title: '发布视频',
                  function: () {
                    routePush(ReleasePage(
                      string: "发布视频",
                      icon: Icons.video_call,
                      text: "发布视频",
                      function: () => print("发布视频"),
                    ));
                  },
                ),
                Table(
                  icon: Icons.insert_drive_file,
                  title: '发布文件',
                  function: () {
                    routePush(ReleasePage(
                      string: "发布文件",
                      icon: Icons.insert_drive_file,
                      text: "发布文件",
                      function: () => print("发布文件"),
                    ));
                  },
                ),
                Table(
                  icon: Icons.mode_comment,
                  title: '最新评论',
                  function: () {
                    routePush(CommentPage());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Table extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function function;
  const Table({
    Key key,
    this.function,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () => function(),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.black),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
