
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AddDialog extends AlertDialog {
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
            margin: EdgeInsets.only(
                left:MediaQuery.of(context).size.width/198*142,
                top: 40),
            width: 96,
            height: 165,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
            ),
            child: Column(
              children: <Widget>[
                Table(icon:Icons.cloud_upload,title: '发送图文',),
                Table(icon:Icons.keyboard_voice,title: '发布语音',),
                Table(icon:Icons.videocam,title: '发布视频',),
                Table(icon:Icons.insert_drive_file,title: '发布文件',),
                Table(icon:Icons.mode_comment,title: '最新评论',),
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
  final  IconData icon;
  const Table({
    Key key, this.title, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Icon(icon,color: Colors.black),
          Text(title,style: TextStyle(fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}
