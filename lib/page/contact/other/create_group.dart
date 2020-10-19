import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  Color defaultColor = Colors.grey;
  double size = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            print("返回");
          },
          icon: Image.asset(
            'assets/images/-1.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,package: packageName,
          ),
        ),
        title: Text(
          '当面建群',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "面对面扫码进群",
                      style: TextStyle(color: defaultColor, fontSize: size),
                    ),
                  ),
                  Image.network(
                    ///todo:二维码
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587663624804&di=ef76b97a76d10dfb94e8415856871725&imgtype=0&src=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F01%2F42%2F52%2F49573d7f1e77c60.jpg",
                    width: 212,
                    height: 212,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "扫一扫上面的二维码图案，添加群聊",
                      style: TextStyle(color: defaultColor, fontSize: size),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  height: 50,
                  child: FlatButton(
                    color: Colors.white,
                    child: Text(
                      "保存至相册",
                      style: TextStyle(color: defaultColor, fontSize: size),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  height: 50,
                  child: FlatButton(
                    color: Colors.blue,
                    child: Text(
                      "分享二维码",
                      style: TextStyle(color: Colors.white, fontSize: size),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
