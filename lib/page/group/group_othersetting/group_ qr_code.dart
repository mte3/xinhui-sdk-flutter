import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/group/group_othersetting/group_qr_share.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';
import 'package:jh_im_sdk/page/group/group_othersetting/toast.dart';


////群二维码
class GroupQRCode extends StatefulWidget {
  @override
  _GroupQRCodeState createState() => _GroupQRCodeState();
}
const String NETWORK_IMAGE =
    'https://p5.ssl.qhimgs1.com/bdr/326__/t01faa0569f68a773ff.jpg';

class _GroupQRCodeState extends State<GroupQRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '群二维码',
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
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
            margin: EdgeInsets.only(bottom: 100),
            child: Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundImage: new NetworkImage(NETWORK_IMAGE),
                    ),
                    SizedBox(width: 16,),
                    new Text('我是群昵称'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 24, 0, 24),
                  width: double.infinity,
                  height: 250,
                  child:Image.network('http://bpic.588ku.com/element_origin_min_pic/00/78/96/1056e2510fbb6f5.jpg',),
                ),
                Text('扫一扫上面的二维码，添加进群',style: TextStyle(color: Colors.grey,fontSize: 12),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 24,right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Center(
                      child: Text('保持至相册'),
                    ),
                  ),
                  onTap:(){
                    Toast.toast(context,msg: "保存成功 ",position: ToastPosition.bottom);
                  },
                ),
                GestureDetector(
                  onTap:(){
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Share();
                        });
                  },
                  child: Container(
                    width: 160,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Center(
                      child: Text('分享',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

