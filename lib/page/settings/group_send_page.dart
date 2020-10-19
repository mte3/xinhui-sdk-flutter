import 'package:flutter/material.dart';
import 'package:jh_im_sdk/model/contact_info_model.dart';

import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/settings/person_card.dart';

class GroupSendPage extends StatefulWidget {
  final List<ContactInfoModel> selects;
  final List<ContactInfoModel> groups;

  GroupSendPage(this.selects, this.groups);

  @override
  _GroupSendPageState createState() => _GroupSendPageState();
}

class _GroupSendPageState extends State<GroupSendPage> {
  List<ContactInfoModel> _data = List();

  @override
  void initState() {
    super.initState();
    _data.addAll(widget.selects);
    _data.addAll(widget.groups);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new NavigationBar(title: '群发消息'),
      backgroundColor: Colors.white,
      body: new MainInputBody(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: new Container(
                padding: EdgeInsets.all(10),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      '你将发消息给${_data.length}位朋友',
                      style:
                          TextStyle(color: Color(0xff999999), fontSize: 14.0),
                    ),
                    new Space(),
                    new Expanded(
                      child: new SingleChildScrollView(
                        child: new Wrap(
                          spacing: 5,
                          children: _data.map((ContactInfoModel item) {
                            return PersonCard(item.name);
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.all(10),
              height: 40.0,
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff999999)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: new TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.0)),
                      ),
                    ),
                  ),
                  new Space(width: mainSpace / 2),
                  new InkWell(
                    child: new Container(
                      width: 40,
                      alignment: Alignment.center,
                      child: new Image.asset(
                        'assets/images/commom/ic_send.png',
                        width: 25.0,package: packageName,
                      ),
                    ),
                    onTap: () {
                      showToast(context, '敬请期待');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
