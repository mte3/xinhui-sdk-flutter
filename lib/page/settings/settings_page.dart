import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/settings/change_pw_page.dart';
import 'package:jh_im_sdk/page/settings/exterior_page.dart';
import 'package:jh_im_sdk/page/settings/font_size_page.dart';
import 'package:jh_im_sdk/page/settings/group_send_msg_page.dart';
import 'package:jh_im_sdk/page/settings/privacy_page.dart';
import 'package:jh_im_sdk/page/settings/safety_page.dart';
import 'package:jh_im_sdk/page/settings/set_lang_page.dart';
import 'package:jh_im_sdk/util/tools.dart';

class SettingsItem extends StatelessWidget {
  final String label;
  final String subLabel;
  final Widget rightW;
  final bool isBorder;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  SettingsItem({
    @required this.label,
    this.subLabel = '',
    this.rightW,
    this.isBorder = true,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(vertical: 15.0),
  });

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      color: Colors.white,
      disabledColor: Colors.white,
      child: new Container(
        padding: padding,
        decoration: BoxDecoration(
          border: isBorder
              ? Border(bottom: BorderSide(color: Colors.grey, width: 0.3))
              : null,
        ),
        child: new Row(
          children: <Widget>[
            new Text(
              label,
              style: TextStyle(
                color: Color(0xff333333),
                fontSize: 14.0,
              ),
            ),
            new Spacer(),
            new Text(
              '$subLabel',
              style: TextStyle(
                color: Color(0xff333333).withOpacity(0.7),
                fontSize: 13.0,
              ),
            ),
            new Space(),
            rightW != null
                ? rightW
                : new Image.asset(
                    'assets/images/mine/label_right.png',
                    width: 8.0,package: packageName,
                  )
          ],
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    action(name) {
      switch (name) {
        case '修改密码':
          routePush(new ChangePwPage());
          break;
        case '外观':
          routePush(new ExteriorPage());
          break;
        case '安全':
          routePush(new SafetyPage());
          break;
        case '群组资讯':
          routePush(new GroupSendMsgPage());
          break;
        case '语言':
          routePush(new SetLangPage());
          break;
        case '隐私':
          routePush(new PrivacyPage());
          break;
        case '清空所有资讯':
          confirmAlert(
            context,
            (v) {
              if (!v) return;
            },
            tips: '确定清空所有聊天记录',
          );
          break;
        case '字体':
          routePush(new FontSizePage());
          break;
      }
    }

    return Scaffold(
      appBar: new NavigationBar(title: '设置', leadingType: 1),
      body: new ListView(
        children: <Widget>[
          new SettingsItem(
            label: '清除缓存',
            subLabel: '114.05k',
            onPressed: () => action('清除缓存'),
          ),
          new SettingsItem(
            label: '清空所有资讯',
            onPressed: () => action('清空所有资讯'),
          ),
          new SettingsItem(
            label: '资讯管理',
            isBorder: false,
            onPressed: () => action('资讯管理'),
          ),
          new Space(),
          new SettingsItem(
            label: '修改密码',
            isBorder: false,
            onPressed: () => action('修改密码'),
          ),
          new Space(),
          new SettingsItem(
            label: '语言',
            onPressed: () => action('语言'),
          ),
          new SettingsItem(
            label: '外观',
            isBorder: false,
            onPressed: () => action('外观'),
          ),
          new Space(),
          new SettingsItem(
            label: '字体',
            onPressed: () => action('字体'),
          ),
          new SettingsItem(
            label: '群组资讯',
            isBorder: false,
            onPressed: () => action('群组资讯'),
          ),
          new Space(),
          new SettingsItem(
            label: '隐私',
            onPressed: () => action('隐私'),
          ),
          new SettingsItem(
            label: '安全',
            isBorder: false,
            onPressed: () => action('安全'),
          ),
          new SettingsItem(
            label: '允许退出IM后收到资讯',
            rightW: new Image.asset(
              'assets/images/mine/check_have.png',
              width: 20.0,package: packageName,
            ),
            onPressed: () => action('允许退出IM后收到资讯'),
          ),
          new Container(
            child: new Space(height: 40),
            color: Colors.white,
          ),
          new Container(
            child: new SmallButton(
              text: '退出当前账号',
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              onPressed: () => action('退出当前账号'),
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
