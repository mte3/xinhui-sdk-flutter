import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class ChatTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '交易记录',
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
      body: Container(
        color: Colors.white,
        child: new ListView.builder(itemBuilder: (context, index) {
          return new Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(width: 0.1)),
            ),
            child: new ListTile(
              title: new Text('转账-来自 $index'),
              leading: new CircleAvatar(
                backgroundImage: new NetworkImage(NETWORK_IMAGE),
              ),
              subtitle:Row(
                children: <Widget>[
                  new Text('2020-11-29'),
                  SizedBox(width: 10),
                  new Text('22:10')
                ],
              ),
//              onTap: () => routePush(new ChatDetailsPage()),
              trailing: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text('+￥ $index',
                  style: TextStyle(
                    color: Color(0xFF2D88FF),
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  new SizedBox(height: 5),
//                  new Image.asset('assets/images/msg/ic_msg.png', width: 16.26,
//                package: packageName),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
