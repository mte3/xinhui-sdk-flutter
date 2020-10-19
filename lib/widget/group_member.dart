import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class MemberItem extends StatefulWidget {
  final String url;
  final String userName;
  final bool val;
  final bool isShowBox;
  final Function onTap;

  MemberItem(
      {this.url, this.userName, this.val, this.onTap, this.isShowBox = true});

  @override
  _MemberItemState createState() => _MemberItemState();
}

class _MemberItemState extends State<MemberItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: <Widget>[
                Image.asset(
                  widget.url,
                  width: winWidth(context) / 8,
                  height: winHeight(context) / 20,
                  package: packageName,
                ),
                SizedBox(
                  width: winWidth(context) / 39.375,
                ),
                Text(widget.userName),
                Spacer(),
                widget.isShowBox
                    ? InkWell(
                        child: Container(
                          width: winWidth(context) / 17.04,
                          height: winHeight(context) / 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: widget.val ? Colors.blue : Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.6)),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  (winHeight(context) / 30) / 2))),
                          child: widget.val
                              ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18,
                                )
                              : null,
                        ),
                        onTap: () {
                          setState(() {
                            widget.onTap();
                          });
                        },
                      )
                    : Spacer()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 1,
            color: Color(0xFFF0F0F0),
          )
        ],
      ),
    );
  }
}
