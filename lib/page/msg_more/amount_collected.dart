import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';


class AmountSetCollected extends StatefulWidget {
  @override
  _AmountSetCollectedState createState() => _AmountSetCollectedState();
}

class _AmountSetCollectedState extends State<AmountSetCollected> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(title: "设置金额", leadingType: 1),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  '收款金额',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(51, 51, 51, 1)),
                ),
              ),
              SizedBox(height: 13),
              Padding(
                padding: EdgeInsets.only(left: 11, right: 15),
                child: TextFormField(
                  cursorColor: Color.fromRGBO(51, 51, 51, 1),
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 1), fontSize: 30),
                  decoration: InputDecoration(
                    prefixIcon: Text(
                      "￥",
                      style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 1), fontSize: 30),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(51, 51, 51, 1))
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(51, 51, 51, 1))
                    )
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 11),
                child: Text('添加收款说明',
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1))),
              ),
              SizedBox(height: 38),
              SmallButton(text: "确定",onPressed: (){},color: Color.fromRGBO(45, 136, 255, 1)),
            ],
          ),
        ),
      ),
    );
  }
}
