import 'dart:ffi';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/common/ui.dart';
import 'package:jh_im_sdk/model/contact_info_model.dart';
import 'package:jh_im_sdk/page/official_accounts/official_detail_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:nav_router/nav_router.dart';

class OfficialAccount extends StatefulWidget {
  @override
  _OfficialAccountState createState() => _OfficialAccountState();
}

class _OfficialAccountState extends State<OfficialAccount> {
  List<ContactInfoModel> _contacts = List();

  TextEditingController _searchController = TextEditingController();

  bool _searchFlag = true;
  bool _isTop = false; //是否置顶

  int _suspensionHeight = 30;
  int _itemHeight = 70;
  double _headHeight = 150;

  @override
  void initState() {
    super.initState();
    loadData();
    Notice.addListener(ShopActions.delPublicToListPublic(), (v) {
      popUntil(ModalRoute.withName(v.toString()));
    });
  }

  void loadData() {
    int letterIndex = 97;
    _contacts.add(ContactInfoModel(name: '哈赛king'));
    _contacts.add(ContactInfoModel(name: '浪里个浪'));
    for (int i = 0; i < 15; i++) {
      _contacts.add(
        ContactInfoModel(name: String.fromCharCode(letterIndex++) + '公众号'),
      );
    }
    _handleList(_contacts);
  }

  void _handleList(List<ContactInfoModel> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getShortPinyin(list[i].name)
          .substring(0, 1)
          .toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(pinyin)) {
        list[i].tagIndex = pinyin;
      } else {
        list[i].tagIndex = "#";
      }
    }
    //根据A-Z排序
    SuspensionUtil.sortListBySuspensionTag(list);
  }

  Widget _buildSusWidget(String susTag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: _suspensionHeight.toDouble(),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      color: Color(0xffF5F5F5),
      child: Text(
        '$susTag',
        textScaleFactor: 1.2,
        style: TextStyle(
          color: Color(0xff333333),
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildListItem(ContactInfoModel model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              _contacts.forEach((model) {
                model.isSelect = false;
              });
            });
          },
          child: Offstage(
            offstage: model.isShowSuspension != true,
            child: _buildSusWidget(susTag),
          ),
        ),
        _containerRow(model),
      ],
    );
  }

  Widget _containerRow(ContactInfoModel model) {
    return Container(
      color: Colors.white,
      height: _itemHeight.toDouble(),
      child: InkWell(
          child: new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              new CircleAvatar(
                radius: 25,
                child: Text(model.name[0]),
              ),
              new Space(),
              new Expanded(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: 30),
                  height: _itemHeight.toDouble(),
                  decoration: BoxDecoration(
                    border: !model.isShowSuspension
                        ? Border(top: BorderSide(color: lineColor))
                        : null,
                  ),
                  child: new Text(
                    model.name,
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
          onTap: () {
            routePush(new OfficialDetail(
              title: model.name,
              publicModelList: _contacts,
              model: model,
            ));
          }),
    );
  }

  //TODO : 搜索框，用户按下搜索按钮出现或隐藏搜索框
  Widget _searchBox() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF5F5F5),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      height: 56,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: new Icon(CupertinoIcons.search),
              ),
              new Expanded(
                child: new TextField(
                  controller: _searchController,
                  style: TextStyle(textBaseline: TextBaseline.alphabetic),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  //TODO : 按下清除图标，清空输入内容
                  setState(() {
                    _searchController.text = '';
                  });
                },
              ),
            ],
          ),
          Divider(height: 8.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        title: '公众号',
        rightDMActions: <Widget>[
          IconButton(
            icon: new Image.asset(
              'assets/images/msg/ic_search.png',
              width: 22.0,package: packageName,
            ),
            onPressed: () {
              setState(() {
                if (_searchFlag)
                  _searchFlag = false;
                else
                  _searchFlag = true;
                print(_searchFlag);
              });
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          //TODO : 根据isFlag显示或隐藏搜索框
          Offstage(
            offstage: _searchFlag,
            child: _searchBox(),
          ),
          Expanded(
            child: AzListView(
              data: _contacts,
              itemBuilder: (context, model) => _buildListItem(model),
              isUseRealIndex: true,
              itemHeight: _itemHeight,
              suspensionHeight: _suspensionHeight,
//              header : AzListViewHeader(
//
//              ),
              //TODO : 字母索引
              indexBarBuilder: (
                BuildContext context,
                List<String> tags,
                IndexBarTouchCallback onTouch,
              ) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: IndexBar(
                      data: tags,
                      itemHeight: 20,
                      textStyle: TextStyle(color: Colors.lightBlue),
                      onTouch: (details) => onTouch(details),
                    ),
                  ),
                );
              },
              //TODO : 长按字母索引提示
              indexHintBuilder: (context, hint) {
                return Container(
                  alignment: Alignment.center,
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.blue[700].withAlpha(200),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    hint,
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
