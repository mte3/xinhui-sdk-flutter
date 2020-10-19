import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/chat_details/group/code_group.dart';
import 'package:jh_im_sdk/page/chat_details/group/colors.dart';
import 'package:jh_im_sdk/util/tools.dart';

class UserInfrom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "基本信息",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 136,
              color: Colors.white,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/images/5725.png',
                    width: 80,
                    height: 80,
                    package: packageName,
                  ),
                  Container(
                    margin: EdgeInsets.only(left:10,top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        Row(
                          children: <Widget>[
                            Text('这是一个用户名称',style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                            Container(
                                margin:EdgeInsets.only(left: 8),
                                child: Image.asset('assets/images/1623.png',width: 18,height: 18,
                                  package: packageName,))
                          ],
                        ),
                        Container(
                          margin:EdgeInsets.only(top:10,bottom:10),
                          child: Row(
                            children: <Widget>[
                              Image.asset('assets/images/5720.png',width: 18,height: 18,
                                package: packageName,),
                              Container(
                                  margin:EdgeInsets.only(left: 8),
                                  child: Text('678968787931313130')),
                            ],
                          )),
                        Row(
                          children: <Widget>[
                            Image.asset('assets/images/5719.png',width: 18,height: 18,
                              package: packageName,),
                            Container(
                                margin:EdgeInsets.only(left: 8),
                                child: Text('广东省—广州市'),),
                          ],
                        ),
                      ]
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 184,
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
                                "社交圈",
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
                                  package: packageName,
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
                          margin: EdgeInsets.only(left: 1, top: 12, right: 3),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "出生日期",
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
                                  margin: EdgeInsets.only(top: 1),
                                  child: Text(
                                    "1980-03-02",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.secondaryText,
                                      fontFamily: "PingFang SC",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
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
                          height: 22,
                          margin: EdgeInsets.only(left: 1, top: 12, right: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "手机号",
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
                                  margin: EdgeInsets.only(top: 1),
                                  child: Text(
                                    "13713946542",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.secondaryText,
                                      fontFamily: "PingFang SC",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
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
                          height: 22,
                          margin: EdgeInsets.only(left: 1, top: 12, right: 1),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "上次在线时间",
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
                                  margin: EdgeInsets.only(top: 1),
                                  child: Text(
                                    "昨天09：22",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.secondaryText,
                                      fontFamily: "PingFang SC",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
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
                ],
              ),
            ),
            Container(
              height: 93,
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
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>CodeGroup(),
                            ),
                            );
                          },
                          child: Container(
                            height: 22,
                            margin: EdgeInsets.only(left: 1),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "群二维码",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.primaryText,
                                        fontFamily: "PingFang SC",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Expanded(child: Container(),),
                                    Container(
                                      width: 10,
                                      height: 15,
                                      child: Image.asset(
                                        "assets/images/-5726.png",
                                        fit: BoxFit.none,
                                        package: packageName,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

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
                                "所在位置",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "PingFang SC",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.chevron_right,color: Colors.grey,)
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
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 33,
                    child: Image.asset(
                      "assets/images/-903.png",
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
    );
  }
}
