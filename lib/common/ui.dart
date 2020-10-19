/// 创建者：王增阳
/// 开发者：王增阳
/// 版本：1.0
/// 创建日期：2020-02-13
///
/// 间隔和线UI
///
import 'package:flutter/material.dart';

/// 主间隔
double mainSpace = 10.0;

const lineColor = const Color(0xffF0F0F0);

/// 横线
class HorizontalLine extends StatelessWidget {
  final double height;
  final Color color;
  final double horizontal;

  HorizontalLine({
    this.height = 0.5,
    this.color = const Color(0xfff8f9f9),
    this.horizontal = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: height,
      color: color,
      margin: new EdgeInsets.symmetric(horizontal: horizontal),
    );
  }
}

/// 竖线
class VerticalLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double vertical;

  VerticalLine({
    this.width = 1.0,
    this.height = 25,
    this.color = const Color(0xff000000),
    this.vertical = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      color: Color(0xffDCE0E5),
      margin: new EdgeInsets.symmetric(vertical: vertical),
      height: height,
    );
  }
}

/// 间隔组件
class Space extends StatelessWidget {
  final double width;
  final double height;

  Space({this.width = 10.0, this.height = 10.0});

  @override
  Widget build(BuildContext context) {
    return new Container(width: width, height: height);
  }
}
