import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/common/win_media.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';
import 'package:jh_im_sdk/widget_common/button/small_button.dart';

class CopyNewGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: NavigationBar(
          backgroundColor: Colors.white,
          title: '一键复制新群',
          leading: new InkWell(
            child: Container(
              width: 22,
              height: 22,
              child: Image.asset(
                "assets/images/-1.png",
                fit: BoxFit.none,package: packageName,
              ),
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(
                      'assets/images/nopath----8.png',
                      height: winHeight(context)/5.6,
                      width: winWidth(context)/6.7,package: packageName,
                    ),
                  )),
              Text(
                '温馨提示:',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff999999),
                ),
              ),
              Text(
                '1、一键复制新群后，将生成一个群成员相同的新群；',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff999999),
                ),
              ),
              Text(
                '2、生成的新群，新成员在老群中的设置无法复制。',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff999999),
                ),
              ),
              SizedBox(height: winHeight(context)/12.6875,),
              SmallButton(
                onPressed: (){},
                minWidth: MediaQuery.of(context).size.width,
                disabledColor: Colors.blue,
                text:'确定',
              )
            ],
          ),
        ));
  }
}