import 'package:jh_im_sdk/util/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '群组',
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
          new InkWell(
            child: new SizedBox(
              width: 40,
              child: new Icon(
                CupertinoIcons.add_circled,
                color: Color(0xff333333),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Container(
              height: 52.0,
              child: new Card(
                  child: new Container(
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 5.0,),
                        Icon(Icons.search, color: Colors.grey,),
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller: controller,
                              decoration: new InputDecoration(
                                  hintText: '搜索',
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        new IconButton(
                          icon: new Icon(Icons.cancel),
                          color: Colors.grey,
                          iconSize: 18.0,
                          onPressed: () {
                            controller.clear();
                            // onSearchTextChanged('');
                          },
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
        new Container(
          padding: EdgeInsets.fromLTRB(16,4,16,4),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(width:0.1),),
        ),
          child: new Row(
            children: <Widget>[
              new CircleAvatar(
                backgroundImage: new AssetImage('assets/images/tab/nopath----13.png',package: packageName),
              ),
              new SizedBox(width: 16,),
              new Text('我是群昵称'),
            ],
          ),
        ),
          new Container(
            padding: EdgeInsets.fromLTRB(16,4,16,4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(width:0.1),),
            ),
            child: new Row(
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: new AssetImage('assets/images/tab/nopath----13.png',package: packageName,),
                ),
                new SizedBox(width: 16,),
                new Text('我是群昵称'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
