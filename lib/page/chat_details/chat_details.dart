import 'dart:io';

import 'package:bubble/bubble.dart';
import 'package:extended_text_field/extended_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jh_im_sdk/page/chat_details/text_field/MyExtendedMaterialTextSelectionControls.dart';
import 'package:jh_im_sdk/page/chat_details/text_field/MySpecialTextSpanBuilde.dart';
import 'package:jh_im_sdk/page/chat_details/text_field/emoji_text.dart' as emoji;
import 'package:jh_im_sdk/page/chat_details/text_field/toggel_emoji_button.dart';
import 'package:jh_im_sdk/page/settings/chat_setup_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/Grid_chat.dart';

//import 'package:flutter_candies_demo_library/flutter_candies_demo_library.dart'
//    hide MySpecialTextSpanBuilder;
class ChatDetailsPage extends StatefulWidget {
  @override
  _ChatDetailsPageState createState() => _ChatDetailsPageState();
}

class _ChatDetailsPageState extends State<ChatDetailsPage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '半块奶酪',
        leading: new InkWell(
          child: Container(
            width: 22,
            height: 22,
            child: Image.asset(
              "assets/images/-1.png",
              fit: BoxFit.none,
              package: packageName,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        rightDMActions: <Widget>[
          InkWell(
            onTap: () => routePush(new ChatSetUp()),
            child: Container(
              width: 21,
              height: 21,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 15),
              child: Image.asset(
                "assets/images/-942.png",
                fit: BoxFit.none,
                package: packageName,
              ),
            ),
          )
        ],
      ),
      body: MainInputBody(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                reverse: true,
                controller: _scrollController,
                shrinkWrap: true,
                children: [
                  BubbleChatLeft(
                    imageUrl: "assets/images/nopath---.png",
                    content: InkWell(
                      onTap: () {
                        print('名片');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 4, right: 8),
                                  width: 34,
                                  height: 34,
                                  child: Image.asset(
                                    "assets/images/nopath.png",
                                    color: Color(0xff666666),
                                    fit: BoxFit.cover,
                                    package: packageName,
                                  ),
                                ),
                                Text(
                                  '半杯蜂蜜',
                                  style: TextStyle(
                                    fontFamily: "PingFang SC",
                                    fontSize: 14,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: winWidth(context) / 1.9,
                            height: 1,
                            color: Color(0xff066666).withOpacity(0.1),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 6.0, left: 4),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '个人名片',
                              style: TextStyle(
                                fontFamily: "PingFang SC",
                                fontSize: 12,
                                color: Color(0xff999999),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BubbleChatLeft(
                    imageUrl: "assets/images/nopath---.png",
                    content: InkWell(
                      onTap: () {
                        print('名片');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 4, right: 8),
                                  width: 34,
                                  height: 34,
                                  child: Image.asset(
                                    "assets/images/nopath.png",
                                    color: Color(0xff666666),
                                    fit: BoxFit.cover,
                                    package: packageName,
                                  ),
                                ),
                                Text(
                                  '半杯蜂蜜',
                                  style: TextStyle(
                                    fontFamily: "PingFang SC",
                                    fontSize: 14,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: winWidth(context) / 1.9,
                            height: 1,
                            color: Color(0xff066666).withOpacity(0.1),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 6.0, left: 4),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '个人名片',
                              style: TextStyle(
                                fontFamily: "PingFang SC",
                                fontSize: 12,
                                color: Color(0xff999999),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BubbleChatLeft(
                    imageUrl: "assets/images/nopath---.png",
                    content: InkWell(
                      onTap: () {
                        print('名片');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 4, right: 8),
                                  width: 34,
                                  height: 34,
                                  child: Image.asset(
                                    "assets/images/nopath.png",
                                    color: Color(0xff666666),
                                    fit: BoxFit.cover,
                                    package: packageName,
                                  ),
                                ),
                                Text(
                                  '半杯蜂蜜',
                                  style: TextStyle(
                                    fontFamily: "PingFang SC",
                                    fontSize: 14,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: winWidth(context) / 1.9,
                            height: 1,
                            color: Color(0xff066666).withOpacity(0.1),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 6.0, left: 4),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '个人名片',
                              style: TextStyle(
                                fontFamily: "PingFang SC",
                                fontSize: 12,
                                color: Color(0xff999999),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
//                   名片
                  BubbleChatLeft(
                    imageUrl: "assets/images/nopath---.png",
                    content: InkWell(
                      onTap: () {
                        print('名片');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 4, right: 8),
                                  width: 34,
                                  height: 34,
                                  child: Image.asset(
                                    "assets/images/nopath.png",
                                    color: Color(0xff666666),
                                    fit: BoxFit.cover,
                                    package: packageName,
                                  ),
                                ),
                                Text(
                                  '半杯蜂蜜',
                                  style: TextStyle(
                                    fontFamily: "PingFang SC",
                                    fontSize: 14,
                                    color: Color(0xff666666),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: winWidth(context) / 1.9,
                            height: 1,
                            color: Color(0xff066666).withOpacity(0.1),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 6.0, left: 4),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '个人名片',
                              style: TextStyle(
                                fontFamily: "PingFang SC",
                                fontSize: 12,
                                color: Color(0xff999999),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 28, bottom: 30),
                    alignment: Alignment.center,
                    child: Text(
                      '2020-08-19 09:00',
                      style: TextStyle(color: Color(0xff999999), fontSize: 14),
                    ),
                  ),
                  BubbleChatLeft(
                    imageUrl: "assets/images/nopath---.png",
                    content: Text('很好！good!',
                        style: TextStyle(
                            color: Color(0xff666666), fontSize: 14.0)),
                  ),
                  BubbleChatLeft(
                    imageUrl: "assets/images/nopath---.png",
                    content: InkWell(
                      onTap: () {
                        // todo 视频时长
                        print('视频时长');
                      },
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 8),
                            child: Image.asset(
                              "assets/images/-105.png",
                              color: Color(0xff666666),
                              fit: BoxFit.cover,
                              package: packageName,
                            ),
                          ),
                          Text(
                            '视频时长：98:09',
                            style: TextStyle(
                              fontFamily: "PingFang SC",
                              fontSize: 14,
                              color: Color(0xff666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BubbleChatLeft(
                    imageUrl: "assets/images/nopath---.png",
                    content: InkWell(
                      onTap: () {
                        // todo 通话时长
                        print('通话时长');
                      },
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 8),
                            child: Image.asset(
                              "assets/images/-882.png",
                              width: 18,
                              height: 9,
                              color: Color(0xff666666),
                              fit: BoxFit.cover,
                              package: packageName,
                            ),
                          ),
                          Text(
                            '通话时长：98:09',
                            style: TextStyle(
                              fontFamily: "PingFang SC",
                              fontSize: 14,
                              color: Color(0xff666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BubbleChatRight(
                    imageUrl: "assets/images/nopath---.png",
                    content: Text('剩下半口奶酪',
                        style: TextStyle(color: Colors.white, fontSize: 14.0)),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 28, bottom: 30),
                    alignment: Alignment.center,
                    child: Text(
                      '2020-08-09 23:00',
                      style: TextStyle(color: Color(0xff999999), fontSize: 14),
                    ),
                  ),
                  Container(
//                    padding: EdgeInsets.only(top: 28),
                    alignment: Alignment.center,
                    child: Text(
                      '新加入的小伙伴，快来聊天吧!',
                      style: TextStyle(color: Color(0xff999999), fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            FullInputBox(scrollController: _scrollController),
          ],
        ),
      ),
    );
  }
}

// 左边的气泡聊天
class BubbleChatLeft extends StatelessWidget {
//  final BubbleStyle bubbleStyle;
  final String imageUrl;
  final Widget content;

  const BubbleChatLeft(
      {Key key,
//      @required this.bubbleStyle,
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
              width: winWidth(context) / 8.7,
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
                    width: winWidth(context) / 1.9,
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

  BubbleChatRight({Key key, @required this.imageUrl, @required this.content})
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
                width: winWidth(context) / 1.9,
                alignment: Alignment.centerRight,
                child: Bubble(
                  style: styleMe,
                  child: content,
                ))),
        Container(
          margin: EdgeInsets.only(right: 16),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: winWidth(context) / 8.7,
            package: packageName,
          ),
        ),
      ],
    );
  }
}

// 展开更多里面的小图标加文字
class ShowMoreWidget extends StatelessWidget {
  final String imgUrl;
  final String text;
  final Function onTap;

  const ShowMoreWidget({Key key, this.imgUrl, this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: winWidth(context) / 6.25,
      height: winHeight(context) / 15.6,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imgUrl, package: packageName),
            Text(text)
          ],
        ),
      ),
    );
  }
}

class FullInputBox extends StatefulWidget {
  final ScrollController scrollController;

  FullInputBox({@required this.scrollController});

  @override
  _FullInputBoxState createState() => _FullInputBoxState();
}

class _FullInputBoxState extends State<FullInputBox> {
  bool isMore = false;
  bool isVoice = false;
  FocusNode myFocusNode;
  File _pic;
  TextEditingController _textEditingController = TextEditingController();
  MyExtendedMaterialTextSelectionControls
      _myExtendedMaterialTextSelectionControls =
      MyExtendedMaterialTextSelectionControls();
  final GlobalKey _key = GlobalKey();
  List<String> sessions = <String>[];
  bool activeEmojiGird = false;

  bool get showCustomKeyBoard => activeEmojiGird;

  Future getImage() async {
    var images = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pic = images;
      print(_pic);
    });
  }

  Future getCamera() async {
    var pic = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _pic = pic;
      print(_pic);
    });
  }

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        widget.scrollController.jumpTo(0.0);
        isMore = false;
        activeEmojiGird = false;
      }
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  // 更多
  List<Widget> _buildChildren() {
    List<Widget> list = List();
    list = [
      ShowMoreWidget(
        onTap: () {
          getImage();
        },
        imgUrl: 'assets/images/chat/-5859.png',
        text: '图片',
      ),
      ShowMoreWidget(
          onTap: () {
            getCamera();
          },
          imgUrl: 'assets/images/chat/camera.png',
          text: '拍摄'),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMore || activeEmojiGird ? winHeight(context) / 2.5 : 58,
      padding: EdgeInsets.only(top: isMore || activeEmojiGird ? 15 : 5),
      color: Colors.white,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: <Widget>[
            Row(
              children: [
//                 语音按钮
                Expanded(
                  flex: 2,
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
                // 输入框ai
                Expanded(
                  flex: 11,
                  child: Align(
                      alignment: Alignment.center,
                      child: !isVoice
                          ? Container(
//                        height: winHeight(context)/20,
                            child: ExtendedTextField(
                                key: _key,
                                specialTextSpanBuilder: MySpecialTextSpanBuilder(
                                  showAtBackground: true,
                                ),
                                controller: _textEditingController,
                                textSelectionControls:
                                    _myExtendedMaterialTextSelectionControls,
                                maxLines: null,
                                focusNode: myFocusNode,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF5F5F5),

                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          sessions.insert(
                                              0, _textEditingController.text);
                                          _textEditingController.value =
                                              _textEditingController.value
                                                  .copyWith(
                                                      text: "",
                                                      selection:
                                                          TextSelection.collapsed(
                                                              offset: 0),
                                                      composing: TextRange.empty);
                                        });
                                      },
                                      child: Icon(Icons.send),
                                    ),
                                    contentPadding: EdgeInsets.all(12.0)),
                                //textDirection: TextDirection.rtl,
                              ),
                          )
                          : Container(
                              child: Container(
                                  width: winWidth(context),
                                  height: winHeight(context) / 21.36,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5F5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '按住说话',
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Color(0xFF666666)),
                                    ),
                                  )),
                            )),
                ),
                // 表情
                Expanded(
                  flex: 2,
                  child: Container(
//                    padding: EdgeInsets.only(right: 8),
                    child: ToggleButton(
                      activeWidget: Container(
                        width: winWidth(context) / 14.31,
                        child: Image.asset(
                          "assets/images/-85.png",
                          fit: BoxFit.none,
                          package: packageName,
                          color: Colors.indigo,
                        ),
                      ),
                      unActiveWidget: Container(
                        width: winWidth(context) / 14.31,
                        child: Image.asset(
                          "assets/images/-85.png",
                          fit: BoxFit.none,
                          package: packageName,
                        ),
                      ),
                      activeChanged: (bool active) {
                        print(active);
                        Function change = () {
                          setState(() {
                            if (active) {
                              myFocusNode.unfocus();
                              isMore = false;
                            }
                            activeEmojiGird = active;
                          });
                        };
                        update(change);
                      },
                      active: activeEmojiGird,
                    ),
                  ),
                ),
                // 更多
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(right: 5),
                    child: InkWell(
                      onTap: () {
                        isMore = !isMore;
                        setState(() {
                          activeEmojiGird = false;
                          myFocusNode.unfocus();
                        });
                      },
                      child: Container(
                        width: winWidth(context) / 14.31,
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
                  height: winHeight(context) / 3.11,
                  width: winWidth(context),
                  child: GridPage(
                    children: _buildChildren(),
                    column: 4,
                    row: 2,
                  )),
            ),
            Offstage(
              offstage: !activeEmojiGird,
              child: Container(height: 250, child: buildCustomKeyBoard()),
            )
          ],
        ),
      ),
    );
  }

  void update(Function change) {
    if (showCustomKeyBoard) {
      change();
    } else {
      SystemChannels.textInput.invokeMethod('TextInput.hide').whenComplete(() {
        Future.delayed(Duration(milliseconds: 200)).whenComplete(() {
          change();
        });
      });
    }
  }

  Widget buildCustomKeyBoard() {
    if (!showCustomKeyBoard) return Container();
    if (activeEmojiGird) return buildEmojiGird();

    return Container();
  }

  Widget buildEmojiGird() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Image.asset(
            emoji.EmojiUitl.instance.emojiMap["[${index + 1}]"],
            package: packageName,
          ),
          behavior: HitTestBehavior.translucent,
          onTap: () {
            insertText("[${index + 1}]");
          },
        );
      },
      itemCount: emoji.EmojiUitl.instance.emojiMap.length,
      padding: EdgeInsets.all(5.0),
    );
  }

  void insertText(String text) {
    var value = _textEditingController.value;
    var start = value.selection.baseOffset;
    var end = value.selection.extentOffset;
    if (value.selection.isValid) {
      String newText = "";
      if (value.selection.isCollapsed) {
        if (end > 0) {
          newText += value.text.substring(0, end);
        }
        newText += text;
        if (value.text.length > end) {
          newText += value.text.substring(end, value.text.length);
        }
      } else {
        newText = value.text.replaceRange(start, end, text);
        end = start;
      }

      _textEditingController.value = value.copyWith(
          text: newText,
          selection: value.selection.copyWith(
              baseOffset: end + text.length, extentOffset: end + text.length));
    } else {
      _textEditingController.value = TextEditingValue(
          text: text,
          selection:
              TextSelection.fromPosition(TextPosition(offset: text.length)));
    }
  }
}
