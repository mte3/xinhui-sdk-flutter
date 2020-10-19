import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/mine/payment_center/bill_details_page.dart';
import 'package:jh_im_sdk/util/tools.dart';

class Bill extends StatelessWidget {
  final Color add = Colors.blue;//增加的钱的颜色
  final Color reduce = Colors.red;//减少的钱的颜色
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavigationBar(
        backgroundColor: Colors.grey[50],
        title: '账单',
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
      ),
      body: ListView(
        children: <Widget>[
          Mod(add: add, reduce: reduce),
          Mod(add: add, reduce: reduce),
        ],
      ),
    );
  }
}
//抽离整一个大的模块
class Mod extends StatelessWidget {
  const Mod({
    Key key,
    @required this.add,
    @required this.reduce,
  }) : super(key: key);

  final Color add;//增加的钱
  final Color reduce;//减少的钱

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('2020年4月'),
                  Row(
                    children: <Widget>[
                      Text('支出 ¥'),
                      Text('0.00'),
                      SizedBox(
                        width: 8,
                      ),
                      Text('收入 ¥'),
                      Text('9999999999.00'),
                    ],
                  ),
                ]),
          ),
          Momey(
            momey: add,
            momeyicon: Icons.add,
          ),
          Momey(momey: reduce,momeyicon: Icons.remove,),
          Momey(momey: add,momeyicon: Icons.add,),
          Momey(momey: reduce,momeyicon: Icons.remove,),
          Momey(momey: add,momeyicon: Icons.add,),
          Momey(momey: add,momeyicon: Icons.add,),
      
        ],
      ),
    );
  }
}
//大模块里面的内容
class Momey extends StatelessWidget {
  final Color momey;//图标颜色
final IconData momeyicon;//加减图标

  const Momey({
    Key key,
    this.momey, this.momeyicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  new CircleAvatar(
                    //圆角
                    backgroundImage: new NetworkImage(
                      'https://img2.woyaogexing.com/2020/03/02/199ad1ecb19743928a17daaa48b33bfd!400x400.jpeg',
                    ),
                    radius: 45 / 2,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: <Widget>[
                      Text('收红包-按时打算多'),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: <Widget>[
                          Text('4月1日'),
                          SizedBox(
                            width: 30,
                          ),
                          Text('21:54'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Icon(
                      // Icons.add,
                     momeyicon,
                      size: 10,
                      color: momey,
                    ),
                    SizedBox(
                      width: 1,
                    ),
                    Text(
                      '¥',
                      style: TextStyle(color: momey, fontSize: 16),
                    ),
                    Text(
                      '10000.00',
                      style: TextStyle(color: momey, fontSize: 16),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: (){
        routePush(new Billdetails());
      },
    );
  }
}
