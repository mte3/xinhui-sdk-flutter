import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

void confirmAlert<T>(
  BuildContext context,
  VoidCallbackConfirm callBack, {
  String tips,
  String okBtn,
  String cancelBtn,
  String title,
}) {
  showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      if (!strNoEmpty(okBtn)) okBtn = '确定';
      if (!strNoEmpty(cancelBtn)) cancelBtn = '取消';
      TextStyle _style(Color color) {
        return TextStyle(color: color, fontSize: 16.0);
      }

      return CupertinoAlertDialog(
        title: title == null
            ? Container()
            : Text(title,
                style: TextStyle(color: Color(0xff666666), fontSize: 18)),
        content: new Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            '$tips',
            style: TextStyle(color: Color(0xff333333), fontSize: 18),
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 13.5),
            child: new Text('$cancelBtn', style: _style(Color(0xff007AFF))),
            onPressed: () {
              Navigator.pop(context);
              callBack(false);
            },
          ),
          new FlatButton(
            color: Color(0xff2D88FF),
            padding: EdgeInsets.symmetric(vertical: 13.5),
            child: new Text('$okBtn', style: _style(Colors.white)),
            onPressed: () {
              Navigator.pop(context);
              callBack(true);
            },
          ),
        ],
      );
    },
  );
}
