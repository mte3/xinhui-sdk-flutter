import 'package:flutter/material.dart';
import 'package:jh_im_sdk/model/contact_info_model.dart';
import 'package:jh_im_sdk/page/settings/group_search_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:azlistview/azlistview.dart';
import 'package:lpinyin/lpinyin.dart';
class GroupSendMsgPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _GroupSendMsgPageState();
  }
}

class _GroupSendMsgPageState extends State<GroupSendMsgPage> {
  List<ContactInfoModel> _contacts = List();

  int _suspensionHeight = 30;
  int _itemHeight = 60;
  double _headHeight = 150;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  List defItems = ['选择群组群发', '选择同事群发', '选择标签群发'];
  List<ContactInfoModel> selects = new List();

  void loadData() async {
    //加载联系人列表
    rootBundle.loadString('assets/data/contacts.json').then((value) {
      List list = json.decode(value);
      list.forEach((value) {
        _contacts.add(ContactInfoModel(name: value['name']));
      });
      _handleList(_contacts);
      setState(() {});
    });
  }

  void _handleList(List<ContactInfoModel> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
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
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildListItem(ContactInfoModel model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        SizedBox(
          height: _itemHeight.toDouble(),
          child: new InkWell(
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: mainSpace * 1.5),
                  child: new Image.asset(
                    'assets/images/commom/ic_${model.isSelect ? '' : 'un_'}select.png',
                    width: 20.0,package: packageName,
                  ),
                ),
                new CircleAvatar(
                  radius: 36 / 2,
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
                      style:
                          TextStyle(color: Color(0xff999999), fontSize: 14.0),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              model.isSelect = !model.isSelect;
              if (model.isSelect) {
                selects.add(model);
              } else {
                selects.remove(model);
              }
              if (listNoEmpty(selects)) {
                _headHeight = 50.0 * (selects.length / 5).ceil();
              } else {
                _headHeight = 150;
              }
              setState(() {});
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new NavigationBar(
        title: '群发消息',
        rightDMActions: <Widget>[
          new IconButton(
            icon: new Image.asset(
              'assets/images/msg/ic_search.png',
              width: 22.0,package: packageName,
            ),
            onPressed: () => routePush(new GroupSearchPage(), RouterType.fade),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: AzListView(
        data: _contacts,
        itemBuilder: (context, model) => _buildListItem(model),
        isUseRealIndex: true,
        itemHeight: _itemHeight,
        suspensionHeight: _suspensionHeight,
        header: AzListViewHeader(
          height: _headHeight.toInt(),
          builder: (context) {
            if (listNoEmpty(selects)) {
              return new Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: new Wrap(
                  spacing: 5,
                  children: selects.map((ContactInfoModel item) {
                    return new Container(
                      width: (winWidth(context) - 40) / 5,
                      height: 50.0,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            radius: 36 / 2,
                            child: Text(item.name[0]),
                          ),
                          new Space(width: mainSpace / 3),
                          new Expanded(
                            child: new Text(
                              '${item.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            } else {
              return new Column(
                children: defItems.map((item) {
                  return new FlatButton(
                    onPressed: () {},
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: new Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 0.1)),
                      ),
                      alignment: Alignment.centerLeft,
                      child: new Text(item),
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
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
                textStyle: TextStyle(color: Color(0xff2D88FF)),
                onTouch: (details) => onTouch(details),
              ),
            ),
          );
        },
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
    );
  }
}
