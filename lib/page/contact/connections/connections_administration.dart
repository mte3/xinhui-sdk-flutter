import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/contact/other/opinion_limit.dart';
import 'package:jh_im_sdk/page/contact/other/user_qr_code.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/item/contact_item.dart';
import 'package:jh_im_sdk/widget_common/view/indicator_page_view.dart';

import '../../../widget_common/over_scroll_behavior_widget.dart';

class ConnectionsAdministration extends StatefulWidget {
  final String id;
  final String friendName;
  final String headPortrait;

  const ConnectionsAdministration(
      {@required this.id,
      this.friendName = "半口奶酪",
      this.headPortrait =
          "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3879425607,1637512239&fm=11&gp=0.jpg"});

  @override
  _ConnectionsAdministrationState createState() =>
      _ConnectionsAdministrationState();
}

class _ConnectionsAdministrationState extends State<ConnectionsAdministration> {
  List showItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    showItem = [
      [
        "举报该用户",
        "assets/images/contacts/report.png",
        () => Navigator.maybePop(context).then((e) => reportUser())
      ],
      [
        "加入黑名单",
        "assets/images/contacts/blacklist.png",
        () => Navigator.maybePop(context).then(
              (e) => confirmAlert(context, (v) {
                print(v);
              }, title: "确定拉黑该好友吗？", tips: "加入黑名单后，你将无法继续收到对方的资讯，且彼此无法查看主见更新"),
            )
      ],
      [
        "删除该用户",
        "assets/images/contacts/delete2.png",
        () => Navigator.maybePop(context).then((e) => confirmAlert(
            context, (v) {},
            title: "确定删除该好友吗？", tips: "(同时删除与好友的聊天记录)"))
      ]
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Image.asset(
            'assets/images/-1.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,
            package: packageName,
          ),
        ),
        title: Text(
          '基本信息',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => showDialog(
              context: context,
              child: GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: Material(
                  color: Colors.transparent,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: kToolbarHeight,
                        right: 16,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: showItem.map((i) {
                              return ShowItem(
                                imagePath: i[1],
                                text: i[0],
                                function: i[2],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            icon: Image.asset(
              'assets/images/-86.png',
              width: 20,
              height: 20,
              package: packageName,
            ),
          ),
        ],
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ///头像id位置
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(68 / 2),
                      child: Image.network(
                        widget.headPortrait,
                        width: 68,
                        height: 68,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.friendName,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/contacts/id.png",
                            width: 13,
                            height: 13,
                            fit: BoxFit.cover,
                            package: packageName,
                          ),
                          SizedBox(width: 2),
                          Text(
                            widget.id,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/contacts/position.png",
                            width: 13,
                            height: 13,
                            fit: BoxFit.cover,
                            package: packageName,
                          ),
                          SizedBox(width: 2),
                          Text(
                            "广东身-广州市",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Divider(),
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),

            buildItem(
                text: "设置备注和标签",
                widget: Image.asset(
                  "assets/images/-.png",
                  width: 9,
                  height: 14,
                  package: packageName,
                )),
            SizedBox(height: 12),
            buildItem(
                text: "主见详情",
                widget: Image.asset(
                  "assets/images/-.png",
                  width: 9,
                  height: 14,
                  package: packageName,
                )),
            buildItem(
                text: "权限设置",
                widget: Image.asset(
                  "assets/images/-.png",
                  width: 9,
                  height: 14,
                  package: packageName,
                )),
            buildItem(text: "生日日期", widget: Text("2020-03-10")),
            SizedBox(height: 12),
            buildItem(
                text: "二维码",
                widget: Container(
                  width: 40,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/contacts/erweima.png",
                        width: 17,
                        height: 17,
                        package: packageName,
                      ),
                      Space(),
                      Image.asset(
                        "assets/images/-.png",
                        width: 9,
                        height: 14,
                        package: packageName,
                      ),
                    ],
                  ),
                )),
            buildItem(
                text: "我的位置",
                widget: Image.asset(
                  "assets/images/-.png",
                  width: 9,
                  height: 14,
                  package: packageName,
                )),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: FlatButton(
                color: Colors.blue,
                onPressed: () {},
                child: Text(
                  "聊天",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem({String text, Widget widget}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      color: Colors.white,
      child: ListTile(
        onTap: () {
          switch (text) {
            case "设置备注和标签":
              break;
            case "主见详情":
              break;
            case "权限设置":
              routePush(OpinionLimit());
              break;
            case "生日日期":
              break;
            case "二维码":
              routePush(UserQRCode());
              break;
            case "我的位置":
              break;
            default:
              break;
          }
        },
        title: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        trailing: widget,
      ),
    );
  }

  reportUser() => showModalBottomSheet(
      context: context,
      builder: (BuildContext buildContext) {
        List reportItem = [
          {"reportType": "发布不适当内容", "isSelect": false},
          {"reportType": "发布色情内容", "isSelect": false},
          {"reportType": "发布违法违禁内容", "isSelect": false},
          {"reportType": "发布赌博内容", "isSelect": false},
          {"reportType": "发布政治造谣内容", "isSelect": false},
          {"reportType": "发布恐怖血腥内容", "isSelect": false},
          {"reportType": "存在诈骗行为", "isSelect": false},
          {"reportType": "存在侵权行为", "isSelect": false},
          {"reportType": "其他违规内容", "isSelect": false}
        ];
        Widget buildReportItem(state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: reportItem.map((item) {
              return GestureDetector(
                onTap: () {
                  state(() {
                    item["isSelect"] = !item["isSelect"];
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    item["reportType"].toString(),
                    style: TextStyle(
                      color: item["isSelect"] ? Colors.blue : Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }

        return StatefulBuilder(
          builder: (context1, state) {
            return Stack(
              children: <Widget>[
                Container(
                  height: 18,
                  width: double.infinity,
                  color: Colors.black54,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ScrollConfiguration(
                    behavior: OverScrollBehavior(),
                    child: SingleChildScrollView(
                      child: buildReportItem(state),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 15,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width - 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Material(
                          child: InkWell(
                            onTap: () => Navigator.maybePop(context),
                            child: Text("取消",
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "举报类型",
                          style: TextStyle(
                              color: Color.fromRGBO(102, 102, 102, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Material(
                          child: InkWell(
                            onTap: () {
                              for (int i = 0; i < reportItem.length; i++) {
                                if (reportItem[i]["isSelect"]) {
                                  print("举报了${reportItem[i]["reportType"]}");
                                  showToast(context, "⚠举报成功！");
                                }
                              }
                            },
                            child: Text(
                              "确定",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      });
}
