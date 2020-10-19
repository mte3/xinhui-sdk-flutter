import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

import 'group_widget.dart';

///修改群名称
class SendDialog extends AlertDialog {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/4, left:MediaQuery.of(context).size.width/2-134),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              width: 268,
              height: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left:16,top: 16),
                    child: Text('发送至：',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 16, right: 16,left:16),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Image.asset('assets/images/5764.png',
                            package: packageName),
                      ),
                      Container(
                        child: Text('家族群',style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    ],
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                    height: 35,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 10),
                      margin: EdgeInsets.only(left:16,top: 16,right: 16,bottom: 12),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8)),
                    child:Text('[公众号名片]十一的公众号')
                  ),
                         Container(
                           padding: EdgeInsets.only(left: 10),
                           margin: EdgeInsets.only(left:16,right: 16,),
                           decoration: BoxDecoration(
                               color: Colors.black12,
                               borderRadius: BorderRadius.circular(8)),
                          height: 35,
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                fillColor: Colors.grey,
                                border: InputBorder.none,
                                hintText: '输入留言',
                                hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey)),
                          ),
                        ),
                  Expanded(child: Container(),),
                  Container(
                    width: 268,
                    height: 44,
                    child:Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: (){Navigator.pop(context);},
                            child: Container(
                                decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text('取消',style: TextStyle(fontSize: 16,color: Colors.blue),)),
                          ),
                        ),
                        Expanded(
                            flex: 1,child: GestureDetector(
                            onTap: (){Navigator.pop(context);},
                            child: Container(
                                decoration: BoxDecoration(
                                  color:Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text('确认',style: TextStyle(fontSize: 16,color:Colors.white),)))),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
