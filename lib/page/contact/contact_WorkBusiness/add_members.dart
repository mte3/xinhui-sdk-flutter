import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/model/contact_info_model.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:azlistview/azlistview.dart';

import 'package:lpinyin/lpinyin.dart';

class AddMembers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AddMembersState();
  }
}

class _AddMembersState extends State<AddMembers> {
  List<ContactInfoModel> _contacts = List();
  List<ContactInfoModel> _selectGroups = List();

  int _suspensionHeight = 30;
  int _itemHeight = 60;
  double _headHeight = 50;

  @override
  void initState() {
    super.initState();
    loadData();
  }


  List selects=['0'];
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
                    width: 20.0,
                    package: packageName,
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
               selects.insert(0, model);
              } else {
                selects.remove(model);
              }
              if (listNoEmpty(_selectGroups)) {
                _headHeight = 200;
              } else if (listNoEmpty(selects)) {
                _headHeight = 50.0 * (selects.length / 8).ceil();
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
        title: '添加成员',
        rightDMActions: <Widget>[
          new FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              if (!listNoEmpty(selects)) {
                showToast(context, '请选择要添加的成员');
              } else {
                routePush(pop());
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(45, 136, 255, 1),
                  borderRadius: BorderRadius.circular(8)),
              width: 60,
              height: 28,
              child: Center(
                  child: Text(
                '确定',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: AzListView(
              data: _contacts,
              itemBuilder: (context, model) => _buildListItem(model),
              isUseRealIndex: true,
              itemHeight: _itemHeight,
              suspensionHeight: _suspensionHeight,
              header: AzListViewHeader(
                height: _headHeight.toInt(),
                builder: (context) {
                  return Container(
                    margin: EdgeInsets.only(top: 5,left: 16),
                    child: new Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.start,
                      children: selects.map((item) {
                        if (item =='0') {
                          return new Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.centerLeft,
                              child: Image.asset('assets/images/contacts/addmenbers_search.png',package: packageName)
                          );
                        }
                        else{
                          return new CircleAvatar(
                            radius: 20,
                            child: new Text(item.name[0]),
                          );
                        }
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
