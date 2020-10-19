import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String title;
  final Function onTap;
  final bool whatWidget;
  final bool isShow;
  final bool isShowIcon;
  final Color textColor;
  bool val;

  ListItem(
      {this.title,
      this.onTap,
      this.whatWidget,
      this.val,
      this.isShow = false,
      this.isShowIcon = true,
      this.textColor});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onTap,
      child: Container(
        color: Colors.white,
        height: 46,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(fontSize: 16, color: widget.textColor),
            ),
            Spacer(),
            Offstage(
              offstage: !widget.isShow,
              child: Text(
                '永久',
                style: TextStyle(fontSize: 12, color: widget.textColor),
              ),
            ),
            widget.whatWidget
                ? CupertinoSwitch(
                    activeColor: Color(0xFF2D88FF),
                    value: widget.val,
                    onChanged: (v) {
                      setState(() {
                        widget.val = v;
                      });
                      widget.val == true ? print('开启') : print('关闭');
                    },
                  )
                : widget.isShowIcon
                    ? Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                      )
                    : Container()
          ],
        ),
      ),
    );
  }
}

///间隔组件
class LineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: MediaQuery.of(context).size.width,
      color: Color(0xfff5f5f5),
    );
  }
}
