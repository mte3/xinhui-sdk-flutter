/*
*  我的我的钱包支付中心账单账单详情widget.dart
*  我的钱包
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class Billdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: NavigationBar(
          backgroundColor: Color(0xffFAFAFA),
          title: '账单详情',
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
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Image.network(
              'https://lanhu.oss-cn-beijing.aliyuncs.com/xd6bc57181-2ef4-42bc-9aca-efdf4ce55b39',
              height: 60,
              width: 60,
            ),
            SizedBox(
              height: 13,
            ),
            Text('转账-来自小明',style: TextStyle(color: Color.fromRGBO(102,102,102,1)),),
            SizedBox(height: 23,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                  'https://lanhu.oss-cn-beijing.aliyuncs.com/xdf29ccf1d-d020-47c7-88e5-8190bafa623e',
                  height: 28,
                  width: 28,
                ),
                SizedBox(
                  width: 9,
                ),
                Image.network(
                  'https://lanhu.oss-cn-beijing.aliyuncs.com/xd3e59eedb-f300-4004-a582-8a1747a2e1cd',
                  height: 28,
                  width: 28,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '1000',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
            SizedBox(
              height: 26,
            ),
            Container(height: 1,
            width:343 ,
            // color: Color.fromRGBO(240,240,240,1),),
            color: Colors.grey[300],),
            SizedBox(
              height: 28,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:16 ),
              child: Column(
                children: <Widget>[
                  Information(title1:'当前状态',title2: '已存入钱包',),
                  SizedBox(height: 9,),
                  Information(title1: '当前状态',title2: '好友转账',),
                  SizedBox(height: 9,),
                  Row(
                    children: <Widget>[
                      Information(title1: '转账时间',title2: '2020-04-01',),
                      SizedBox(width: 8,),
                      Text('21：54：44',style: TextStyle(fontSize: 16,color: Color.fromRGBO(153,153,153,1))),
                    ],
                  ),
                  SizedBox(height: 9,),
                  Row(
                    children: <Widget>[
                      Information(title1:'收款时间' ,title2:'2020-04-01' ,),
                      SizedBox(width: 8,),
                      Text('21：54：44',style: TextStyle(fontSize: 16,color: Color.fromRGBO(153,153,153,1))),
                    ],
                  ),
                  SizedBox(height: 9,),
                  Information(title1: '转账单号',title2: '12345685',),
                ],
              ),
            ),
          ],
        ));
  }
}

class Information extends StatelessWidget {
  final String title1;
final String title2;
  const Information({
    Key key, this.title1, this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(title1,style: TextStyle(fontSize: 16,color: Color.fromRGBO(153,153,153,1)),),
        SizedBox(width: 45,),
        Text(title2,style: TextStyle(fontSize: 16,color: Color.fromRGBO(153,153,153,1)),),
      ],
    );
  }
}
