import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/chat_background.dart';
import 'package:jh_im_sdk/page/chat_details/chat_message.dart';
import 'package:jh_im_sdk/page/chat_details/chat_transactions.dart';
import 'package:jh_im_sdk/page/group/group_management.dart';
import 'package:jh_im_sdk/page/settings/chat_label_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/list_item_chatsetup.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class ChatSetUp extends StatelessWidget {
  TextEditingController textA = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '聊天信息',
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
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/nopath----11-3.png',
                          width: winWidth(context) / 8.3,
                          height: winHeight(context) / 18.04,package: packageName,
                        ),
                        SizedBox(
                          height: winHeight(context) / 162.4,
                        ),
                        Text(
                          '半口奶酪',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF666666)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/-5721.png',
                          width: winWidth(context) / 8.3,
                          height: winHeight(context) / 18.04,package: packageName,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '发起群聊',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF666666)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            LineWidget(),
            ListItem(
                title: '备注名',
                onTap: () {
                  _showRemarksDialog(context);
                },
                whatWidget: false,
                textColor: Color(0xFF666666)),
            ListItem(
                title: '标签',
                onTap: () => routePush(new ChatLable()),
                whatWidget: false,
                textColor: Color(0xFF666666)),
            LineWidget(),
            ListItem(
              onTap: ()=>routePush(new GroupManagement()),
                title: '聊天记录', whatWidget: false, textColor: Color(0xFF666666)),
            ListItem(
              title: '交易记录',
              onTap: () => routePush(new ChatTransactions()),
              textColor: Color(0xFF666666),
              whatWidget: false,
            ),
            LineWidget(),
            ListItem(
                title: '阅后即焚',
                onTap: () {},
                whatWidget: true,
                val: false,
                textColor: Color(0xFF666666)),
            ListItem(
                title: '置顶聊天',
                onTap: () {},
                whatWidget: true,
                val: false,
                textColor: Color(0xFF666666)),
            ListItem(
                title: '消息免打扰',
                onTap: () {},
                whatWidget: true,
                val: true,
                textColor: Color(0xFF666666)),
            LineWidget(),
            ListItem(
                title: '消息过期自动销毁',
                isShow: true,
                onTap: () => routePush(new ChatMessage()),
                whatWidget: false,
                textColor: Color(0xFF666666)),
            LineWidget(),
            ListItem(
                title: '当前聊天背景',
                onTap: () => routePush(new ChatBackground()),
                whatWidget: false,
                textColor: Color(0xFF666666)),
            LineWidget(),
            ListItem(
                title: '清空聊天记录',
                onTap: () {
                  confirmAlert(context, (v) {},
                      tips: '确定清空与该好友的聊天记录', okBtn: '确定', cancelBtn: '取消');
                },
                whatWidget: false,
                isShowIcon: false,
                textColor: Color(0xFF666666)),
            ListItem(
                title: '清空双方聊天记录',
                onTap: () {
                  confirmAlert(context, (v) {
                    print(v);
                  }, tips: '确定清空双方的聊天记录', okBtn: '确定', cancelBtn: '取消');
                },
                whatWidget: false,
                isShowIcon: false,
                textColor: Color(0xFF666666)),
          ],
        )),
      ),
    );
  }

  // 备注名弹框(带输入框)
  _showRemarksDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: MediaQuery.of(context).size.height / 3),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '修改备注',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0XFF666666),
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(
                            height: winHeight(context)/65,
                          ),
                          Container(
                            child: Expanded(
                              child: Material(
                                child: Container(
//                                  height: winHeight(context)/21,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8)), //边角为5
                                  ),
                                  child: TextField(
                                    controller: textA,
                                    style: TextStyle(fontSize: 14.0,
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
                                      hintText: '请输入备注名',
                                      filled: true,
                                      fillColor: Color(0xFFF5F5F5),
                                      contentPadding: const EdgeInsets.all(5),
                                      hintStyle: TextStyle(
                                          fontSize: 14.0,
                                          color: Color(0xFF999999)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Material(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Color(0xFFF5F5F5),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 21),
                                        child: Text(
                                          '取消',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0XFF666666),
                                              decoration: TextDecoration.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Color(0XFFF5F5F5),
                                  width: 2,
                                  height: 36,
                                ),
                                Expanded(
                                    child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      print('修改');
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      color: Color(0xFF2D88FF),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 21),
                                      child: Text(
                                        '修改',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
