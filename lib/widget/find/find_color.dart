import 'package:flutter/material.dart';

class TextColor extends StatelessWidget {
  String text2;
  String text3;
  TextColor({this.text2, this.text3});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: this.text2,
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            TextSpan(
              text: this.text3,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
