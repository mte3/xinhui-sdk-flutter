
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'group_widget.dart';

///修改群名称
class DesribeGroupDialog extends AlertDialog {
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
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/2, left: MediaQuery.of(context).size.width/2-134),
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
              height: 166,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text('修改描述',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    height: 40,
                    color: Colors.grey[200],
                    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: TextField(
                            
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          fillColor: Colors.grey,
                           border: InputBorder.none,
                          hintText: '群组描述',
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.grey)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('修改名称');
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 236,
                      height: 44,
                      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 45, 136, 255),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "确定",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "PingFang SC",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
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
