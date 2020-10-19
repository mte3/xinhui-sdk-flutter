import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/contact/contact_WorkBusiness/new_company.dart';
import 'package:jh_im_sdk/page/contact/contact_WorkBusiness/workbusiness_widget.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'change_department.dart';
import 'change_position.dart';
import 'employee_details.dart';
import 'new_company.dart';

class WorkBusiness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              routePush(pop());
              print("返回");
            },
            icon: Image.asset(
              'assets/images/-1.png',
              width: 20,
              height: 20,
              fit: BoxFit.cover,
              package: packageName,
            ),
          ),
          title: Text(
            '工作及商务',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print("添加公司");
                routePush(NewCompany());
              },
              icon: Image.asset(
                'assets/images/-156.png',
                width: 20,
                height: 20,
                package: packageName,
              ),
            )
          ],
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  ThreeLevelWindow(),
                  SizedBox(
                    height: 12,
                  ),
                  ThreeLevelWindow(),
                ],
              ),
            ),
          ],
        ));
  }
}

class ThreeLevelWindow extends StatelessWidget {
  const ThreeLevelWindow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: Colors.white,
        child: ExpansionTile(
            title: const Text(
              '金慧科技有限公司',
              style: TextStyle(color: Colors.black),
            ),
            trailing: PopupWindow(),
            children: <Widget>[
              ExpansionTile(
                title: Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromRGBO(45, 136, 255, 1),
                        ),
                        SizedBox(width: 4),
                        Text('人事部'),
                      ],
                    )),
                trailing: PopupWindow1(
                  picture1: "assets/images/contacts/add.png",
                  picture2: "assets/images/contacts/add.png",
                  picture3: "assets/images/contacts/change.png",
                  picture4: "assets/images/contacts/delete.png",
                  text1: "添加分部",
                  text2: "添加成员",
                  text3: "修改名称",
                  text4: "删除部门",
                ),
                children: <Widget>[
                  ThreeLevel(),
                  ThreeLevel(),
                  ThreeLevel(),
                ],
              ),
              ExpansionTile(
                title: Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromRGBO(45, 136, 255, 1),
                        ),
                        SizedBox(width: 4),
                        Text('财务部'),
                      ],
                    )),
                trailing: PopupWindow1(
                  picture1: "assets/images/contacts/add.png",
                  picture2: "assets/images/contacts/add.png",
                  picture3: "assets/images/contacts/change.png",
                  picture4: "assets/images/contacts/delete.png",
                  text1: "添加分部",
                  text2: "添加成员",
                  text3: "修改名称",
                  text4: "删除部门",
                ),
                children: <Widget>[
                  ThreeLevel(),
                  ThreeLevel(),
                  ThreeLevel(),
                ],
              ),
              ExpansionTile(
                title: Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromRGBO(45, 136, 255, 1),
                        ),
                        SizedBox(width: 4),
                        Text('技术部'),
                      ],
                    )),
                trailing: Container(
                  child: PopupWindow1(
                    picture1: "assets/images/contacts/add.png",
                    picture2: "assets/images/contacts/add.png",
                    picture3: "assets/images/contacts/change.png",
                    picture4: "assets/images/contacts/delete.png",
                    text1: "添加分部",
                    text2: "添加成员",
                    text3: "修改名称",
                    text4: "删除部门",
                  ),
                ),
                children: <Widget>[
                  ThreeLevel(),
                  ThreeLevel(),
                  ThreeLevel(),
                ],
              ),
            ]),
      ),
    );
  }
}

class ThreeLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List showItem = [
      [
        "员工详情",
        "assets/images/contacts/dmjq.png",
        () => Navigator.maybePop(context)
            .then((e) => routePush(EmployeeDetails()))
      ],
      [
        "更换部门",
        "assets/images/contacts/change.png",
        () => Navigator.maybePop(context)
            .then((e) => routePush(ChangeDepartment()))
      ],
      [
        "修改职位",
        "assets/images/contacts/change.png",
        () => Navigator.maybePop(context)
            .then((e) => routePush(ModificationPosition()))
      ],
      [
        "删除员工",
        "assets/images/contacts/delete.png",
        () {
          confirmAlert(context, (v) {},
              tips: "是否删除该员工", okBtn: "删除", cancelBtn: "取消");
        }
      ],
    ];
    return GestureDetector(
      onLongPressStart: (p) {
        double positionDy = 0;
        double positionDx = 0;
        positionDy = p.globalPosition.dy;
        positionDx= p.globalPosition.dx;
        showDialog(
          context: context,
          child: GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: <Widget>[
                  Positioned(
                    top: positionDy > 440 ? winHeight(context) *2/3 : positionDy - 25,
                    left: positionDx < 120 ? positionDx: positionDx-120,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: showItem.map((item) {
                          return ShowItem(
                            imagePath: item[1],
                            text: item[0],
                            function: item[2],
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
      child: InkWell(
        child: Container(
          height: 50,
          child: Container(
            margin: EdgeInsets.only(left: 64),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1, color: Color.fromRGBO(240, 240, 240, 1)))),
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/contacts/touxiang.png',
                    package: packageName),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Harry',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
