import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';
import 'package:jh_im_sdk/widget_common/button/small_button.dart';

import 'official_account_model.dart';

class SearchOfficialAccount extends StatefulWidget {
  @override
  _SearchOfficialAccountState createState() => _SearchOfficialAccountState();
}

class _SearchOfficialAccountState extends State<SearchOfficialAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(title: "搜索公众号", leadingType: 1),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          children: <Widget>[
            SizedBox(height: 12),
            AddTextFieldAssembly(labelText:  "公众号",hitTitle: "请输入公众号名称"),
            SizedBox(height: 28),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 39),
              child: SmallButton(
                text: "确定",
                onPressed: () => routePush(OfficialAccountModel()),
                color: Color.fromRGBO(45, 136, 255, 1),
                pressedOpacity: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class AddTextFieldAssembly extends StatelessWidget {
  final String labelText;
  final String hitTitle;
  AddTextFieldAssembly({ this.labelText, this.hitTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 54,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23),
        child: TextField(
          textAlign: TextAlign.end,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            icon: Text(
             labelText,
              style: TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
            ),
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hitTitle,
            hintStyle: TextStyle(
                fontSize: 14, color: Color.fromRGBO(153, 153, 153, 1)),
          ),
        ),
      ),
    );
  }
}
