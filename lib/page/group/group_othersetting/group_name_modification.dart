import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class NameModification extends StatefulWidget {
  @override
  _NameModificationState createState() => _NameModificationState();
}

class _NameModificationState extends State<NameModification> {
  //Controller监听文本变化方法（1/3）
   TextEditingController textEditingController = new TextEditingController();

  //Controller监TextEditingController听文本变化方法（2/3）
//  @override
//  void dispose(){
//    TextEditingController.dispose();
//  }
  @override
  void initState() {
    textEditingController.addListener((){
      print("controller的监听方法："+textEditingController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '修改群名',
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
            padding:EdgeInsets.fromLTRB(16, 4, 16, 4),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('群组昵称'),
                Expanded(
                  child: Container(
                    child: TextField(
                      textAlign: TextAlign.end,
                      decoration: new InputDecoration(
                          hintText: '请输入群组昵称',
                          border: InputBorder.none),
                      controller: textEditingController,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(16, 24, 16, 0),
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
              child: Center(
                  child: Text('修改',
                    style: TextStyle(color: Colors.white),)
              ),
            ),
          )
        ],
      ),
    );
  }
}
