import 'package:flutter/material.dart';

class VideoCheckPage extends StatefulWidget {
  @override
  _VideoCheckPageState createState() => _VideoCheckPageState();
}

class _VideoCheckPageState extends State<VideoCheckPage> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width - 50,
      child: GestureDetector(
        onTap: () {
          setState(() {
            value = !value;
          });
        },
        child: Material(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      value
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 22.0,
                      color: Colors.blue,
                    ),
                  ),
                  Text("照相"),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      !value
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 22.0,
                      color: Colors.blue,
                    ),
                  ),
                  Text("相册"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
