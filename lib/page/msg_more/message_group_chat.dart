import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/chat_details.dart';
import 'package:jh_im_sdk/page/chat_details/group/group_widget.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:marquee_flutter/marquee_flutter.dart';

import 'seek_take_notes.dart';

class GroupChat extends StatefulWidget {
  final String groupName;
  final int number;

  GroupChat({this.groupName, this.number});

  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  ScrollController groupController = ScrollController();

  List<GroupChatModel> groupChatModel = <GroupChatModel>[
    GroupChatModel(
        images: "assets/images/nopath---.png", text: "在吗", iconImage: ''),
    GroupChatModel(
        images: "assets/images/nopath---.png", text: "在干嘛呢", iconImage: ''),
    GroupChatModel(
        images: "assets/images/nopath---.png",
        text: "取消了视频通话",
        iconImage: "assets/images/-105.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        leadingType: 1,
        title: "${widget.groupName}(${widget.number}人)",
        rightDMActions: <Widget>[
          InkWell(
              onTap: ()=>routePush(SeekTakeNotes()),
              child: Icon(Icons.search, size: 20, color: Colors.black)),
          Space(),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>GroupWidget()
                )
                );
              },
              child: Image.asset("assets/images/-942.png", fit: BoxFit.none,package: packageName)),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            controller: groupController,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.white,
                    child: Icon(
                      Icons.volume_up,
                      color: Color.fromRGBO(193, 103, 0, 1),
                      size: 14,
                    ),
                  ),
                  Container(
                    width: winWidth(context) - 50,
                    height: 30,
                    color: Colors.white,
                    child: MarqueeWidget(
                        text: "我是群公告会滚动",
                        textStyle: new TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(153, 153, 153, 1),
                        ),
                        scrollAxis: Axis.horizontal,
                        ratioOfBlankToScreen: 0.5),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Column(
                  children: groupChatModel.map(
                    (model) {
                      return BubbleChatLeft(
                        imageUrl: model.images,
                        content: Row(
                          children: <Widget>[
                            Image.asset(
                              model.iconImage,
                              color: Color(0xff666666),
                              fit: BoxFit.cover,package: packageName,
                            ),
                            Text(
                              model.text,
                              style: TextStyle(
                                color: Color(0xff666666),
                                fontSize: 14.0,package: packageName,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              SizedBox(
                child: Center(
                  child: Text(
                    '15:29',
                    style: TextStyle(
                        color: Color.fromRGBO(154, 153, 153, 1), fontSize: 12),
                  ),
                ),
              ),
              Column(
                children: groupChatModel.map((rightModel) {
                  return BubbleChatRight(
                    imageUrl: rightModel.images,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          rightModel.text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              BubbleChatLeft(
                imageUrl: "assets/images/nopath---.png",
                content: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset('assets/images/chat/file.png',
                              fit: BoxFit.cover,
                          height: 55,package: packageName,
                          ),
                          Space(),
                          Expanded(
                            child: Text('61253821133_skytone_10.3.1.302.apk',style: TextStyle(
                              fontSize: 12,color: Color.fromRGBO(51, 51, 51, 1)
                            ),),
                          )
                        ],
                      ),
                      Space(),
                      HorizontalLine(
                        height: 1,
                        color: Color.fromRGBO(240, 240, 240, 1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '文件',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                          ),
                          Text(
                            '1.23MB',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(153, 153, 153, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: FullInputBox(scrollController: groupController),
            ),
          ),
        ],
      ),
    );
  }
}

class GroupChatModel {
  final String images;
  final String text;
  final String iconImage;

  GroupChatModel({this.images, this.text, this.iconImage});
}
