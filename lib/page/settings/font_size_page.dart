import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/flutter/my_slider.dart';

class FontSizePage extends StatefulWidget {
  @override
  _FontSizePageState createState() => _FontSizePageState();
}

class _FontSizePageState extends State<FontSizePage> {
  double value = 16;
  String text = '拖动下面的滑块，可设置字体大小';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new NavigationBar(
        title: '字体',
        rightDMActions: <Widget>[
//          new InkWell(
//            child: new Container(
//              alignment: Alignment.center,
//              padding: EdgeInsets.symmetric(horizontal: 10.0),
//              child: new Text(
//                '保存',
//                style: TextStyle(color: Colors.blue),
//              ),
//            ),
//            onTap: () {
//              this.value = value;
//              setState(() {});
//            },
//          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new CircleAvatar(radius: 25,
                    backgroundImage: NetworkImage(NETWORK_IMAGE),
                  ),
                  new Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(left: 10.0),
                    width: value <= 16 ? null : (winWidth(context) - 70) - 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      text,
                      maxLines: 99,
                      style: TextStyle(fontSize: value),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            height: winWidth(context) * 0.3,
            alignment: Alignment.center,
            color: Colors.white,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 150 * 2.0,
                  margin: EdgeInsets.only(bottom: 10.0),
                  padding: EdgeInsets.only(left: 72 - 20.0),
                  child: new Text('标准'),
                ),
                new MySlider(
                  value: value,
                  max: 41,
                  min: 8,
                  divisions: 5,
                  onChanged: (value) {
                    setState(() => this.value = value);
                  },
                ),
              ],
            ),
          ),
          new Container(height: 10.0, color: Colors.white),
        ],
      ),
    );
  }
}
