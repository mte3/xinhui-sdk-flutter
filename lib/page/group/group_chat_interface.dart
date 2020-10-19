import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/group/group_chat_other.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/Grid_chat.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
import 'group_search.dart';

class GroupChat extends StatefulWidget {
  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  bool isVoice = false;
  bool isMore = false;
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener((){
      if(myFocusNode.hasFocus){
        isMore = false;
        print('得到焦点');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '金惠前端(34)',
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
          new InkWell(
            onTap: () => routePush(new Search()),
            child: new SizedBox(
              width: 40,
              child: new UnconstrainedBox(
                child: new Image.asset(
                  'assets/images/msg/ic_search.png',
                  width: 17,
                  fit: BoxFit.cover,package: packageName,
                ),
              ),
            ),
          ),
          new InkWell(
            onTap: () => routePush(new GroupChatOther()),
            child: new SizedBox(
              width: 40,
              child: new Icon(
                CupertinoIcons.add_circled,
                color: Color(0xff333333),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
            height: 30,
            child: Row(
              children: <Widget>[
                Icon(Icons.ring_volume,size: 20,),
                Expanded(
                  child: MarqueeWidget(
                    text: '我是群公告，我可以滚动',
                    textStyle: new TextStyle(fontSize: 14.0),
                    scrollAxis: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top:28),
                  alignment: Alignment.center,
                  child: Text('新加入的小伙伴们，快来聊天吧！',
                    style: TextStyle(color: Color(0xff999999), fontSize: 14),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 28, bottom: 30),
                  alignment: Alignment.center,
                  child: Text(
                    '2020-08-09 23:00',
                    style: TextStyle(color: Color(0xff999999), fontSize: 14),
                  ),
                ),
                BubbleChatRight(
                  imageUrl: "assets/images/nopath---.png",
                  content: Text('剩下半口奶酪',
                      style: TextStyle(color: Colors.white, fontSize: 14.0)),
                ),
                BubbleChatLeft(
                  imageUrl: "assets/images/nopath---.png",
                  content: Text('很好！good!',
                      style:
                      TextStyle(color: Color(0xff666666), fontSize: 14.0)),
                ),
                BubbleChatRight(
                  imageUrl: "assets/images/nopath---.png",
                  content: Text('吃饭了没有啊',
                      style: TextStyle(color: Colors.white, fontSize: 14.0)),
                ),
                BubbleChatLeft(
                  imageUrl: "assets/images/nopath---.png",
                  content: Text('吃了',
                      style:
                      TextStyle(color: Color(0xff666666), fontSize: 14.0)),
                ),
                BubbleChatRight(
                  imageUrl: "assets/images/nopath---.png",
                  content: Text('吃屎了没有啊',
                      style: TextStyle(color: Colors.white, fontSize: 14.0)),
                ),
                BubbleChatLeft(
                  imageUrl: "assets/images/nopath---.png",
                  content: Text('吃了',
                      style:
                      TextStyle(color: Color(0xff666666), fontSize: 14.0)),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
          Container(
            height: isMore ? 270 : 49,
            padding: EdgeInsets.only(top: isMore ? 15 : 5),
            color: Colors.white,
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
//                 语音按钮
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                isVoice = !isVoice;
                                setState(() {});
                              },
                              child: Container(
                                width: 22,
                                height: 22,
                                child: Image.asset(
                                  isVoice
                                      ? "assets/images/-138.png"
                                      : "assets/images/--134.png",
                                  fit: BoxFit.cover,
                                  package: packageName,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // 输入框
                        Expanded(
                          flex: 8,
                          child: Align(
                              alignment: Alignment.center,
                              child: !isVoice
                                  ? Container(
                                height: 38,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5)),
                                ),
                                child: TextField(
                                  focusNode: myFocusNode,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 0, bottom: 5),
                                    fillColor: Color(0xFFF5F5F5),
                                    border: InputBorder.none,
                                  ),
                                ),
                              )
                                  : Container(
                                child: Container(
                                    width: double.infinity,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '按住说话',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF666666)),
                                      ),
                                    )),
                              )),
                        ),
                        // 表情
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                print('表情');
                              },
                              child: Container(
                                width: 22,
                                height: 22,
                                child: Image.asset(
                                  "assets/images/-85.png",
                                  fit: BoxFit.none,
                                  package: packageName,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // 更多
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                isMore = !isMore;
                                setState(() {
                                  myFocusNode.unfocus();
                                });
                              },
                              child: Container(
                                width: 22,
                                height: 22,
                                child: Image.asset(
                                  "assets/images/-156.png",
                                  fit: BoxFit.none,
                                  package: packageName,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Offstage(
                      offstage: !isMore,
                      child: Container(
                          height: 215,
                          width: MediaQuery.of(context).size.width,
                          child: GridPage(
                            children: _buildChildren(),
                            column: 4,
                            row: 2,
                          )),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

List<Widget> _buildChildren() {
  List<Widget> list = List();
  list = [
    ShowMoreWidget(
      imgUrl: 'assets/images/chat/-5859.png',
      text: '图片',
    ),
    ShowMoreWidget(imgUrl: 'assets/images/chat/camera.png', text: '拍摄'),
    ShowMoreWidget(
      imgUrl: 'assets/images/chat/video.png',
      text: '视频通话',
    ),
    ShowMoreWidget(
      imgUrl: 'assets/images/chat/location.png',
      text: '位置',
    ),
    ShowMoreWidget(
      imgUrl: 'assets/images/chat/file.png',
      text: '文件',
    ),
    ShowMoreWidget(
      imgUrl: 'assets/images/chat/redenvelopes.png',
      text: '红包',
    ),
    ShowMoreWidget(
      imgUrl: 'assets/images/chat/5870 (3).png',
      text: '转账',
    ),
    ShowMoreWidget(
      imgUrl: 'assets/images/chat/5870 (4).png',
      text: '好友',
    ),
    ShowMoreWidget(
      imgUrl: 'assets/images/chat/5870 (3).png',
      text: '转账',
    ),
    ShowMoreWidget(
      imgUrl: 'assets/images/chat/5870 (4).png',
      text: '好友',
    ),
  ];
  return list;
}


// 左边的气泡聊天
class BubbleChatLeft extends StatelessWidget {
  final BubbleStyle bubbleStyle;
  final String imageUrl;
  final Widget content;

  const BubbleChatLeft(
      {Key key,
        @required this.bubbleStyle,
        @required this.imageUrl,
        this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;
    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      padding: BubbleEdges.only(right: 15),
      margin: BubbleEdges.only(top: 8.0, right: 20.0),
      alignment: Alignment.topLeft,
    );
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 43,
              height: 43,
              margin: EdgeInsets.only(left: 16),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                package: packageName,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(6.0),
                child: Container(
                    alignment: Alignment.centerRight,
                    child: Bubble(
                      style: styleSomebody,
                      child: content,
                    ))),
          ],
        ),
        SizedBox(height: 18),
      ],
    );
  }
}

// 右边的气泡聊天
class BubbleChatRight extends StatelessWidget {
  final String imageUrl;
  final Widget content;

  BubbleChatRight(
      {Key key,
        @required this.imageUrl,
        @required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;
    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Color(0xFF2D88FF),
      elevation: 1 * px,
      padding: BubbleEdges.only(left: 15),
      margin: BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(6.0),
            child: Container(
                alignment: Alignment.centerRight,
                child: Bubble(
                  style: styleMe,
                  child: content,
                ))),
        Container(
          width: 43,
          height: 43,
          margin: EdgeInsets.only(right: 16),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            package: packageName,
          ),
        ),
      ],
    );
  }
}

class ShowMoreWidget extends StatelessWidget {
  final String imgUrl;
  final String text;

  const ShowMoreWidget({Key key, this.imgUrl, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 52,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Image.asset(imgUrl,
            package: packageName), Text(text)],
      ),
    );
  }
}

