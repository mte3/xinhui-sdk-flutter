import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/group/group_othersetting/group_chat_record_lookup.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class GroupChatRecord extends StatefulWidget {
  @override
  _GroupChatRecordState createState() => _GroupChatRecordState();
}

class _GroupChatRecordState extends State<GroupChatRecord> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '查找聊天记录',
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 5.0,),
                Icon(Icons.search, color: Colors.grey,),
                Expanded(
                  child: Container(
                    child: TextField(
                      controller: controller,
                      decoration: new InputDecoration(
                          hintText: '输入查找内容',
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Text('在以下内容搜索',
                style: TextStyle(color: Colors.grey),),
              Container(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FindChoice(title: '图片',onTap: () => routePush(ChatLookupPicture())),
                    FindChoice(title: '视频',onTap: () => routePush(ChatLookupVideo())),
                    FindChoice(title: '文件',onTap: () => routePush(ChatLookupFiles())),
                    FindChoice(title: '链接',onTap: () => routePush(ChatLookupLink())),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class FindChoice extends StatelessWidget {
  final String title;
  final Function onTap;

  const FindChoice({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 60,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6))
          ),
          child: Center(child: Text(title,
            style: TextStyle(color: Colors.blue),))),
    );
  }
}
