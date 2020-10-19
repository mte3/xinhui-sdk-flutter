import 'package:flutter/material.dart';

class BottomBtn extends StatelessWidget {
  final Color bgcolor;
  final Color TextColor;
  final String title;
  final Color BorderColor;
  final Function onTap;
  const BottomBtn(
      {Key key,
        this.bgcolor,
        this.TextColor,
        this.title,
        this.BorderColor = Colors.blue,
        this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height:44,
      decoration: BoxDecoration(
        border: Border.all(
            color: BorderColor, width: 1),
        color: bgcolor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: RawMaterialButton(
        onPressed: onTap,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          title,
          style: TextStyle(
              color: TextColor,
              fontSize: 17,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
