import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vido extends AlertDialog {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Center(
            child: Container(
              width: 282,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
              ),
              child: Column(
              
                children: <Widget>[
                 Expanded (
                                      child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.videocam),
                          Text('视频会议',style: TextStyle(color: Color.fromRGBO(153,153,153,1)),),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Color.fromRGBO(240,240,240,1),
                  ),
                   Expanded(
                                      child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.audiotrack),
                          Text('音频会议',style: TextStyle(color: Color.fromRGBO(153,153,153,1)),),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  Container(
                    height: 1,
                      color: Color.fromRGBO(240,240,240,1),
                  ),
                   Expanded(
                                      child: InkWell(
                      child: Center(
                        child: Text(
                          '取消',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
