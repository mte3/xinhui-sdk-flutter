import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/chat_location_page.dart';
import 'package:jh_im_sdk/page/chat_details/transfer_page_details.dart';
import 'package:jh_im_sdk/page/chat_details/video_page.dart';
import 'package:jh_im_sdk/page/chat_details/voice_page.dart';
import 'package:jh_im_sdk/page/red_package/group_packge_details.dart';
import 'package:jh_im_sdk/page/red_package/red_package_details.dart';
import 'package:jh_im_sdk/page/red_package/send_group_page.dart';
import 'package:jh_im_sdk/page/red_package/send_red_page.dart';
import 'package:jh_im_sdk/page/red_package/transfer_page.dart';
import 'package:jh_im_sdk/util/tools.dart';

class ScanGroupPage extends StatefulWidget {
  @override
  ScanGroupPageState createState() => ScanGroupPageState();
}

class ScanGroupPageState extends State<ScanGroupPage> {
  List<ChatModel> chats = [
    ChatModel(
      username: "1",
      textIma: null,
      text: "你好。",
      time: "",
      avatar: "assets/images/nopath.png",
    ),
    ChatModel(
      username: "1",
      textIma: null,
      text: "你好。",
      time: "",
      avatar: "assets/images/nopath.png",
    ),
    ChatModel(
      username: "2",
      textIma: null,
      text: "你好。",
      time: "",
      avatar: "assets/images/nopath.png",
    ),
    ChatModel(
      username: "2",
      textIma: null,
      text: "你好。",
      time: "",
      avatar: "assets/images/nopath.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    String mine = "2";
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 10.0, right: 50.0),
      alignment: Alignment.topLeft,
    );
    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Colors.blue,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 10.0),
      alignment: Alignment.topRight,
    );
    action(name) {
      switch (name) {
        case '语音通话':
          routePush(new VoicePage());
          break;
        case '视频通话':
          routePush(new VideoPage());
          break;
        case '坐标':
          routePush(new ChatLocationPage());
          break;
        case '红包':
          routePush(new GroupPackageDetails());
          break;
        case '转账':
          routePush(new TransferPage());
          break;
        case "发红包":
          routePush(SendRedPage());
          break;
        case "发群红包":
          routePush(SendGroupRedPage());
          break;
      }
    }

    return Scaffold(
      appBar: new NavigationBar(
        title: '群聊（2）',
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
        rightDMActions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 21,
            height: 21,
            child: InkWell(
              child: Image.asset(
                "assets/images/-942.png",
                fit: BoxFit.none,package: packageName,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            height: 20,
            margin: EdgeInsets.only(left: 16, top: 10),
            child: Row(
              children: <Widget>[
                Image.asset(
                  "assets/images/-943.png",
                  height: 16,
                  width: 14,package: packageName,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "群公告：缪的代价是否进出口世界的",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 102, 102),
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    letterSpacing: -0.28,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Text(chats[index].time),
                    index == 0
                        ? Container(
                            height: 38,
                            margin: EdgeInsets.symmetric(horizontal: 53),
                            decoration: BoxDecoration(
                              color: Color(0xffCDCDCD),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Text(
                              "你通过扫描二维码加入群聊，参与群聊的还有小李，小五，喵喵",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          )
                        : Container(),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: mine == chats[index].username
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        children: <Widget>[
                          InkWell(
                            child: ClipOval(
                              child: Image.asset(
                                chats[index].avatar,
                                width: 36,
                                height: 36,package: packageName,
                              ),
                            ),
                            onTap: () {},
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Row(
                            textDirection: chats[index].username == mine
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            children: <Widget>[
                              chats[index].isMoney == null
                                  ? Stack(
                                      children: <Widget>[
                                        chats[index].backgroundIma != null
                                            ? InkWell(
                                                child: Bubble(
                                                  style: mine ==
                                                          chats[index].username
                                                      ? styleMe
                                                      : styleSomebody,
                                                  padding: BubbleEdges.fromLTRB(
                                                      0, 0, 0, 0),
                                                  child: Container(
                                                    width: 189,
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    child: Image.asset(
                                                      chats[index]
                                                          .backgroundIma,
                                                      fit: BoxFit.fill,package: packageName,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () => action("坐标"),
                                              )
                                            : Container(),
                                        chats[index].backgroundIma != null
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    5)),
                                                    color: Colors.white),
                                                margin: EdgeInsets.only(
                                                    top: 10, left: 7),
                                                padding: EdgeInsets.only(
                                                    left: 10, bottom: 5),
                                                width: 189,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "广东省珠海市",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "广东省珠海市",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : InkWell(
                                                child: Bubble(
                                                  style: mine ==
                                                          chats[index].username
                                                      ? styleMe
                                                      : styleSomebody,
                                                  child: Row(
                                                    textDirection:
                                                        chats[index].username ==
                                                                mine
                                                            ? TextDirection.rtl
                                                            : TextDirection.ltr,
                                                    children: <Widget>[
                                                      Container(
                                                          child: chats[index]
                                                                      .textIma !=
                                                                  null
                                                              ? Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              5),
                                                                  child: Image.asset(
                                                                      chats[index]
                                                                          .textIma,package: packageName))
                                                              : null),
                                                      Container(
                                                        width: chats[index]
                                                                    .backgroundIma !=
                                                                null
                                                            ? 173.5
                                                            : null,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: chats[index]
                                                                      .textIma ==
                                                                  null
                                                              ? MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  142
                                                              : MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  179,
                                                        ),
                                                        child: Text(
                                                          chats[index].text,
                                                          style: TextStyle(
                                                              color: mine ==
                                                                      chats[index]
                                                                          .username
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onTap: () => action(
                                                    chats[index].switchName),
                                              ),
                                      ],
                                    )
                                  : InkWell(
                                      child: Bubble(
                                        style: mine == chats[index].username
                                            ? styleMe
                                            : styleSomebody,
                                        color: Color(0xffFF843D),
                                        child: Container(
                                          height: 80,
                                          width: 172,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                height: 55,
                                                child: Row(
                                                  children: <Widget>[
                                                    Image.asset(
                                                        chats[index].textIma,package: packageName),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 8),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          chats[index].moneyNum !=
                                                                  null
                                                              ? Text(
                                                                  chats[index]
                                                                      .moneyNum,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16),
                                                                )
                                                              : Container(),
                                                          Text(
                                                            chats[index]
                                                                .moneyText,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xffFFCEB1)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                height: 1,
                                                color: Colors.white,
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 5, top: 3),
                                                child: Text(
                                                  chats[index].text,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () => action(chats[index].text),
                                    ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: mine == chats[index].username
                                      ? Text(
                                          "已读",
                                          style: TextStyle(
                                              color: Color(0xffcccccc)),
                                        )
                                      : Text("")),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: chats.length,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 6, left: 16, right: 21),
            height: 44,
            child: Row(
              children: <Widget>[
                InkWell(
                  child: Image.asset("assets/images/-138.png",package: packageName),
                  onTap: () {},
                ),
                SizedBox(width: 6),
                Container(
                  height: 34,
                  width: MediaQuery.of(context).size.width - 128,
                  child: TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none),
                    onChanged: (comm) {},
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  child: Image.asset("assets/images/-85.png",package: packageName,),
                  onTap: () {},
                ),
                SizedBox(width: 4),
                InkWell(
                  child: Image.asset("assets/images/-156.png",package: packageName),
                  onTap: () => action("发群红包"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatModel {
  final String username;
  final String textIma;
  final String backgroundIma;
  final String text;
  final String avatar;
  final String time;
  final bool isMoney;
  final String moneyNum;
  final String moneyText;
  final String switchName;

  ChatModel({
    this.username,
    this.textIma,
    this.backgroundIma,
    this.text,
    this.avatar,
    this.time,
    this.isMoney,
    this.moneyNum,
    this.moneyText,
    this.switchName,
  });
}
