import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget/ACETabBarIndicator_widget.dart';

class MyFollow extends StatefulWidget {
  @override
  _MyFollowState createState() => _MyFollowState();
}

class _MyFollowState extends State<MyFollow>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  bool isShowSearchBtn = true;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.pixels == 0.0) {
        isShowSearchBtn = true;
        setState(() {});
      } else {
        isShowSearchBtn = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.white),
      child: Scaffold(
        appBar: new NavigationBar(
          title: '我关注的',
          leading: new InkWell(
            child: Container(
              width: 22,
              height: 22,
              child: Image.asset(
                "assets/images/-1.png",
                fit: BoxFit.none,package: packageName,
              ),
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
          rightDMActions: <Widget>[
            InkWell(
              onTap: () {
                _scrollViewController.position.jumpTo(0.0);
              },
              child: !isShowSearchBtn == true
                  ? Container(
                      width: 21,
                      height: 21,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 15),
                      child: Image.asset(
                        "assets/images/-1-7.png",
                        fit: BoxFit.none,package: packageName,
                      ),
                    )
                  : Container(),
            ),
            InkWell(
//            onTap: () => routePush(new ChatSetUp()),
              child: Container(
                width: 21,
                height: 21,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/images/-156.png",
                  fit: BoxFit.none,package: packageName,
                ),
              ),
            )
          ],
        ),
        body: MainInputBody(
          child: Container(
            child: NestedScrollView(
                controller: _scrollViewController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      elevation: 0,
                      leading: Container(),
                      pinned: true,
                      floating: true,
                      expandedHeight: winHeight(context) / 6.1,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        collapseMode: CollapseMode.pin,
                        background: Container(
                          height: winHeight(context),
                          color: Colors.white,
                          // 搜索框
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 15),
                                child: TextField(
                                  style: TextStyle(
                                      textBaseline: TextBaseline.alphabetic),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      /*边角*/
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5), //边角为5
                                      ),
                                      borderSide: BorderSide(
                                        color: Color(0XFFEEEEEE), //边线颜色为白色
                                        width: 1, //边线宽度为2
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFEEEEEE), //边框颜色为白色
                                        width: 1, //宽度为5
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5), //边角为30
                                      ),
                                    ),
                                    hintText: '搜索',
                                    prefixIcon:
                                        Image.asset('assets/images/-1-2.png',package: packageName),
                                    suffixIcon:
                                        Image.asset('assets/images/-242.png',package: packageName),
                                    filled: true,
                                    fillColor: Color(0xFFF5F5F5),
                                    contentPadding: const EdgeInsets.all(0),
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xFF999999)),
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      bottom: TabBar(
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 10),
                          indicator: ACETabBarIndicator(
                              type: ACETabBarIndicatorType.runderline_fixed,
                              color: Color(0xFF2D88FF),
                              lineWidth: 20,
                              height: 5),
                          labelColor: Color(0xFF2D88FF),
                          unselectedLabelColor: Color(0xFFCDCDCD),
                          tabs: [
                            Tab(text: '关注的人'),
                            Tab(text: '群组'),
                            Tab(text: '公众号'),
                          ]),
                    )
                  ];
                },
                body: TabBarView(controller: _tabController, children: [
                  _buildTabView(),
                  _buildTabView(),
                  _buildTabView()
                ])),
          ),
        ),
      ),
    );
  }

  Widget _buildTabView() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 8),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/images/nopath----2.png',package: packageName),
              ),
              title: Text('十七'),
            ),
          ],
        ),
      ),
    );
  }
}
