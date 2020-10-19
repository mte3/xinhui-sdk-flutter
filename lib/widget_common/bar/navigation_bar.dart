import 'package:flutter/cupertino.dart';

/// 创建者：王增阳
/// 开发者：王增阳
/// 版本：1.0
/// 创建日期：2020-02-12
///
/// AppBar封装
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class NavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const NavigationBar({
    this.title = '',
    this.showBackIcon = true,
    this.rightDMActions,
    this.backgroundColor = const Color(0xffFAFAFA),
    this.mainColor = const Color(0xFF212121),
    this.titleW,
    this.bottom,
    this.leading,
    this.isCenterTitle = true,
    this.iconColor = const Color(0xff707070),
    this.brightness = Brightness.light,
    this.automaticallyImplyLeading = true,
    this.icons = Icons.arrow_back_ios,
    this.leadingType = 0,
  });

  final int leadingType;
  final String title;
  final bool showBackIcon;
  final List<Widget> rightDMActions;
  final Color backgroundColor;
  final Color mainColor;
  final Widget titleW;
  final PreferredSizeWidget bottom;
  final Widget leading;
  final bool isCenterTitle;
  final Color iconColor;
  final Brightness brightness;
  final bool automaticallyImplyLeading;
  final IconData icons;

  @override
  Size get preferredSize => new Size(100, bottom != null ? 100 : 48);

  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: titleW == null
          ? new Text(
              title,
              style: new TextStyle(color: mainColor),
            )
          : titleW,
      backgroundColor: backgroundColor,
      elevation: 0.0,
      brightness: brightness,
      leading: leading == null
          ? showBackIcon
              ? new InkWell(
                  child: new Container(
                    width: 22,
                    height: 22,
                    margin: EdgeInsets.symmetric(vertical: 13),
//                      leadingType == 0
//                          ? Icon(icons, color: mainColor, size: 14):
                      child: Image.asset("assets/images/commom/ic_back.png",
                           color: iconColor,package: packageName,),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    Navigator.maybePop(context);
                  },
                )
              : null
          : leading,
      centerTitle: isCenterTitle,
      bottom: bottom != null ? bottom : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: rightDMActions ?? [new Center()],
    );
  }
}
