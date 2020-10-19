/*
*  near_page.dart
*  郑南婉-IM-讯息
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/util/values/values.dart';

class NearPage extends StatefulWidget {
  @override
  _NearPageState createState() => _NearPageState();
}

class _NearPageState extends State<NearPage> {
  int isclickcolor = 0;
  List selectgender = ["不限男女", "只看男", "只看女", "取消"];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: new NavigationBar(
          title: "附近的人",
          rightDMActions: <Widget>[
            InkWell(
              child: Image.asset("assets/images/-86.png",package: packageName),
              onTap: () {
                return showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 230,
                        child: Column(
                          children: List.generate(selectgender.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: index == 3 ? 0 : 1,
                                          color: Color(0xffF0F0F0))),
                                ),
                                child: Text(
                                  selectgender[index],
                                  style: TextStyle(
                                      color: index == 3
                                          ? Color(0xffFF0000)
                                          : Color(0xff2D88FF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    });
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 24,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color.fromARGB(255, 45, 136, 255),
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: TabBar(
                  tabs: <Widget>[
                    Container(
                      color: isclickcolor == 0 ? Colors.blue : Colors.white,
                      width: double.infinity,
                      child: Tab(
                        child: Text("附近的人"),
                      ),
                    ),
                    Container(
                      color: isclickcolor == 1 ? Colors.blue : Colors.white,
                      width: double.infinity,
                      child: Tab(
                        child: Text("地图"),
                      ),
                    ),
                  ],
                  indicatorWeight: 0.01,
                  unselectedLabelColor: Colors.blue,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontSize: 12,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12,
                  ),
                  labelPadding: EdgeInsets.all(0),
                  onTap: (index) {
                    setState(() {
                      isclickcolor = index;
                    });
                  }),
            ),
            Expanded(
              child: TabBarView(children: [
                ListView(
                  children: List.generate(10, (index) {
                    return NearPeopleStyle();
                  }),
                ),
                Map(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class NearPeopleStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color(0xffF0F0F0))),
      ),
      margin: EdgeInsets.only(left: 16, top: 20, right: 16),
      height: 55,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              "assets/images/nopath----2.png",
              fit: BoxFit.cover,
              width: 45,
              height: 45,package: packageName,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              height: 45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "张三",
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "PingFang SC",
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "专注交互原型设计",
                    style: TextStyle(
                      color: AppColors.accentText,
                      fontFamily: "PingFang SC",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 9, top: 10),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: Text(
                "+好友",
                style: TextStyle(color: Colors.white),
              ),
            ),
            height: 24,
            width: 56,
            decoration: BoxDecoration(
              color: Color(0xff2D88FF),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
        ],
      ),
    );
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  AmapController _controller;
  @override
  Widget build(BuildContext context) {
    return AmapView(
      // 地图类型
      mapType: MapType.Standard,
      // 是否显示缩放控件
      showZoomControl: true,
      // 是否显示指南针控件
      showCompass: false,
      // 是否显示比例尺控件
      showScaleControl: true,
      // 是否使能缩放手势
      zoomGesturesEnabled: true,
      // 是否使能滚动手势
      scrollGesturesEnabled: true,
      // 是否使能旋转手势
      rotateGestureEnabled: true,
      // 是否使能倾斜手势
      tiltGestureEnabled: true,
      // 缩放级别
      //zoomLevel: 3,
      // 中心点坐标
      //centerCoordinate: LatLng(30, 116),
      // 标记
      //markers: <MarkerOption>[],
      // 标识点击回调
//      onMarkerClick: (Marker marker) {},
//      // 地图点击回调
//      onMapClick: (LatLng coord) {},
//      // 地图拖动回调
//      onMapDrag: (MapDrag drag) {},
      // 地图创建完成回调
      onMapCreated: (controller) async {
        _controller = controller;
        // requestPermission是权限请求方法, 需要你自己实现
        // 如果不知道怎么处理, 可以参考example工程的实现, example过程依赖了`permission_handler`插件.
        await _controller.requireAlwaysAuth();
        await _controller.setZoomLevel(12);
        await _controller.showMyLocation(MyLocationOption(
          show: true,
          myLocationType: MyLocationType.Locate,
        ));
      },
    );
  }
}
