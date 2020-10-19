import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jh_im_sdk/util/tools.dart';

class ChatBackground extends StatefulWidget {
  @override
  _ChatBackgroundState createState() => _ChatBackgroundState();
}

class _ChatBackgroundState extends State<ChatBackground> {
  File _pic;

  Future getImage() async {
    var images = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
     _pic = images;
     print(_pic);
    });
  }

  Future getCamera() async {
    var pic = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
     _pic = pic;
     print(_pic);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '聊天背景',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: ListTile(
                onTap: (){
                  getImage();
                },
                title: Text('手机相册'),
                trailing: Image.asset('assets/images/-.png',
                    package: packageName),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                onTap: (){
                  getCamera();
                },
                title: Text('拍一张'),
                trailing: Image.asset('assets/images/-.png',
                    package: packageName),
              ),
            ),
            SizedBox(height: 12),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text('使用默认背景'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
