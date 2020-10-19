import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class QrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        leading: IconButton(
          onPressed: (){
          routePush(pop());
          },
          icon: Image.asset('assets/images/contacts/back.png',package: packageName),
        ),
        title: '二维码',
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, right: 17),
              padding: EdgeInsets.only(bottom: 16),
              width: winWidth(context),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/contacts/touxiang2.png',
                          width: 50,
                          height: 50,package: packageName,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Harry',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8,),
                        Image.asset('assets/images/contacts/sex-man.png',package: packageName)
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/contacts/erweima_big.png',
                      width: winWidth(context) * 0.6,package: packageName,
                    ),
                  ),
                  Center(
                      child: Text(
                    '扫一扫上面的二维码团，添加进群',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(153, 153, 153, 1)),
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: winWidth(context) * 0.08,
                left: winWidth(context) * 0.04,
                right: winWidth(context) * 0.04,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: SmallButton(
                      padding: EdgeInsets.all(0),
                      color: Colors.white,
                      text: '保存至相册',
                      textStyle: TextStyle(color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                  Space(),
                  Expanded(
                    child: SmallButton(
                      padding: EdgeInsets.all(0),
                      text: '分享',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
