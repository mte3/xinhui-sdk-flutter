import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'find_recorded_pictures.dart';
import 'message_find_files.dart';
import 'message_find_video.dart';
import 'message_keyword_search.dart';

class SeekTakeNotes extends StatefulWidget {
  @override
  _SeekTakeNotesState createState() => _SeekTakeNotesState();
}

class _SeekTakeNotesState extends State<SeekTakeNotes> {
  TextEditingController seekController = TextEditingController();
  String controllerTitle = '';
  bool isNotShowIcon = false;
  bool isShowContext = false;
  String modelSubText;
  String modelSearchText = '';
  bool existence = false;

  @override
  Widget build(BuildContext context) {
    if (controllerTitle.isNotEmpty) {
      print("输入框传来的文字$controllerTitle");
      isNotShowIcon = true;
      isShowContext = true;
    }
    return Scaffold(
      appBar: NavigationBar(
        leadingType: 1,
        title: "查找聊天内容",
        rightDMActions: <Widget>[
          isNotShowIcon == true
              ? InkWell(
                  onTap: () => routePush(MessageKeywordSearchContext()),
                  child: Icon(
                    Icons.search,
                    size: 22,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                )
              : Container(),
          Space(),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SimpleInputBox(
              hitTitle: "请输入查找内容",
              date: (v) => setState(() => controllerTitle = v),
            ),
          ),
          isShowContext == false
              ? beforeSearching()
              : Column(
                  children: seekTakeNotesSearchModel.map(
                    (model) {
                      modelSubText = model.subText;
                      if (controllerTitle.isNotEmpty &&
                          modelSubText.contains(controllerTitle.toString())) {
                        print("包含输入文字的内容$modelSubText");
                        modelSearchText = modelSubText;
                        setState(() => existence = true);
                      }
                      return existence == true
                          ? ListTile(
                              leading: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: model.images,
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                model.text,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(153, 153, 153, 1),
                                ),
                              ),
                              subtitle: Text(modelSearchText),
                              trailing: Text(
                                model.trailingTime,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(205, 205, 205, 1),
                                ),
                              ),
                            )
                          : Center(
                              child: Text("暂不存在此聊天内容,请输入正确的关键字"),
                            );
                    },
                  ).toList(),
                ),
        ],
      ),
    );
  }

  Widget beforeSearching() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 33),
          alignment: Alignment.center,
          child: Text(
            '在以下选定内容中搜索',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(204, 204, 204, 1),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              title('图片', () => routePush(FindRecordedPictures())),
              VerticalLine(
                  width: 2,
                  height: 21,
                  color: Color.fromRGBO(204, 204, 204, 1)),
              title('视频', () => routePush(MessageFindVideo())),
              VerticalLine(
                  width: 2,
                  height: 21,
                  color: Color.fromRGBO(204, 204, 204, 1)),
              title('文件', () => routePush(MessageFindFiles())),
              VerticalLine(
                  width: 2,
                  height: 21,
                  color: Color.fromRGBO(204, 204, 204, 1)),
              title('链接', () {}),
            ],
          ),
        ),
      ],
    );
  }

  Widget title(String text, GestureTapCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: Text(
        text,
        style: TextStyle(color: Color.fromRGBO(36, 141, 212, 1), fontSize: 14),
      ),
    );
  }
}

class SeekTakeNotesSearch {
  final String images;
  final String text;
  final String subText;
  final String trailingTime;

  SeekTakeNotesSearch(
      {this.images, this.text, this.subText, this.trailingTime});
}

List<SeekTakeNotesSearch> seekTakeNotesSearchModel = <SeekTakeNotesSearch>[
  SeekTakeNotesSearch(
    images:
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2337756152,1867712973&fm=26&gp=0.jpg",
    text: "测试名字1",
    subText: "你好,你在干嘛",
    trailingTime: "今天",
  ),
  SeekTakeNotesSearch(
    images:
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2337756152,1867712973&fm=26&gp=0.jpg",
    text: "测试名字2",
    subText: "说啊,你在干嘛",
    trailingTime: "今天",
  ),
  SeekTakeNotesSearch(
    images:
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2337756152,1867712973&fm=26&gp=0.jpg",
    text: "测试名字3",
    subText: "哈哈哈哈哈哈",
    trailingTime: "昨天",
  ),
  SeekTakeNotesSearch(
    images:
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2337756152,1867712973&fm=26&gp=0.jpg",
    text: "测试名字4",
    subText: "你在干嘛",
    trailingTime: "2020/1/20",
  ),
  SeekTakeNotesSearch(
    images:
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2337756152,1867712973&fm=26&gp=0.jpg",
    text: "测试名字5",
    subText: "在干嘛",
    trailingTime: "2020/1/20",
  ),
];

///一个简单的输入框
class SimpleInputBox extends StatefulWidget {
  final String hitTitle;
  final Function date;

  SimpleInputBox({@required this.hitTitle, this.date});

  @override
  _SimpleInputBoxState createState() => _SimpleInputBoxState();
}

class _SimpleInputBoxState extends State<SimpleInputBox> {
  TextEditingController simpleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(238, 238, 238, 1),
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        onSubmitted: widget.date,
        cursorColor: Colors.grey,
        controller: simpleController,
        decoration: InputDecoration(
          hintText: widget.hitTitle,
          border: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 18,
              color: Color.fromRGBO(167, 167, 167, 1),
            ),
          ),
        ),
      ),
    );
  }
}
