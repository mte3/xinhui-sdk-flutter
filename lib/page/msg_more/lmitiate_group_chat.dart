import 'package:flutter/material.dart';
import 'package:jh_im_sdk/model/contact_info_model.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:azlistview/azlistview.dart';
import 'package:lpinyin/lpinyin.dart';

import 'message_group_chat.dart';

class InitiateGroupChat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InitiateGroupChatState();
  }
}

class _InitiateGroupChatState extends State<InitiateGroupChat> {
  List<ContactInfoModel> _contacts = List();
  List<ContactInfoModel> _contactsSearch = List();

  int _suspensionHeight = 30;
  int _itemHeight = 60;
  double _headHeight = 150;
  TextEditingController inputController = TextEditingController();
  TextEditingController groupController = TextEditingController();
  TextEditingController groupDescription = TextEditingController();
  int selectedQuantity; //选择的联系人数量
  @override
  void initState() {
    super.initState();
    loadData();
  }

  List selects = ['0'];
  bool isShow = false;
  bool isShowCityBeen = false;

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
    String queryName;
    if (inputController.text.isNotEmpty &&
        model.name.contains(inputController.text)) {
      queryName = model.name;
    } else if (!model.name.contains(inputController.text)) {
      queryName = '';
    }
    return inputController.text == ""
        ? listContext(model)
        : Column(
            children: <Widget>[
              queryName.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        model.isSelect = !model.isSelect;
                        if (model.isSelect) {
                          selects.insert(0, model);
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
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: mainSpace * 1.5),
                            child: new Image.asset(
                              'assets/images/commom/ic_${model.isSelect ? '' : 'un_'}select.png',
                              width: 20.0,
                              package: packageName,
                            ),
                          ),
                          new CircleAvatar(
                            radius: 45 / 2,
                            child: Text(queryName[0]),
                          ),
                          Space(),
                          Text(queryName),
                        ],
                      ),
                    )
                  : Container()
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new NavigationBar(
        titleW: isShow == true
            ? Container(
                height: 32,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 236, 236, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: inputController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 14,
                      color: Color.fromRGBO(167, 167, 167, 1),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              )
            : null,
        title: isShow == false ? '选择群成员' : '',
        rightDMActions: <Widget>[
          SmallButton(
            text: '确定',
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            textStyle: TextStyle(fontSize: 12.0),
            onPressed: () {
              selectedQuantity == 0
                  ? showToast(context, "请选择好友")
                  : showDialog(
                      context: context,
                      builder: (context) {
                        return Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 39),
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 38),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 56,
                                        child: Center(
                                          child: Text(
                                            "创建群组",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    51, 51, 51, 1),
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                      materialTextFile("群组名称", groupController),
                                      SizedBox(height: 16),
                                      materialTextFile(
                                          "群组描述", groupDescription),
                                      SizedBox(height: 35),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 39),
                                  width: MediaQuery.of(context).size.width,
                                  child: SmallButton(
                                    text: "确定",
                                    onPressed: (){
                                      if(groupController.text.isNotEmpty){
                                        routePush(
                                          GroupChat(
                                            groupName: groupController.text,
                                            number: selectedQuantity,
                                          ),
                                        );
                                      }else{
                                        showToast(context, '请输入群组名称');
                                      }
                                    }
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
          new Space(),
        ],
      ),
      backgroundColor: Colors.white,
      body: MainInputBody(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children: selects.map(
                  (item) {
                    selectedQuantity = selects.length;
                    if (item == '0') {
                      return isShow == false && isShowCityBeen == false
                          ? InkWell(
                              onTap: () => setState(() => isShow = true),
                              child: CircleAvatar(
                                radius: (winWidth(context) - 80) / 14,
                                backgroundColor:
                                    Color.fromRGBO(242, 242, 242, 1),
                                child: Icon(
                                  Icons.search,
                                  color: Color.fromRGBO(51, 51, 51, 1),
                                ),
                              ),
                            )
                          : Container();
                    }
                    return new CircleAvatar(
                      radius: 20,
                      child: new Text(item.name[0]),
                    );
                  },
                ).toList(),
              ),
            ),
            AzListView(
              data: _contacts,
              itemBuilder: (context, model) => _buildListItem(model),
              isUseRealIndex: true,
              itemHeight: _itemHeight,
              suspensionHeight: _suspensionHeight,
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
                      textStyle: TextStyle(
                        color: Color.fromRGBO(102, 102, 102, 1),
                      ),
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
          ],
        ),
      ),
    );
  }

  Widget listContext(ContactInfoModel listModel) {
    String susTag = listModel.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: listModel.isShowSuspension != true,
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
                    'assets/images/commom/ic_${listModel.isSelect ? '' : 'un_'}select.png',
                    width: 20.0,
                    package: packageName,
                  ),
                ),
                new CircleAvatar(
                  radius: 45 / 2,
                  child: Text(listModel.name[0]),
                ),
                new Space(),
                new Expanded(
                  child: new Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(right: 30),
                    height: _itemHeight.toDouble(),
                    decoration: BoxDecoration(
                      border: !listModel.isShowSuspension
                          ? Border(top: BorderSide(color: lineColor))
                          : null,
                    ),
                    child: new Text(
                      listModel.name,
                      style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 1), fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              listModel.isSelect = !listModel.isSelect;
              if (listModel.isSelect) {
                selects.insert(0, listModel);
              } else {
                selects.remove(listModel);
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

  Widget materialTextFile(String text, TextEditingController controller) {
    return Container(
      height: 36,
      color: Color.fromRGBO(236, 236, 236, 1),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
