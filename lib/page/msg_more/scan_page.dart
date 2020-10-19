/*
*  scan_page.dart
*  郑南婉-IM-讯息
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/msg_more/scan_add_page.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:jh_im_sdk/util/values/values.dart';

import 'scan_group_page.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  TextEditingController _outputController;
//  @override
//  void initState() {
//    super.initState();
//    //两秒后跳转页面
//    Future.delayed(Duration(seconds: 2), () {
//      pushReplacement(new ScanGroupPage());
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(title: '扫一扫'),
      body: InkWell(
        onTap: () {
          _scan();
        },
      ),
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    this._outputController.text = barcode;
  }
}
