import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

/// 创建者：王增阳
/// 开发者：王增阳
/// 版本：1.0
/// 创建日期：2020-02-15
class NoDataView extends StatefulWidget {
  final String label;
  final VoidCallback onRefresh;

  NoDataView({
    this.label = '暂无数据',
    this.onRefresh,
  });

  NoDataViewState createState() => NoDataViewState();
}

class NoDataViewState extends State<NoDataView> {
  bool isWay = false;

  @override
  Widget build(BuildContext context) {
    var label = widget.label;
    return Container(
      height: 320,
      color: Colors.white,
      width: winWidth(context),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset(
            THEME_IMAGE_URL + 'ic_no_data.png',
            width: 33.0,package: packageName,
          ),
          new Space(height: mainSpace * 1.5),
          new Text(
            label,
            style: TextStyle(
              color: Color(0xff11152B).withOpacity(0.7),
              fontSize: 14.0,
            ),
          ),
          new Space(height: mainSpace * 1.5),
          new Visibility(
            visible: widget.onRefresh != null,
            child: isWay
                ? new CircularProgressIndicator()
                : new FlatButton(
                    onPressed: () => handle(),
                    child: new Text('重新加载'),
                  ),
          )
        ],
      ),
    );
  }

  handle() {
    widget.onRefresh();

    setState(() {
      isWay = true;
    });
    new Future.delayed(new Duration(seconds: 2), () {}).then((v) {
      setState(() {
        isWay = false;
      });
    });
  }
}
