import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/contact/contact_WorkBusiness/add_members.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'add_branch.dart';
import 'add_department.dart';
import 'change_department_name.dart';
import 'change_company_name.dart';

class PopupWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new PopupMenuButton(
        icon: Image.asset(
          "assets/images/contacts/setting.png",
          width: 20,
          height: 20,package: packageName,
        ),
        color: Colors.white,
        offset: Offset(0.0, 40.0),
        itemBuilder: (BuildContext context) {
          return <PopupMenuItem<String>>[
            PopupMenuItem<String>(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      "assets/images/contacts/add.png",
                      width: 15,package: packageName,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "添加部门",
                  ),
                ],
              ),
              value: 'remove',
            ),
            PopupMenuItem<String>(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    "assets/images/contacts/change.png",
                    width: 15,package: packageName,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "修改名称",
                  ),
                ],
              ),
              value: 'dissolution',
            ),
            PopupMenuItem<String>(
              child: InkWell(
                onTap: () {
                  confirmAlert(context, (v) {},
                      tips: "是否退出该公司", okBtn: "退出", cancelBtn: "取消");
                },
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/contacts/out.png",
                      width: 15,package: packageName,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "退出公司",
                    ),
                  ],
                ),
              ),
              value: 'department',
            ),
            PopupMenuItem<String>(
              child: InkWell(
                onTap: () {
                  confirmAlert(
                    context,
                    (v) {},
                    tips: "是否删除该公司",
                    okBtn: "删除",
                    cancelBtn: "取消",
                  );
                },
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/contacts/delete.png",
                      width: 15,package: packageName,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "删除公司",
                    ),
                  ],
                ),
              ),
              value: 'shouukuan',
            ),
          ];
        },
        onSelected: (String action) {
          switch (action) {
            case 'remove':
              print('添加部门');
              routePush(new AddDepartment());
              break;
            case 'dissolution':
              print('修改名称');
              routePush(new ChangeCompanyName());
              break;
            case 'department':
              print('退出公司');
              break;
            case 'shoufukuan':
              print('删除公司');
              break;
          }
        },
      ),
    );
  }
}

class PopupWindow1 extends StatelessWidget {
  final String picture1;
  final String picture2;
  final String picture3;
  final String picture4;
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  const PopupWindow1(
      {Key key,
      this.picture1,
      this.picture2,
      this.picture3,
      this.picture4,
      this.text1,
      this.text2,
      this.text3,
      this.text4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)),
      child: new PopupMenuButton(
        icon: Image.asset(
          "assets/images/contacts/setting.png",
          width: 20,
          height: 20,package: packageName,
        ),
        color: Colors.white,
        offset: Offset(0.0, 40.0),
        itemBuilder: (BuildContext context) {
          return <PopupMenuItem<String>>[
            PopupMenuItem<String>(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      picture1,
                      width: 15,package: packageName,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    text1,
                  ),
                ],
              ),
              value: 'remove',
            ),
            PopupMenuItem<String>(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    picture2,
                    width: 15,package: packageName,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    text2,
                  ),
                ],
              ),
              value: 'dissolution',
            ),
            PopupMenuItem<String>(
              child: Row(
                children: <Widget>[
                  Image.asset(
                    picture3,
                    width: 15,package: packageName,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    text3,
                  ),
                ],
              ),
              value: 'department',
            ),
            PopupMenuItem<String>(
              child: InkWell(
                onTap: () {
                  confirmAlert(context, (v) {},
                      tips: "是否删除该公司", okBtn: "删除", cancelBtn: "取消");
                },
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      picture4,
                      width: 15,package: packageName,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      text4,
                    ),
                  ],
                ),
              ),
              value: 'shouukuan',
            ),
          ];
        },
        onSelected: (String action) {
          switch (action) {
            case 'remove':
              print('添加分部');
              routePush(new AddBranch());
              break;
            case 'dissolution':
              print('添加成员');
              routePush(new AddMembers());
              break;
            case 'department':
              print('修改名称');
              routePush(new ChangeDepartmentName());
              break;
            case 'shoufukuan':
              print('删除部门');
              break;
          }
        },
      ),
    );
  }
}
