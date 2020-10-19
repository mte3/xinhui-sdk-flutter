import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/group/share_code_dialog.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:toast/toast.dart';

class CodeGroup extends StatefulWidget {
  CodeGroup({Key key}) : super(key: key);

  @override
  _CodeGroupState createState() => _CodeGroupState();
}

class _CodeGroupState extends State<CodeGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "群二维码",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/images/-1.png', width: 20, height: 20,package: packageName),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),//去除水波
          shrinkWrap: true,
          children: <Widget>[
            Container(color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: 16,
                          ),
                          height: 57,
                          width: 57,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset('assets/images/5725.png'),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 31, left: 8),
                            child: Text(
                              '这是一个用户名称1',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: "PingFang SC",
                                  fontSize: 14,
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 24),
                          child: Image.asset(
                            'assets/images/5903.png',
                            width: 260,
                            height: 260,
                          ))),
                  Container(
                      margin: EdgeInsets.only(top: 40, bottom: 12),
                      child: Text(
                        '扫一扫上面的二维码，添加进群 ',
                        style: TextStyle(
                            fontFamily: "PingFang SC",
                            fontSize: 14,
                            color: Colors.grey),
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 108),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print('保存成功');
                    },
                    child: GestureDetector(
                      onTap: () => showToast("保存成功",gravity:Toast.BOTTOM),
                     
                        child: Container(
                          width: 140,
                          height: 44,
                          margin: EdgeInsets.only(left: 16, right: 16, bottom: 70),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "保存至相册",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "PingFang SC",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ), 
                      
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('分享');
                      showDialog(
                      context: context,
                      builder: (context) {
                        return ShareCodeDialog();
                      });
                    },
                 
                      child: Container(
                        width: 140,
                        height: 44,
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: 70),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 45, 136, 255),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "分享",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ), 
                    
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
