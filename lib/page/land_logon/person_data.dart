import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:intl/intl.dart';

import 'choose_city.dart';

class PersonData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PersonDataPage();
  }
}

class PersonDataPage extends State<PersonData> {
  DateTime nowDate = DateTime.now();

  _timePickers() {
    DatePicker.showDatePicker(
      context,
      /* 是否展示顶部操作按钮 */
      showTitleActions: true,
      /*  最小时间 */
      minTime: DateTime(1920, 1, 1),
      /*  最大时间 */
      maxTime: DateTime(2099, 6, 7),
      /* change事件 */
      onChanged: (date) {
        print('change $date');
        setState(() {
          nowDate = date;
        });
      },
      /* 确定事件 */
      onConfirm: (date) {
        print('confirm $date');
        setState(() {
          nowDate = date;
        });
      },
      /* 当前时间 */
      currentTime: DateTime.now(),
      /* 语言 */
      locale: LocaleType.zh,
      theme: DatePickerTheme(
        cancelStyle: TextStyle(
          fontSize: 16,
          color: Color(0xff333333),
        ),
        doneStyle: TextStyle(
          fontSize: 16,
          color: Color(0xff2D88FF),
        ),
      ),
    );
  }

  List title = [
    "姓名",
    "性别",
    "生日",
    "城市",
  ];
  List lastTitle = [
    "请输入姓名",
    "男",
    " ",
    "山东",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: 36.0,
              color: Color(0xff333333),
            ),
          ),
          title: Text(
            "个人资料",
            style: TextStyle(
              fontSize: 18.0,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 29.0, bottom: 56.0),
                  child: Center(
                    child: CircleAvatar(
                      radius: 36.0,
                      /* backgroundImage: AssetImage(

                    ), */
                    ),
                  ),
                ),
                Container(
                  height: 210,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index == 0 || index == 1) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 4.0),
                          height: 48.0,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xffF0F0F0),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  title[index],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  textAlign: TextAlign.end,
                                  decoration: InputDecoration(
                                    hintText: lastTitle[index],
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0xffCCCCCC),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (text) {
                                    print("chang : " +
                                        " ${title[index]} ==> $text");
                                  },
                                  /* 内容提交 */
                                  onSubmitted: (text) {
                                    print("submit : " +
                                        " ${title[index]} ==> $text");
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          margin: EdgeInsets.only(bottom: 4.0),
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xffF0F0F0),
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  title[index],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  if (index == 2) {
                                    print('点击了生日 ==》  时间选择');
                                    return _timePickers();
                                  } else if (index == 3) {
                                    print('点击了城市 ==》 城市选择');
                                    Navigator.push(context, MaterialPageRoute(builder: (content) => ChooseCity()));
                                  }
                                },
                                child: Text(
                                  (index == 2)
                                      ? DateFormat.y().format(nowDate) +
                                      '.' +
                                      DateFormat.M().format(nowDate) +
                                      '.' +
                                      DateFormat.d().format(nowDate)
                                      : lastTitle[3],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color(0xffCCCCCC),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    itemCount: title.length,
                  ),
                ),
                SizedBox(
                  height: 28.0,
                ),
                Container(
                  height: 44.0,
                  width: MediaQuery.of(context).size.width,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xff2D88FF),
                    onPressed: () {},
                    child: Text(
                      "确定",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xffF0F0F0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
