import 'package:flutter/material.dart';

class LabelChatWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  const LabelChatWidget({Key key,@required this.title,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: onTap,
        child: Chip(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          label: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF2D88FF),
        ),
      ),
    );
  }
}
