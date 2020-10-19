/*
*  讯息发起群聊群组信息群管理widget.dart
*  IM-讯息-发起群聊-群组信息(蔡俊鸿)
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/group/shadows.dart';
import 'package:jh_im_sdk/util/tools.dart';

import 'colors.dart';


class MenagementGroup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool isClick00 = false;
    bool isClick01 = false;
    bool isClick02 = false;
    bool isClick03 = false;
    bool isClick04 = false;
    bool isClick05 = false;
    bool isClick06 = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "群管理",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: "PingFang SC",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/images/-1.png', width: 20, height: 20,package: packageName),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 245, 245),
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),//去除水波
//          crossAxisAlignment: CrossAxisAlignment.stretch,
          shrinkWrap: true,
          children: [
            Container(
              height: 138,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryElement,
                          ),
                          child: Container(),
                        ),
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryElement,
                          ),
                          child: Container(),
                        ),
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryElement,
                          ),
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 13,
                    right: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 22,
                          margin: EdgeInsets.only(left: 1),
                          child: Row(
                            children: [
                              Text(
                                "群主转让",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "PingFang SC",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 10,
                                height: 15,
                                child: Image.asset(
                                  "assets/images/-5726.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryElement,
                          ),
                          child: Container(),
                        ),
                        Container(
                          height: 22,
                          margin: EdgeInsets.only(left: 1, top: 12),
                          child: Row(
                            children: [
                              Text(
                                "指定管理员",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "PingFang SC",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 10,
                                height: 15,
                                child: Image.asset(
                                  "assets/images/-5726.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryElement,
                          ),
                          child: Container(),
                        ),
                        Container(
                          height: 22,
                          margin: EdgeInsets.only(left: 1, top: 12, right: 1),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "指定隐身人",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "PingFang SC",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 9,
                                  height: 14,
                                  margin: EdgeInsets.only(top: 3),
                                  child: Image.asset(
                                    "assets/images/-.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 92,
              margin: EdgeInsets.only(top: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryElement,
                          ),
                          child: Container(),
                        ),
                        Container(
                          height: 46,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryElement,
                          ),
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 13,
                    right: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 22,
                          margin: EdgeInsets.only(left: 1),
                          child: Row(
                            children: [
                              Text(
                                "一键复制新鲜",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "PingFang SC",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 10,
                                height: 15,
                                child: Image.asset(
                                  "assets/images/-5726.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryElement,
                          ),
                          child: Container(),
                        ),
                        Container(
                          height: 22,
                          margin: EdgeInsets.only(left: 1, top: 12),
                          child: Row(
                            children: [
                              Text(
                                "对群成员备注",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "PingFang SC",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 10,
                                height: 15,
                                child: Image.asset(
                                  "assets/images/-5726.png",
                                  fit: BoxFit.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 71,
              margin: EdgeInsets.only(top: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 71,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 10,
                    right: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 25,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(top: 3),
                                  child: Text(
                                    "私密群组",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: "PingFang SC",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Text(
                              "启用后，无法搜索到当前群组",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 88,
              margin: EdgeInsets.only(top: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 88,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 11,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 24,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(top: 2),
                                  child: Text(
                                    "显示已读人数",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: "PingFang SC",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 40,
                                  height: 24,
                                  child: Image.asset(
                                    "assets/images/switch.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Text(
                              "启用后，当前群组的消息页面每条消息左侧都会显示该条消息的\n已读人数，点击后还可查看已读人员列表",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 71,
              margin: EdgeInsets.only(top: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 71,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 11,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 24,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: EdgeInsets.only(top: 2),
                                  child: Text(
                                    "群组邀请确认",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: "PingFang SC",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 40,
                                  height: 24,
                                  child: Image.asset(
                                    "assets/images/switch.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Text(
                              "启用后，群成员需群主确认才能邀请朋友进群",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 71,
              margin: EdgeInsets.only(top: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 71,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 16, top: 13),
                              child: Text(
                                "群组减员通知",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "PingFang SC",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 8, right: 11),
                            child: Text(
                              "关闭后，当群内成员被踢出群组或主动退群时，群组内不进行通知",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 11,
                    right: 16,
                    child: Image.asset(
                      "assets/images/switch.png",
                      fit: BoxFit.none,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 88,
              margin: EdgeInsets.only(top: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 88,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 16, top: 13),
                              child: Text(
                                "允许显示群成员",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "PingFang SC",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 8, right: 11),
                            child: Text(
                              "关闭后，普通成员在群组信息内将看不到其他群成员，只显示群主\n与自己",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 11,
                    right: 16,
                    child: Image.asset(
                      "assets/images/switch.png",
                      fit: BoxFit.none,
                    ),
                  ),
                ],
              ),
            ),
//            Expanded(
//              flex: 1,
//              child: Container(
//                margin: EdgeInsets.symmetric(vertical: 12),
//                child: Stack(
//                  alignment: Alignment.center,
//                  children: [
//                    Positioned(
//                      left: 0,
//                      right: 0,
//                      bottom: 0,
//                      child: Container(
//                        height: 88,
//                        decoration: BoxDecoration(
//                          color: AppColors.primaryBackground,
//                        ),
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.stretch,
//                          children: [
//                            Align(
//                              alignment: Alignment.topLeft,
//                              child: Container(
//                                margin: EdgeInsets.only(left: 16, top: 13),
//                                child: Text(
//                                  "允许普通成员私聊",
//                                  textAlign: TextAlign.left,
//                                  style: TextStyle(
//                                    color: AppColors.primaryText,
//                                    fontFamily: "PingFang SC",
//                                    fontWeight: FontWeight.w600,
//                                    fontSize: 16,
//                                  ),
//                                ),
//                              ),
//                            ),
//                            Container(
//                              margin: EdgeInsets.only(left: 16, top: 8, right: 11),
//                              child: Text(
//                                "关闭后，不允许发送名片消息，且普通成员在群聊界面、群组信息\n内点击头像无反应",
//                                textAlign: TextAlign.left,
//                                style: TextStyle(
//                                  color: AppColors.secondaryText,
//                                  fontFamily: "PingFang SC",
//                                  fontWeight: FontWeight.w400,
//                                  fontSize: 12,
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                    Positioned(
//                      top: 11,
//                      right: 16,
//                      child: Image.asset(
//                        "assets/images/switch.png",
//                        fit: BoxFit.none,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
            Container(
              height: 71,
              margin: EdgeInsets.only(bottom: 32),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 71,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 13),
                            child: Text(
                              "允许普通成员邀请好友",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 8),
                            child: Text(
                              "关闭后，普通成员将不能使用邀请功能",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "PingFang SC",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    bottom: 36,
                    child: Image.asset(
                      "assets/images/switch.png",
                      fit: BoxFit.none,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}