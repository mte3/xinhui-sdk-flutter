import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/contact/connections/connections_administration.dart';
import 'package:jh_im_sdk/page/contact/contact_WorkBusiness/workbusiness.dart';
import 'package:jh_im_sdk/page/contact/other/create_group.dart';
import 'package:jh_im_sdk/page/contact/other/my_device.dart';
import 'package:jh_im_sdk/page/contact/other/new_friend.dart';
import 'package:jh_im_sdk/page/official_accounts/official_accounts_page.dart';
import 'package:jh_im_sdk/page/follow/my_follow.dart';
import 'package:jh_im_sdk/page/group/group_detail.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/view/image_view.dart';

import 'contact_view.dart';

typedef OnAdd = void Function(String v);
typedef OnCancel = void Function(String v);

class Constants {
  static const IconFontFamily = "appIconFont";
  static const ActionIconSize = 20.0;
  static const ActionIconSizeLarge = 32.0;
  static const AvatarRadius = 4.0;
  static const ConversationAvatarSize = 48.0;
  static const DividerWidth = 0.2;
  static const ConversationMuteIconSize = 18.0;
  static const ContactAvatarSize = 42.0;
  static const TitleTextSize = 16.0;
  static const ContentTextSize = 20.0;
  static const DesTextSize = 13.0;
  static const IndexBarWidth = 24.0;
  static const IndexLetterBoxSize = 64.0;
  static const IndexLetterBoxRadius = 4.0;
  static const FullWidthIconButtonIconSize = 25.0;
  static const ChatBoxHeight = 48.0;

  static const String MENU_MARK_AS_UNREAD = 'MENU_MARK_AS_UNREAD';
  static const String MENU_MARK_AS_UNREAD_VALUE = '标为未读';
  static const String MENU_PIN_TO_TOP = 'MENU_PIN_TO_TOP';
  static const String MENU_PIN_TO_TOP_VALUE = '置顶聊天';
  static const String MENU_DELETE_CONVERSATION = 'MENU_DELETE_CONVERSATION';
  static const String MENU_DELETE_CONVERSATION_VALUE = '删除该聊天';
  static const String MENU_PIN_PA_TO_TOP = 'MENU_PIN_PA_TO_TOP';
  static const String MENU_PIN_PA_TO_TOP_VALUE = '置顶公众号';
  static const String MENU_UNSUBSCRIBE = 'MENU_UNSUBSCRIBE';
  static const String MENU_UNSUBSCRIBE_VALUE = '取消关注';
}

class ContactItem extends StatefulWidget {
  final String avatar;
  final String title;
  final String identifier;
  final String groupTitle;
  final bool isLine;
  final ClickType type;
  final OnAdd add;
  final OnCancel cancel;

  ContactItem({
    @required this.avatar,
    @required this.title,
    this.identifier,
    this.isLine = true,
    this.groupTitle,
    this.type = ClickType.open,
    this.add,
    this.cancel,
  });

  ContactItemState createState() => ContactItemState();
}

class ContactItemState extends State<ContactItem> {
  // ‘添加好友’ 横纵间距
  static const double MARGIN_VERTICAL = 6.0;
  static const double MARGIN_HORIZONTAL = 16.0;

  // ‘ABC...’ 高度
  static const double GROUP_TITLE_HEIGHT = 34.0;

  // items的高度 纵向高度*2+头像高度+分割线高度
  static double heightItem(bool hasGroupTitle) {
    final _buttonHeight = MARGIN_VERTICAL * 2 +
        Constants.ContactAvatarSize +
        Constants.DividerWidth;
    if (hasGroupTitle) return _buttonHeight + GROUP_TITLE_HEIGHT;

    return _buttonHeight;
  }

  bool isSelect = false;

  Map<String, dynamic> mapData;

