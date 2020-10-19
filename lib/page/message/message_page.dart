import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/chat_details.dart';
import 'package:jh_im_sdk/page/chat_details/group_chat_details.dart';
import 'package:jh_im_sdk/page/msg_more/message_searchfriends.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/dialog/msg_more_dialog.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<String> items = List.generate(20, (i) => "${i + 1}");
  int orderIndex = 0;

  action(name) {
    switch (name) {
      case '1':
        routePush(new ChatDetailsPage());
        break;
      case '2':
        routePush(new GroupChatDetailsPage());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new NavigationBar(
        titleW: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '消息',
              style: TextStyle(color: Color(0xff333333)),
            ),
            new Space(width: 5),
            new Image.asset(
              'assets/images/msg/ic_inline.png',
              width: 12.26,
              package: packageName,
            )
          ],
        ),
        backgroundColor: Color(0xffFAFAFA),
        leading: canPop()
            ? null
            : orderIndex == 0
                ? Icon(
                    Icons.folder_open,
                    color: Color(0xff333333),
                  )
                : InkWell(
                    onTap: () => confirmAlert(context, (v) {
                      if (!v) return;
                    }, tips: "确定要清除所有数据吗"),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          "清除",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
        rightDMActions: <Widget>[
          orderIndex == 0
              ? Row(
                  children: <Widget>[
                    new InkWell(
                      onTap: () => showSearch(
                          context: context, delegate: searchBarDelegate()),
                      child: new SizedBox(
                        width: 40,
                        child: new UnconstrainedBox(
                          child: new Image.asset(
                            'assets/images/msg/ic_search.png',
                            width: 17,
                            fit: BoxFit.cover,
                            package: packageName,
                          ),
                        ),
                      ),
                    ),
                    new InkWell(
                      onTap: () => msgMoreDialog(context),
                      child: new SizedBox(
                        width: 40,
                        child: new Icon(
                          CupertinoIcons.add_circled,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                  ],
                )
              : InkWell(
                  onTap: () => setState(() => orderIndex = 0),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Text(
                        "完成",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(width: 0.1)),
            ),
            child: new ListTile(
              onLongPress: () => setState(() => orderIndex = 1),
              title: new Text('张 $item'),
              leading: orderIndex == 0
                  ? CircleAvatar(
                      backgroundImage: new NetworkImage(NETWORK_IMAGE),
                      radius: 22.5,
                    )
                  : Container(
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () => setState(() => items.removeAt(index)),
                            child: Container(
                              width: 20,
                              height: 20,
                              padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "---",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: new NetworkImage(NETWORK_IMAGE),
                            radius: 22.5,
                          ),
                        ],
                      ),
                    ),
              subtitle: new Text('今天在干嘛呢 $item'),
              onTap: () => action(item),
              trailing: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text('18:32'),
                  new SizedBox(height: 5),
                  new Image.asset(
                    'assets/images/msg/ic_msg.png',
                    width: 16.26,
                    package: packageName,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
