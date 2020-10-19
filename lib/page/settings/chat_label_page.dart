import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/settings/label_chat.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class ChatLable extends StatefulWidget {
  @override
  _ChatLableState createState() => _ChatLableState();
}

class _ChatLableState extends State<ChatLable> {
  String labelText;
  List lableList = ['家人', '同事'];
  TextEditingController _textA = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '标签',
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
          SmallButton(
            margin: EdgeInsets.only(right: 15, top: 10, bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            pressedOpacity: 1,
            onPressed: () {},
            text: '完成',
            textStyle: TextStyle(fontSize: 12),
          )
        ],
      ),
      body: MainInputBody(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: 15, left: 15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Container(
                        height: winHeight(context) / 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(8)), //边角为5
                        ),
                        child: TextField(
                          controller: _textA,
                          onChanged: (v) {
                            labelText = v;
                            setState(() {});
                          },
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              /*边角*/
                              borderRadius: BorderRadius.all(
                                Radius.circular(5), //边角为5
                              ),
                              borderSide: BorderSide(
                                color: Color(0XFFEEEEEE), //边线颜色为白色
                                width: 1, //边线宽度为2
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0XFFEEEEEE), //边框颜色为白色
                                width: 1, //宽度为5
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5), //边角为30
                              ),
                            ),
                            hintText: '输入标签',
                            filled: true,
                            fillColor: Color(0xFFF5F5F5),
                            contentPadding: const EdgeInsets.all(5),
                            hintStyle: TextStyle(
                                fontSize: 14.0, color: Color(0xFF999999)),
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        print('添加');
                        setState(() {
                          if (strNoEmpty(labelText)) {
                            lableList.forEach((item) {
                              if (item == labelText) {
                                labelText = '';
                                return showToast(context, '已有相同的标签');
                              }
                            });
                          } else {
                            return showToast(context, '标签不能为空');
                          }
                          if (strNoEmpty(labelText)) {
                            lableList.add(labelText);
                          }
                        });
                        _textA.text = '';
                        labelText = '';
                      },
                      child: Center(
                          child: Text(
                        '添加',
                        style:
                            TextStyle(color: Color(0xFF666666), fontSize: 14),
                      )),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: lableList.map((item) {
                    return LabelChatWidget(
                        onTap: () {
                          print(item);
                        },
                        title: item);
                  }).toList())
            ],
          ),
        ),
      ),
    );
  }
}
