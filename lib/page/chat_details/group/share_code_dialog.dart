import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class ShareCodeDialog extends AlertDialog {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height-213, ),
            height: 192,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Container(
                padding:EdgeInsets.only(left:16),
                margin: EdgeInsets.only(top:12),
                child: Text('分享至',style: TextStyle(fontSize: 12,color:Colors.grey),),
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top:16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right:17),
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/6117.png',
                                  width: 54, height: 54,
                                  package: packageName),
                                  Text('微信',style: TextStyle(fontSize: 12,))
                            ],
                          )),
                      Container(margin: EdgeInsets.only(right:17),
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/6118.png',
                                  width: 54, height: 54,
                                  package: packageName),
                                  Text('朋友圈',style: TextStyle(fontSize: 12,))
                            ],
                          )),
                      Container(margin: EdgeInsets.only(right:17),
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/6119.png',
                                  width: 54, height: 54,
                                  package: packageName),
                                  Text('微博',style: TextStyle(fontSize: 12,))
                            ],
                          )),
                      Container(margin: EdgeInsets.only(right:17),
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/6120.png',
                                  width: 54, height: 54,
                                  package: packageName),
                                  Text('QQ',style: TextStyle(fontSize: 12,))
                            ],
                          )),
                      Container(
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/6121.png',
                                  width: 54, height: 54,
                                  package: packageName),
                                  Text('发送至好友',style: TextStyle(fontSize: 12,))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:24),
                height:1,
                color:Colors.grey,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: FlatButton(
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    child:Text('取消',style: TextStyle(fontSize: 16,))
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
