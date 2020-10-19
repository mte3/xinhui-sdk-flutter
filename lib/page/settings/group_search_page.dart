import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/model/contact_info_model.dart';

import 'package:jh_im_sdk/util/tools.dart';

class GroupSearchPage extends StatefulWidget {
  @override
  _GroupSearchPageState createState() => _GroupSearchPageState();
}

class _GroupSearchPageState extends State<GroupSearchPage> {
  int _itemHeight = 60;
  int _suspensionHeight = 30;

  List<ContactInfoModel> _groups = [
    new ContactInfoModel(),
    new ContactInfoModel(),
    new ContactInfoModel(),
    new ContactInfoModel(),
    new ContactInfoModel(),
    new ContactInfoModel(),
  ];
  List<ContactInfoModel> _selects = List();

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
        Container(
          color: Colors.white,
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
                      border: model.name != _groups[_groups.length - 1].name
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
                _selects.add(model);
              } else {
                _selects.remove(model);
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
          new SmallButton(
            text: '确定',
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            margin: EdgeInsets.symmetric(vertical: 8.0),
            textStyle: TextStyle(fontSize: 12.0),
            onPressed: () => Navigator.of(context).pop(_selects),
          ),
          new Space(),
        ],
      ),
      body: new MainInputBody(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              color: Colors.white,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    height: 35,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: new Icon(CupertinoIcons.search),
                        ),
                        new Expanded(
                          child: new TextField(
                            style: TextStyle(
                                textBaseline: TextBaseline.alphabetic),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10),
                    child: new Wrap(
                      spacing: 5,
                      children: _selects.map((ContactInfoModel item) {
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
                  ),
                ],
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(left: 4, top: 6, bottom: 6),
              child: new Text('群组'),
            ),
            new Expanded(
              child: new ListView(
                children: _groups.map(_buildListItem).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
