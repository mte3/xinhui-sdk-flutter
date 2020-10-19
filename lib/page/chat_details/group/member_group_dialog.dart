

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'group_widget.dart';

class MemberGroupDialog extends AlertDialog {
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
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/2, ),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: 268,
                      height: 96,
                      color:Colors.white,
                      child: Text('确认将其移除群组',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                    Container(

                      width: 267.5,
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
                                  child: Text('取消',style: TextStyle(fontSize: 16,),)),
                            ),
                          ),
                          Expanded(
                              flex: 1,child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => GroupWidget()),
                                );
                              },
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
    );
  }
}
