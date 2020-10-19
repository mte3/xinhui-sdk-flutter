import 'package:flutter/material.dart';
import 'package:jh_im_sdk/data/data.dart';
import 'package:jh_im_sdk/model/tabbar_model.dart';

typedef CheckLogin(index);

class RootTabBar extends StatefulWidget {
  RootTabBar({
    this.pages,
    this.checkLogin,
    this.currentIndex = 0,
  });

  final List<TabBarModel> pages;
  final CheckLogin checkLogin;
  final int currentIndex;

  @override
  State<StatefulWidget> createState() => new RootTabBarState();
}

class RootTabBarState extends State<RootTabBar> {
  int currentIndex;
  var contents = new List<Offstage>();

  @override
  void initState() {
    super.initState();

    currentIndex = widget.currentIndex;

    Notice.addListener(ShopActions.toTabBarIndex(), (index) {
      setState(() {
        currentIndex = index;
      });
    });
  }

  List<BottomNavigationBarItem> pages() {
    List<BottomNavigationBarItem> barItems;
    barItems = new List<BottomNavigationBarItem>();
    for (int i = 0; i < widget.pages.length; i++) {
      TabBarModel model = widget.pages[i];
      barItems.add(new BottomNavigationBarItem(
        icon: model.icon,
        activeIcon: model.selectIcon,
        title: new Text(model.title, style: new TextStyle(fontSize: 12.0)),
      ));
    }
    return barItems;
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationBar bottomNavigationBar() {
      return new BottomNavigationBar(
        items: pages(),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        fixedColor: Color.fromRGBO(45, 45, 45, 1.0),
        onTap: (int index) {
          if (widget.checkLogin != null) {
            widget.checkLogin(index);
          }
          setState(() => currentIndex = index);

          Notice.send(ShopActions.toTab(index), 'refresh');
        },
        iconSize: 18.0,
      );
    }

    contents.clear();
    for (int i = 0; i < widget.pages.length; i++) {
      TabBarModel model = widget.pages[i];
      contents.add(
        new Offstage(child: model.page, offstage: currentIndex != i),
      );
    }
    return new Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: new Stack(children: contents.toList(growable: false)),
    );
  }
}
