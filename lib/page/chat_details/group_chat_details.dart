import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/transfer_page_details.dart';
import 'package:jh_im_sdk/page/chat_details/video_page.dart';
import 'package:jh_im_sdk/page/chat_details/voice_page.dart';
import 'package:jh_im_sdk/page/red_package/group_packge_details.dart';
import 'package:jh_im_sdk/page/red_package/red_package_details.dart';
import 'package:jh_im_sdk/page/red_package/send_group_page.dart';
import 'package:jh_im_sdk/page/red_package/send_red_page.dart';
import 'package:jh_im_sdk/page/red_package/transfer_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'chat_details.dart';
import 'chat_location_page.dart';

class GroupChatDetailsPage extends StatefulWidget {
  @override
  _GroupChatDetailsPageState createState() => _GroupChatDetailsPageState();
}

class _GroupChatDetailsPageState extends State<GroupChatDetailsPage> {
  //是否语音
  bool isVoice = false;
  //聊天内容模板数据
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
      textIma: "assets/images/-94-2.png",
      text: "取消了语音通话",
      time: "",
      avatar: "assets/images/nopath.png",
      switchName: "语音通话",
    ),
    ChatModel(
      username: "2",
      textIma: "assets/images/-105.png",
      text: "取消了视频通话",
      time: "",
      avatar: "assets/images/nopath---.png",
      switchName: "视频通话",
    ),
    ChatModel(
      username: "2",
      textIma: "assets/images/-105.png",
      text: "结束了视频通话，时长：10秒",
      time: "",
      avatar: "assets/images/nopath---.png",
      switchName: "视频通话",
    ),
    ChatModel(
      username: "1",
      backgroundIma: "assets/images/-5759.png",
      text: "广东省珠海市",
      time: "",
      avatar: "assets/images/nopath.png",
    ),
    ChatModel(
      username: "1",
      textIma: "assets/images/-5730.png",
      text: "红包",
      time: "",
      avatar: "assets/images/nopath.png",
      isMoney: true,
      moneyText: "恭喜发财，大吉大利",
      moneyNum: null,
    ),
    ChatModel(
      username: "1",
      textIma: "assets/images/-913.png",
      text: "转账",
      time: "",
      avatar: "assets/images/nopath.png",
      isMoney: true,
      moneyNum: "￥22.00",
      moneyText: "转账给你",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //根据mine来判断聊天内容在左还是右
    String mine = "2";
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;
    //左边聊天框
    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 10.0, right: 50.0),
      alignment: Alignment.topLeft,
    );
    //右边聊天框
    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Colors.blue,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 10.0),
      alignment: Alignment.topRight,
    );
    //路由跳转
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
                fit: BoxFit.none,
                package: packageName,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: MainInputBody(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      //聊天发送的时间
                      Text(chats[index].time),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //根据发送人的名字还确定聊天框的方向
                          textDirection: mine == chats[index].username
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          children: <Widget>[
                            InkWell(
                              child: ClipOval(
                                child: Image.asset(
                                  //头像
                                  chats[index].avatar,
                                  width: 36,
                                  height: 36,
                                  package: packageName,
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
                                //判断是否是钱类型，来选择红包或转账样式，否则是定位或普通聊天
                                chats[index].isMoney == null
                                    ? Stack(
                                        children: <Widget>[
                                          //backgroundIma != null为定位
                                          chats[index].backgroundIma != null
                                              //层叠一个地图
                                              ? InkWell(
                                                  child: Bubble(
                                                    style: mine ==
                                                            chats[index]
                                                                .username
                                                        ? styleMe
                                                        : styleSomebody,
                                                    padding:
                                                        BubbleEdges.fromLTRB(
                                                            0, 0, 0, 0),
                                                    child: Container(
                                                      width: 189,
                                                      margin: EdgeInsets.only(
                                                          top: 10),
                                                      child: Image.asset(
                                                        chats[index]
                                                            .backgroundIma,
                                                        fit: BoxFit.fill,
                                                        package: packageName,
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () => action("坐标"),
                                                )
                                              : Container(),
                                          chats[index].backgroundIma != null
                                              //层叠显示省份，市，
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(5)),
                                                      color: Colors.white),
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 7),
                                                  padding: EdgeInsets.only(
                                                      left: 10, bottom: 5),
                                                  width: 189,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Text(
                                                        "广东省珠海市",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        "广东省珠海市",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              //backgroundIma == null时，为普通聊天（语音，视频，文字）
                                              : InkWell(
                                                  child: Bubble(
                                                    style: mine ==
                                                            chats[index]
                                                                .username
                                                        ? styleMe
                                                        : styleSomebody,
                                                    child: Row(
                                                      textDirection: chats[
                                                                      index]
                                                                  .username ==
                                                              mine
                                                          ? TextDirection.rtl
                                                          : TextDirection.ltr,
                                                      children: <Widget>[
                                                        Container(
                                                            //textIma !=null为语音视频聊天
                                                            child: chats[index]
                                                                        .textIma !=
                                                                    null
                                                                ? Container(
                                                                    padding: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                    child: Image.asset(
                                                                        chats[index]
                                                                            .textIma,package: packageName,))
                                                                : null),
                                                        Container(
                                                          //设置气泡的宽
                                                          width: chats[index]
                                                                      .backgroundIma !=
                                                                  null
                                                              ? 173.5
                                                              : null,
                                                          constraints:
                                                              BoxConstraints(
                                                            //设置气泡最大宽度
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
                                                                    ? Colors
                                                                        .white
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
                                    //红包，转账样式
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
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            //转账的数额
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
                                                              //红包字
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
                                                    //类型，转账或者红包
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
                    child: Image.asset(
                      //是否发语音模式
                      !isVoice
                          ? "assets/images/-138.png"
                          : "assets/images/--134.png",
                      width: 21.38,
                      height: 21.38,
                      package: packageName,
                    ),
                    onTap: () {
                      isVoice = !isVoice;
                      setState(() {});
                    },
                  ),
                  SizedBox(width: 6),
                  !isVoice
                      //文字模式
                      ? Container(
                          height: 34,
                          width: winWidth(context) - 128,
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 5, bottom: 12),
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none),
                            onChanged: (comm) {},
                          ),
                        )
                      //语音模式
                      : InkWell(
                          onLongPress: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 34,
                            width: winWidth(context) - 128,
                            decoration: BoxDecoration(
                              color: Color(0xFFffffff),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Text("按住说话"),
                          ),
                        ),
                  SizedBox(width: 10),
                  //表情
                  InkWell(
                    child: Image.asset("assets/images/-85.png",package: packageName),
                    onTap: () {},
                  ),
                  SizedBox(width: 4),
                  //更多
                  InkWell(
                    child: Image.asset("assets/images/-156.png",package: packageName),
                    onTap: () => action("发群红包"),
                  ),
                ],
              ),
            ),
          ],
        ),
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
