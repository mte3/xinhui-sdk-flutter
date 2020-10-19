import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class Phopoupload extends StatefulWidget {
  @override
  _PhopouploadState createState() => _PhopouploadState();
}

class _PhopouploadState extends State<Phopoupload> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
          child: Scaffold(
        appBar: NavigationBar(
          backgroundColor: Color(0xffFAFAFA),
          title: '上传图片课件',
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
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '标题',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    height: 35,
                    width: 315,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(17, 26, 44, 0.04),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 24.0, color: Colors.black),
                      cursorColor: Colors.grey[500],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('正文'),
                  SizedBox(height: 2,),
                     Container(
                    height: 118,
                    width: 315,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(17, 26, 44, 0.04),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: TextField(
              
                      maxLines: 10,
                      autofocus: false, 
                      style: TextStyle(fontSize: 24.0, color: Colors.black),
                      cursorColor: Colors.grey[500],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                
                    ),  
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '上传文档课件',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  InkWell(
                                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 108,
                          width: 108,
                          color: Color.fromRGBO(235, 236, 236, 1),
                        ),
                        Positioned(
                          left: 36,
                          top: 37,
                          child: Image.network(
                            'https://lanhu.oss-cn-beijing.aliyuncs.com/xd5c56917d-a856-4a77-83c4-655ade26fd8c',
                            height: 28,
                            width: 32,
                          ),
                        ),
                      ],
                    ),
                    onTap: (){
                      print('上传图片课件');
                    },
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Center(
                    child: MaterialButton(
                        minWidth: 331,
                        height: 44,
                        color: Color.fromRGBO(45, 136, 255, 1),
                        child: Text(
                          '发布课件',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}