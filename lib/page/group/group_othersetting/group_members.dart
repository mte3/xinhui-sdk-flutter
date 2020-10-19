import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class GroupMembers extends StatefulWidget {
  @override
  _GroupMembersState createState() => _GroupMembersState();
}
const String NETWORK_IMAGE =
    'https://p5.ssl.qhimgs1.com/bdr/326__/t01faa0569f68a773ff.jpg';

class _GroupMembersState extends State<GroupMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new NavigationBar(
        title: '群成员（34）',
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
        rightDMActions: <Widget>[
          new InkWell(
            onTap: () {},
            child: new SizedBox(
              width: 40,
              child: new UnconstrainedBox(
                child: new Image.asset(
                  'assets/images/msg/ic_search.png',
                  width: 17,
                  fit: BoxFit.cover,package: packageName,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 4, 12, 4),
        child: new Wrap(
          spacing: 5,
          runSpacing: 8,
          children: Boxs()+Noxs(),
        ),
      ),
    );
  }
}

List<Widget> Boxs() => List.generate(18, (index) {
  return Column(
    children: <Widget>[
      Container(
        width: 70,
        height: 70,
        child:new CircleAvatar(
          backgroundImage: new NetworkImage(NETWORK_IMAGE),
        ),
      ),
      Text('群成员${index}')
    ],
  );
},);

List<Widget> Noxs() => List.generate(2, (index) {
  return Column(
    children: <Widget>[
      Container(
          width:70,
          height: 90,
          child: Center(child: InkWell(child: new Icon(Icons.add,size: 50,)))),
    ],
  );
});