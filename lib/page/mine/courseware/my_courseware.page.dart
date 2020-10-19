import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

import 'listview/listviewfile_page.dart';
import 'listview/listviewphoto_page.dart';
import 'listview/listviewviode_page.dart';

class Courseware extends StatefulWidget {
  @override
  _CoursewareState createState() => _CoursewareState();
}

class _CoursewareState extends State<Courseware>
    with SingleTickerProviderStateMixin {
  TabController controller;
  var tabs = <Tab>[];
  @override
  void initState() {
    super.initState();
    tabs = <Tab>[
      Tab(
        text: "图片",
      ),
      Tab(
        text: "视频",
      ),
      Tab(
        text: "文档",
      ),
    ];

    //initialIndex初始选中第几个
    controller =
        TabController(initialIndex: 2, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: MaterialApp(

        debugShowCheckedModeBanner:false,
        home: Scaffold(
           backgroundColor: Color.fromRGBO(245,245,245,1),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey[50],
            leading: new InkWell(
              child: Container(
                width: 22,
                height: 22,
                child: Image.asset(
                  "assets/images/-1.png",
                  fit: BoxFit.none,package: packageName,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              '我的课件',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            actions: <Widget>[
              Image.network(
                'https://lanhu.oss-cn-beijing.aliyuncs.com/xd502861b5-1e30-494c-b1b3-63442e459db8',
                height: 20,
                width: 20,
              ),
              SizedBox(width: 12,),
              Image.network(
                'https://lanhu.oss-cn-beijing.aliyuncs.com/xd160e5368-691c-4325-b903-afaa20547fe7',
                height: 20,
                width: 20,
              ),
              SizedBox(width: 16,),
            ],
            bottom: TabBar(
              controller: controller, //可以和TabBarView使用同一个TabController
              tabs: tabs,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: EdgeInsets.only(left: 40,right: 40),
              indicatorColor: Color.fromRGBO(45, 136, 255, 1), //底部
              labelColor: Color.fromRGBO(45, 136, 255, 1), //选中
              labelStyle: TextStyle(
                fontSize: 16.0,
              ),
              unselectedLabelColor: Color.fromRGBO(153, 153, 153, 1), //未选中
              unselectedLabelStyle: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          body: TabBarView(
            
            controller: controller,
            children: <Widget>[
              ListViewphoto(),
              ListViewviode(),
              ListViewfile(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
