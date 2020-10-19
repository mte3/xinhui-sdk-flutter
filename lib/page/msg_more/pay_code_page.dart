/*
*  讯息付款码widget.dart
*  郑南婉-IM-讯息
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';
import 'package:nav_router/nav_router.dart';
import 'amount_collected.dart';
class PayCodePage extends StatefulWidget {
  @override
  _PayCodePageState createState() => _PayCodePageState();
}

class _PayCodePageState extends State<PayCodePage>
    with SingleTickerProviderStateMixin {
  TabController codeController;
  int numberCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numberCode=0;
    codeController = TabController(length: code.length, vsync: this);
  }

  List<Tab> code = <Tab>[
    Tab(text: "付款码", icon:Image.asset("assets/images/timg.jpg",width: 38,height: 38,
        package: packageName)),
    Tab(text: "收款码", icon:Image.asset("assets/images/timg.jpg",width: 38,height: 38,
        package: packageName)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
          title: numberCode == 0 ? '付款码' : "收款码", leadingType: 1),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: 480,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: codeController,
                children: [0, 1].map(
                      (view) {
                    return viewContext();
                  },
                ).toList(),
              ),
            ),
            SizedBox(height: 34),
            TabBar(
              controller: codeController,
              tabs: code,
              labelColor: Colors.black,
              unselectedLabelColor:Color.fromRGBO(153, 153, 153, 1),
              indicatorColor: Colors.transparent,
              onTap: (a) =>setState(() =>numberCode = a),
            ),
            SizedBox(height: 105),
            Container(
              width: 134,
              height: 5,
              decoration: BoxDecoration(
                color: AppColors.accentElement,
                borderRadius: Radii.k2pxRadius,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewContext() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://wapnewimg.uumtu.com/Thumb/2019/0408/f1958cbcd40803f92c307f2c27df4e5b.jpg'),
                  ),
                  numberCode==0?barCode():Container(),
                  Container(
                    width: 199,
                    height: 195,
                    margin: EdgeInsets.only(top: 24),
                    child: Image.asset("assets/images/timg.jpg",fit: BoxFit.cover,
                      package: packageName,),
                  ),
                  numberCode==1?Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 100,left: 35,right: 35),
                    child: Column(
                      children: <Widget>[
                        rowChoice("设置金额",()=>routePush(AmountSetCollected())),
                        Container(height: 1,color: Color.fromRGBO(205, 205, 205, 1)),
                        rowChoice("保存收款码",(){}),
                      ],
                    ),
                  ):Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget barCode(){
    return Column(
      children: <Widget>[
        Container(
          width: 263,
          height: 77,
          margin: EdgeInsets.only(top: 38),
          child: Image.network("https://img95.699pic.com/element/40125/8347.png_300.png",fit: BoxFit.cover)
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          child: Text(
            "付款数字码",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "PingFang SC",
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
  Widget rowChoice(String text,GestureTapCallback onTapRow){
    return  InkWell(
      onTap: onTapRow,
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(text,style: TextStyle(fontSize: 14,color: Color.fromRGBO(51, 51, 51, 1)),),
            Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    );
  }
}
