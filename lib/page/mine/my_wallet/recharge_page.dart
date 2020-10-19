import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jh_im_sdk/util/tools.dart';

class RechargePage extends StatefulWidget {
  @override
  _RechargePageState createState() => _RechargePageState();
}

List<ButtonPageListModel> costData = [
  ButtonPageListModel(
    title: "20.00元",
    choose: false,
    height: 36,
    width: 75,
  ),
  ButtonPageListModel(
    title: "40.00元",
    choose: false,
    height: 36,
    width: 75,
  ),
  ButtonPageListModel(
    title: "60.00元",
    choose: true,
    height: 36,
    width: 75,
  ),
  ButtonPageListModel(
    title: "80.00元",
    choose: false,
    height: 36,
    width: 75,
  ),
  ButtonPageListModel(
    title: "100.00元",
    choose: false,
    height: 36,
    width: 75,
  ),
  ButtonPageListModel(
    title: "200.00元",
    choose: false,
    height: 36,
    width: 75,
  ),
  ButtonPageListModel(
    title: "400.00元",
    choose: false,
    height: 36,
    width: 75,
  ),
  ButtonPageListModel(
    title: "600.00元",
    choose: false,
    height: 36,
    width: 75,
  ),
];

class _RechargePageState extends State<RechargePage> {
  var data1, data2;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> _costList = [];
    for (var index in costData) {
      _costList.add(ButtonPageWidget(
        data: index,
        onTap: () {
          setState(() {
            for (var item in costData) {
              item.choose = false;
            }
            index.choose = true;
            data2 = index.title;
            controller.text =
                data2.toString().substring(0, data2.toString().indexOf("."));
            print(data2);
          });
        },
      ));
    }
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NavigationBar(
          backgroundColor: Color(0xffFAFAFA),
          title: '充值',
          leading: new InkWell(
            child: Container(
              width: 22,
              height: 22,
              child: Image.asset(
                "assets/images/-1.png",
                fit: BoxFit.none,
                package: packageName,
              ),
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ListView(children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '充值金额',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    Container(
                      width: 311,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Color.fromRGBO(240, 240, 240, 1),
                        )),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '¥',
                            style: TextStyle(fontSize: 28),
                          ),
                          Expanded(
                              child: Theme(
                            data: ThemeData(
                                primaryColor: Colors.black,
                                hintColor: Colors.black),
                            child: TextField(
                              controller: controller,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 30.0),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                fillColor: Colors.white, //输入框背景
                                filled: true,
                                border: InputBorder.none,
                                // hintText: '10.00',
                                // hintStyle: TextStyle(fontSize:30,color: Colors.black )
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: 26),
                    Container(
                      child: Wrap(
                        spacing: 15, //主轴上子控件的间距
                        runSpacing: 20, //交叉轴上子控件之间的间距
                        children: _costList,
                      ),
                    ),
                    SizedBox(
                      height: 33,
                    ),
                    MaterialButton(
                        color: Color.fromRGBO(4, 217, 25, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              'https://lanhu.oss-cn-beijing.aliyuncs.com/xd0318f0a4-7fa0-44f4-95ba-27869c3473b8',
                              height: 18,
                              width: 22,
                            ),
                            Text(
                              '微信支付',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: () {}),
                    MaterialButton(
                        color: Color.fromRGBO(2, 167, 240, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              'https://lanhu.oss-cn-beijing.aliyuncs.com/xd7c6918fe-ef2d-41f3-98e4-229f07cc8dd1',
                              height: 18,
                              width: 22,
                            ),
                            Text(
                              '支付宝支付',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            ])));
  }
}

class ButtonPageWidget extends StatefulWidget {
  final ButtonPageListModel data;
  final Function onTap;

  const ButtonPageWidget({
    Key key,
    this.onTap,
    this.data,
  }) : super(key: key);

  @override
  _ButtonPageWidgetState createState() => _ButtonPageWidgetState();
}

class _ButtonPageWidgetState extends State<ButtonPageWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.data.width,
        height: widget.data.height,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.blue),
          color: widget.data.choose ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: new Text(
          widget.data.title,
          style: TextStyle(
            color: widget.data.choose ? Colors.white : Colors.blue,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class ButtonPageListModel {
  final String title;
  final double height;
  final double width;
  bool choose;

  ButtonPageListModel({
    @required this.title,
    this.choose = false,
    this.width = 120.5,
    this.height = 32,
  });
}
