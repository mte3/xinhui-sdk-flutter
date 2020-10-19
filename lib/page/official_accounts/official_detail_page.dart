import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/common/win_media.dart';
import 'package:jh_im_sdk/model/contact_info_model.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/official_bottom_detail.dart';
import 'package:jh_im_sdk/widget/official_detail_dialog.dart';
import 'package:jh_im_sdk/widget/official_top_detail.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

import 'official_account_recommendation.dart';
import 'official_account_settings.dart';
import 'official_accounts_page.dart';

class OfficialDetail extends StatelessWidget {
  final String title;
  final List publicModelList;
  final ContactInfoModel model;
  const OfficialDetail({Key key, this.title,this.publicModelList,this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: title,
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
          InkWell(
            onTap: () {
              showDialog(context: context, child: _showDialogDetail(context));
            },
            child: Container(
              width: 21,
              height: 21,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 15),
              child: Image.asset(
                "assets/images/-942.png",
                fit: BoxFit.none,package: packageName,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            // 公众号详情头部
            OfficialTopDetail(
              title: title,
              synopsis: '公众号简介公众号简介公众号简介公众号简介公众号简介公众号简介公众号简介公众号简介',
              imageUrl: 'assets/images/nopath----11.png',
              fansNum: 99,
              tweetsNum: 999,
            ),
            // 时间(未封装)
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 9),
              alignment: Alignment.center,
              child: Text(
                '2020-09-20  上午12：00',
                style: TextStyle(fontSize: 12, color: Color(0xFFCDCDCD)),
              ),
            ),
            // 公众号推文
            OfficialBottomDetail(
              title: '推文标题推文标题推文标题推文标题推文标题推文标题推文标题',
              imageUrl: 'assets/images/-8.png',
              subtitle: '推文标题推文标题推文标题推文标题推文标题推文标题推文标题',
            ),
            // 时间(未封装)
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 9),
              alignment: Alignment.center,
              child: Text(
                '2020-09-20  上午12：00',
                style: TextStyle(fontSize: 12, color: Color(0xFFCDCDCD)),
              ),
            ),
            // 公众号推文
            OfficialBottomDetail(
              title: '推文标题推文标题推文标题推文标题推文标题推文标题推文标题',
              imageUrl: 'assets/images/-8.png',
              subtitle: '推文标题推文标题推文标题推文标题推文标题推文标题推文标题',
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _showDialogDetail(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Positioned(
                top: winHeight(context) / 18,
                right: 16,
                child: Container(
                  child: Image.asset('assets/images/-6023.png',package: packageName),
                )),
            Positioned(
              top: winHeight(context) / 15,
              right: 25,
              child: Container(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: <Widget>[
                    OfficialDialog(
                      title: '打开',
                      imageUrl: 'assets/images/-5758.png',
                    ),
                    OfficialDialog(
                      title: '推荐',
                      imageUrl: 'assets/images/-5762.png',
                      onTap: () => routePush(OfficialAccountRecommendation()),
                    ),
                    OfficialDialog(
                      title: '置顶',
                      imageUrl: 'assets/images/-5765.png',
                    ),
                    OfficialDialog(
                      title: '设置',
                      imageUrl: 'assets/images/-5769.png',
                      onTap: () => routePush(OfficialAccountSettings()),
                    ),
                    OfficialDialog(
                      title: '投诉',
                      imageUrl: 'assets/images/-5770.png',
                      onTap: () {
                        Navigator.of(context).pop();
                        showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return _showBottomSheet();
                            });
                      },
                    ),
                    OfficialDialog(
                        title: '删除',
                        imageUrl: 'assets/images/-5715.png',
                        onTap: () {
                          confirmAlert(context, (v) {
                            if (v == false) {
                              Navigator.pop(context);
                            } else if (v == true) {
                               Notice.send(ShopActions.delPublicToListPublic(),OfficialAccount());
                               publicModelList.remove(model);
                            }
                          }, tips: "确定取消关注该公众号？");
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showBottomSheet() {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        children: <Widget>[
          showBottomSheetContent(title: '发布不适当内容'),
          showBottomSheetContent(title: '发布色情内容'),
          showBottomSheetContent(title: '发布违法违禁内容'),
          showBottomSheetContent(title: '发布赌博内容'),
          showBottomSheetContent(title: '发布政治造谣内容'),
          showBottomSheetContent(title: '发布暴恐血腥内容'),
          showBottomSheetContent(title: '发布色情内容'),
          showBottomSheetContent(title: '发布其他违规内容'),
          showBottomSheetContent(title: '存在欺诈骗钱行为'),
          showBottomSheetContent(title: '此账号可能被盗用'),
          showBottomSheetContent(title: '存在侵权行为'),
          showBottomSheetContent(title: '发布仿冒品信息'),
        ],
      ),
    );
  }
}

class showBottomSheetContent extends StatelessWidget {
  final String title;
  final Function onTap;

  const showBottomSheetContent({Key key, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                title,
                style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(
            indent: 15,
            endIndent: 15,
            height: 1,
          )
        ],
      ),
    );
  }
}
