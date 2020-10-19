import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class MyDeviceModel {
  String device;
  bool status;

  MyDeviceModel(this.device, [this.status = false]);
}

class MyDevice extends StatefulWidget {
  @override
  _MyDeviceState createState() => _MyDeviceState();
}

class _MyDeviceState extends State<MyDevice> {
  List<MyDeviceModel> devices = [
    MyDeviceModel("我的iphone"),
    MyDeviceModel("我的Windows电脑", true),
    MyDeviceModel("我的Mac电脑"),
    MyDeviceModel("我的Web网页", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            print("返回");
          },
          icon: Image.asset(
            'assets/images/-1.png',
            width: 20,
            height: 20,
            fit: BoxFit.cover,package: packageName,
          ),
        ),
        title: Text(
          '我的设备',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: devices.map((i) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.phone_iphone,
                    color: i.status ? Colors.blue : Colors.grey,
                  ),
                  Text(
                    i.device,
                    style: TextStyle(
                      fontSize: 16,
                      color: i.status ? Colors.blue : Colors.grey,
                    ),
                  ),
                  Spacer(),
                  Text(
                    i.status ? "(在线)" : "(离线)",
                    style:
                        TextStyle(color: i.status ? Colors.blue : Colors.grey),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
