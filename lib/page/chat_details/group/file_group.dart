/*
*  讯息发起群聊群组信息群组文件多选提示语widget.dart
*  IM-讯息-发起群聊-群组信息(蔡俊鸿)
*
*  Created by Supernova.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/group/shadows.dart';
import 'package:jh_im_sdk/util/tools.dart';

import 'borders.dart';
import 'colors.dart';


class FileGroup extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 245, 245),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.accentElement,
                    ),
                    child: Container(),
                  ),
                  Container(
                    height: 44,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: AppColors.accentElement,
                              boxShadow: [
                                Shadows.primaryShadow,
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  child: Text(
                                    "群组文件",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontFamily: "PingFang SC",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 16,
                                  child: Image.asset(
                                    "assets/images/image-2.png",
                                    fit: BoxFit.none,
                                    package: packageName,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 12,
                          right: 15,
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      child: Image.asset(
                                        "assets/images/-934.png",
                                        fit: BoxFit.none,
                                        package: packageName,
                                      ),
                                    ),
                                    Positioned(
                                      left: 5,
                                      right: 3,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            right: 0,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  left: 4,
                                                  right: 0,
                                                  child: Image.asset(
                                                    "assets/images/-935.png",
                                                    fit: BoxFit.none,
                                                    package: packageName,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  right: 8,
                                                  child: Image.asset(
                                                    "assets/images/-5864.png",
                                                    fit: BoxFit.none,
                                                    package: packageName,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            right: 0,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  left: 4,
                                                  right: 0,
                                                  child: Image.asset(
                                                    "assets/images/-935.png",
                                                    fit: BoxFit.none,
                                                    package: packageName,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  right: 8,
                                                  child: Image.asset(
                                                    "assets/images/-5864.png",
                                                    fit: BoxFit.none,
                                                    package: packageName,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  left: 4,
                                                  right: 0,
                                                  child: Image.asset(
                                                    "assets/images/-935.png",
                                                    fit: BoxFit.none,
                                                    package: packageName,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  right: 8,
                                                  child: Image.asset(
                                                    "assets/images/-5864.png",
                                                    fit: BoxFit.none,
                                                    package: packageName,
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
                              Spacer(),
                              Container(
                                width: 21,
                                height: 21,
                                child: Image.asset(
                                  "assets/images/-134.png",
                                  fit: BoxFit.none,
                                  package: packageName,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 284,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBackground,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 15,
                          top: 11,
                          right: 15,
                          bottom: 11,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 49,
                                margin: EdgeInsets.only(right: 1),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 247,
                                        height: 49,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                width: 47,
                                                height: 47,
                                                child: Image.asset(
                                                  "assets/images/pdf.png",
                                                  fit: BoxFit.none,
                                                  package: packageName,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 192,
                                              margin: EdgeInsets.only(top: 2),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text(
                                                      "文件名字文件名字文件名字",
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
                                                    alignment: Alignment.topRight,
                                                    child: Container(
                                                      width: 177,
                                                      height: 18,
                                                      margin: EdgeInsets.only(right: 15),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "12:21",
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                              color: AppColors.secondaryText,
                                                              fontFamily: "PingFang SC",
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(left: 10),
                                                            child: Text(
                                                              "用户昵称",
                                                              textAlign: TextAlign.left,
                                                              style: TextStyle(
                                                                color: Color.fromARGB(255, 45, 136, 255),
                                                                fontFamily: "PingFang SC",
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Container(
                                                            margin: EdgeInsets.only(right: 7),
                                                            child: Text(
                                                              "1.23MB",
                                                              textAlign: TextAlign.left,
                                                              style: TextStyle(
                                                                color: AppColors.secondaryText,
                                                                fontFamily: "PingFang SC",
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "已下载",
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                              color: AppColors.secondaryText,
                                                              fontFamily: "PingFang SC",
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 16,
                                        height: 16,
                                        margin: EdgeInsets.only(top: 17),
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 45, 136, 255),
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              height: 7,
                                              margin: EdgeInsets.only(left: 3, right: 2),
                                              child: Image.asset(
                                                "assets/images/-5820.png",
                                                fit: BoxFit.none,
                                                package: packageName,
                                              ),
                                            ),
                                          ],
                                        ),
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
                                height: 49,
                                margin: EdgeInsets.only(top: 10, right: 1),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 263,
                                        height: 49,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                width: 47,
                                                height: 47,
                                                child: Image.asset(
                                                  "assets/images/pdf.png",
                                                  fit: BoxFit.none,
                                                  package: packageName,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 208,
                                              margin: EdgeInsets.only(top: 3),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text(
                                                      "文件名字文件名字文件名字字",
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
                                                    alignment: Alignment.topRight,
                                                    child: Container(
                                                      width: 169,
                                                      height: 18,
                                                      margin: EdgeInsets.only(right: 39),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "昨天",
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                              color: AppColors.secondaryText,
                                                              fontFamily: "PingFang SC",
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(left: 6),
                                                            child: Text(
                                                              "用户昵称",
                                                              textAlign: TextAlign.left,
                                                              style: TextStyle(
                                                                color: Color.fromARGB(255, 45, 136, 255),
                                                                fontFamily: "PingFang SC",
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Container(
                                                            margin: EdgeInsets.only(right: 7),
                                                            child: Text(
                                                              "1.23MB",
                                                              textAlign: TextAlign.left,
                                                              style: TextStyle(
                                                                color: AppColors.secondaryText,
                                                                fontFamily: "PingFang SC",
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            "已下载",
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                              color: AppColors.secondaryText,
                                                              fontFamily: "PingFang SC",
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 16,
                                        height: 16,
                                        margin: EdgeInsets.only(top: 17),
                                        decoration: BoxDecoration(
                                          color: AppColors.secondaryElement,
                                          border: Border.fromBorderSide(Borders.primaryBorder),
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: Container(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 49,
                                margin: EdgeInsets.only(top: 22, right: 1),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 311,
                                        height: 49,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                width: 47,
                                                height: 47,
                                                child: Image.asset(
                                                  "assets/images/pdf.png",
                                                  fit: BoxFit.none,
                                                  package: packageName,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                margin: EdgeInsets.only(left: 8, top: 2),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.topRight,
                                                      child: Text(
                                                        "文件名字文件名字文件名字文件名字",
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
                                                        width: 169,
                                                        height: 18,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "昨天",
                                                              textAlign: TextAlign.left,
                                                              style: TextStyle(
                                                                color: AppColors.secondaryText,
                                                                fontFamily: "PingFang SC",
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(left: 6),
                                                              child: Text(
                                                                "某某某上传",
                                                                textAlign: TextAlign.left,
                                                                style: TextStyle(
                                                                  color: Color.fromARGB(255, 45, 136, 255),
                                                                  fontFamily: "PingFang SC",
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            Container(
                                                              margin: EdgeInsets.only(right: 7),
                                                              child: Text(
                                                                "1.23MB",
                                                                textAlign: TextAlign.left,
                                                                style: TextStyle(
                                                                  color: AppColors.secondaryText,
                                                                  fontFamily: "PingFang SC",
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 12,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "下载",
                                                              textAlign: TextAlign.left,
                                                              style: TextStyle(
                                                                color: Color.fromARGB(255, 45, 136, 255),
                                                                fontFamily: "PingFang SC",
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        width: 16,
                                        height: 16,
                                        margin: EdgeInsets.only(top: 17),
                                        decoration: BoxDecoration(
                                          color: AppColors.secondaryElement,
                                          border: Border.fromBorderSide(Borders.primaryBorder),
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: Container(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 2,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryElement,
                                ),
                                child: Container(),
                              ),
                              Container(
                                height: 49,
                                margin: EdgeInsets.only(right: 1),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        width: 311,
                                        height: 49,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                width: 47,
                                                height: 47,
                                                child: Image.asset(
                                                  "assets/images/pdf.png",
                                                  fit: BoxFit.none,
                                                  package: packageName,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: 256,
                                              margin: EdgeInsets.only(top: 2),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text(
                                                      "文件名字文件名字文件名字文件名字",
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
                                                    alignment: Alignment.topRight,
                                                    child: Container(
                                                      width: 217,
                                                      height: 18,
                                                      margin: EdgeInsets.only(right: 39),
                                                      child: Stack(
                                                        alignment: Alignment.center,
                                                        children: [
                                                          Positioned(
                                                            left: 0,
                                                            right: 0,
                                                            child: Row(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              children: [
                                                                Align(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: Text(
                                                                    "2020-04-08",
                                                                    textAlign: TextAlign.left,
                                                                    style: TextStyle(
                                                                      color: AppColors.secondaryText,
                                                                      fontFamily: "PingFang SC",
                                                                      fontWeight: FontWeight.w400,
                                                                      fontSize: 12,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Spacer(),
                                                                Align(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: Container(
                                                                    margin: EdgeInsets.only(right: 7),
                                                                    child: Text(
                                                                      "1.23MB",
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
                                                                Align(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: Text(
                                                                    "下载",
                                                                    textAlign: TextAlign.left,
                                                                    style: TextStyle(
                                                                      color: Color.fromARGB(255, 45, 136, 255),
                                                                      fontFamily: "PingFang SC",
                                                                      fontWeight: FontWeight.w400,
                                                                      fontSize: 12,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Positioned(
                                                            child: Text(
                                                              "某某某上传",
                                                              textAlign: TextAlign.left,
                                                              style: TextStyle(
                                                                color: Color.fromARGB(255, 45, 136, 255),
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
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        width: 16,
                                        height: 16,
                                        margin: EdgeInsets.only(bottom: 16),
                                        decoration: BoxDecoration(
                                          color: AppColors.secondaryElement,
                                          border: Border.fromBorderSide(Borders.primaryBorder),
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: Container(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 15,
                          right: 15,
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                              color: AppColors.primaryElement,
                            ),
                            child: Container(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 80,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.primaryBackground,
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          left: 103,
                          right: 102,
                          bottom: 27,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 24,
                                  height: 18,
                                  margin: EdgeInsets.only(bottom: 4),
                                  child: Image.asset(
                                    "assets/images/image-4.png",
                                    fit: BoxFit.none,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 23,
                                  height: 25,
                                  child: Image.asset(
                                    "assets/images/image.png",
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
            Positioned(
              child: Container(
                width: 224,
                height: 38,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 102, 102, 102),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "只能删除本人上传的文件",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.accentText,
                        fontFamily: "PingFang SC",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}