  bool isLine() {
    if (widget.isLine) {
      if (widget.title != '通讯录') {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    List showItem = [
      [
        "当面建群",
        "assets/images/contacts/dmjq.png",
        () => Navigator.maybePop(context).then((e) => routePush(CreateGroup()))
      ],
      ["添加朋友", "assets/images/contacts/tjpy.png", () {}],
      [
        "我的设备",
        "assets/images/contacts/wdsb.png",
        () => Navigator.maybePop(context).then((e) => routePush(MyDevice()))
      ],
      [
        "人脉管理",
        "assets/images/contacts/rmgl.png",

        ///好友唯一标识[id]
        () => Navigator.maybePop(context).then(
            (e) => routePush(ConnectionsAdministration(id: widget.identifier)))
      ],
      ["扫一扫", "assets/images/contacts/sys.png", () {}],
      [
        "黑名单",
        "assets/images/contacts/hmd.png",
        () => Navigator.maybePop(context).then((e) => confirmAlert(
            context, (v) {},
            title: "确定拉黑该好友吗？", tips: "加入黑名单后，你将无法继续收到对方的资讯，且彼此无法查看主见更新"))
      ],
      ["添加标签", "assets/images/contacts/tjbq.png", () {}],
    ];

    /// 定义左边图标Widget
    Widget _avatarIcon = new ImageView(
      img: widget.avatar,
      width: Constants.ContactAvatarSize,
      height: Constants.ContactAvatarSize,
      fit: BoxFit.cover,
    );

    /// 头像圆角
    _avatarIcon = _avatarIcon;
    var content = [
      _avatarIcon,

      ///  头像离名字的距离
      new Space(width: 15.0),
      new Expanded(
        child: new Container(
          padding: const EdgeInsets.only(right: MARGIN_HORIZONTAL),
          height: heightItem(false),

          /// 名字的显示位置
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: !isLine()
                ? null
                : Border(
                    bottom: BorderSide(width: 0.5, color: lineColor),
                  ),
          ),

          /// 姓名
          child: new Text(widget.title,
              style: TextStyle(fontWeight: FontWeight.w400), maxLines: 1),
        ),
      ),
      widget.type == ClickType.select
          ? new InkWell(
              child: new Image.asset(
                'assets/images/login/${isSelect ? 'ic_select_have.webp' : 'ic_select_no.png'}',
                width: 25.0,
                height: 25.0,
                fit: BoxFit.cover,
                package: packageName,
              ),
              onTap: () {
                setState(() => isSelect = !isSelect);
                if (isSelect) widget.add(widget.identifier);
                if (!isSelect) widget.cancel(widget.identifier);
              },
            )
          : new Container(),
      widget.identifier != "" && widget.identifier != null
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                child: Icon(Icons.more_horiz),
                onTapDown: (p) {
                  double positionDy = 0;
                  positionDy = p.globalPosition.dy;
                  showDialog(
                    context: context,
                    child: GestureDetector(
                      onTap: () => Navigator.maybePop(context),
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Stack(
                          children: <Widget>[
                            Positioned(
                              top: positionDy > 440 ? 400 : positionDy - 25,
                              right: 40,
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: showItem.map((i) {
                                    return ShowItem(
                                      imagePath: i[1],
                                      text: i[0],
                                      function: i[2],
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
    ];

    /// 列表项主体部分
    Widget button = new FlatButton(
      color: Colors.white,
      onPressed: () {
        switch (widget.title) {
          case "新的朋友":
            routePush(NewFriend());
            break;
          case "工作及商务":
            routePush(WorkBusiness());
            break;
          case "群组":
            routePush(Group());
            break;
          case "标签":
            break;
          case "新的朋友":
            break;
          case "我关注的":
            routePush(MyFollow());
            break;
          case "公众号":
            routePush(OfficialAccount());
            break;
          default:
            break;
        }
      },
      child: new Row(children: content),
    );

    /// 定义分组标签（左边的ABC...）
    Widget itemBody;
    if (widget.groupTitle != null) {
      itemBody = new Column(
        children: <Widget>[
          new Container(
            height: GROUP_TITLE_HEIGHT,
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xffebebeb),
              border: Border(
                top: BorderSide(color: lineColor, width: 0.2),
                bottom: BorderSide(color: lineColor, width: 0.2),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: new Text(widget.groupTitle),
          ),
          button,
        ],
      );
    } else {
      itemBody = button;
    }

    return itemBody;
  }
}

class ShowItem extends StatelessWidget {
  @required
  final String text;
  final Function function;
  final String imagePath;

  ShowItem({Key key, this.text, this.function, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: RawChip(
        avatar: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          package: packageName,
        ),
        backgroundColor: Colors.white,
        label: Text(
          text,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
