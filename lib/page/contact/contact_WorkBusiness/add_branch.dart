import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

import 'contact_button.dart';

class AddBranch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '添加分部',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            routePush(pop());
          },
          icon: Image.asset('assets/images/contacts/back.png',package: packageName),
        ),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              textAlign: TextAlign.end,
              decoration: new InputDecoration(
                  contentPadding: EdgeInsets.only(top: 15, right: 16),
                  prefixIcon: Container(
                    margin: EdgeInsets.only(top: 15, left: 15, bottom: 0),
                    child: Text(
                      '分部名称',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  prefixStyle: TextStyle(color: Colors.black, fontSize: 14),
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "请输入分部名称",
                  hintStyle: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1), fontSize: 14)),
            ),
            SizedBox(
              height: 32,
            ),
            BottomBtn(
              bgcolor: Color(0xFF2D88FF),
              TextColor: Colors.white,
              title: '添加',
              BorderColor: Colors.transparent,
              onTap: () {
                routePush(pop());
                print("添加分部");
              },
            ),
          ],
        ),
      ),
    );
  }
}
