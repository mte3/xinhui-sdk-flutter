import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class ChangeDepartment extends StatefulWidget {
  @override
  _ChangeDepartmentState createState() => _ChangeDepartmentState();
}

class _ChangeDepartmentState extends State<ChangeDepartment> {
  List<TestModel> data = [
    new TestModel(title: '人事部'),
    new TestModel(title: '财务部'),
    new TestModel(title: '技术部'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            routePush(pop());
          },
          icon: Image.asset('assets/images/contacts/back.png',
              package: packageName),
        ),
        title: Text(
          '更换部门',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Column(
              children: data.map((TestModel item) {
            return new FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  if (item.isSelect) {
                    return;
                  } else {
                    item.isSelect = true;
                  }
                  data.forEach((TestModel inItem) {
                    if (inItem.title != item.title) {
                      inItem.isSelect = false;
                    }
                  });
                  setState(() {});
                },
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(245, 245, 245, 1),
                        ))),
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      children: <Widget>[
                        Text(
                          item.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        item.isSelect
                            ? Image.asset(
                                'assets/images/commom/ic_tick.png',
                                width: 20,
                          package: packageName,
                              )
                            : Container(),
                        SizedBox(
                          width: 16,
                        )
                      ],
                    )));
          }).toList())
        ],
      ),
    );
  }
}

/// **************************************************************************
/// 来自金慧科技Json转Dart工具
/// **************************************************************************

class TestModel {
  final String title;
  bool isSelect;

  TestModel({
    this.title,
    this.isSelect = false,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);

  TestModel from(Map<String, dynamic> json) => _$TestModelFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}

TestModel _$TestModelFromJson(Map<String, dynamic> json) {
  return TestModel(
    title: json['title'],
  );
}
