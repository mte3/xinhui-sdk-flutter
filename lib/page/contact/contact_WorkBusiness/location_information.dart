import 'package:flutter/material.dart';
import 'package:jh_im_sdk/common/win_media.dart';
import 'package:jh_im_sdk/util/tools.dart';

class LocationInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              routePush(pop());
            },
            icon: Image.asset(
              'assets/images/-1.png',package: packageName,
            ),
          ),
          title: Text(
            '位置信息',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromRGBO(240, 240, 240, 1),
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              'assets/images/contacts/ditu.png',
              width: winWidth(context),
              fit: BoxFit.fitWidth,package: packageName,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '广东科学技术职业学院3号实训楼',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        '广东省珠海市金湾区红旗镇珠海大道65号',
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: <Widget>[
                      Image.asset('assets/images/contacts/location.png',package: packageName),
                      Text('定位'),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Image.asset('assets/images/contacts/map.png',
                          package: packageName),
                      Text('地图'),
                    ],
                  ),

                ],
              ),
            )
          ],
        ));
  }
}
