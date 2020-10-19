import 'package:flutter/material.dart';

class ChooseCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChooseCityPage();
  }
}

class ChooseCityPage extends State<ChooseCity> {
  List items = [
    "当前位置",
    "热门城市",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  var _padding = EdgeInsets.symmetric(horizontal: 22.0);

  List _listHotCity = [
    "北京",
    "上海",
    "广州",
    "深圳",
    "杭州",
    "成都",
    "重庆",
    "武汉",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
              itemBuilder: (content, index) {
                if (index == 0) {
                  return AppBar(
                    elevation: 0.0,
                    backgroundColor: Colors.white,
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
                      "城市",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff333333),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                  );
                } else if (index == 1) {
                  return Container(
                    padding: _padding,
                    color: Color(0xffFFFFFF),
                    height: 45.0,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.room,
                          color: Color(0xff2D88FF),
                          size: 24.0,
                        ),
                        Text(
                          "珠海",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xff333333),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (index == 2) {
                  return Container(
                    height: 59.0,
                    padding: _padding,
                    color: Color(0xffFFFFFF),
                    margin: EdgeInsets.only(top: 11.0, bottom: 14.0),
                    child: Wrap(
                      spacing: 36.0,
                      runSpacing: 7.0,
                      children: List.generate(_listHotCity.length, (index) {
                        return Container(
                          width: 56.0,
                          height: 26.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Color(0xffCCCCCC), width: 1.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              print("点击了" + _listHotCity[index]);
                            },
                            child: Text(
                              _listHotCity[index],
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Color(0xff333333),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                } else {
                  return Container(
                    height: 217.0,
                    color: Color(0xffFFFFFF),
                    padding: _padding,
                    margin: EdgeInsets.symmetric(vertical: 7.0),
                    child: Wrap(
                        runSpacing: 3.0,
                        children:
                        List.generate(_listHotCity.length - 2, (index) {
                          return Container(
                            width: 330.0,
                            height: 30.0,
                            margin: EdgeInsets.only(top: 5.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Color(0xffF0F0F0),
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                print("点击了" + _listHotCity[index]);
                              },
                              child: Text(
                                _listHotCity[index],
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xff333333),
                                ),
                              ),
                            ),
                          );
                        })),
                  );
                }
              },
              //分割线
              separatorBuilder: (content, index) {
                return Container(
                  height: 23.0,
                  color: Color(0xffCCCCCC),
                  padding: (index == 0 || index == 1) ? _padding : EdgeInsets.symmetric(horizontal: 22.0,vertical: 3.0),
                  child: Text(
                    items[index],
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
              itemCount: items.length + 1),
        ),
      ),
    );
  }
}
