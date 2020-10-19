
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class AddFriendsAndFriends extends StatefulWidget {
  @override
  _AddFriendsAndFriendsState createState() => _AddFriendsAndFriendsState();
}

class _AddFriendsAndFriendsState extends State<AddFriendsAndFriends> {
  @override
  Widget build(BuildContext context) {
    var _width = (MediaQuery.of(context).size.width - 54) / 2;
    var _hight = (MediaQuery.of(context).size.width - 54) / 2;
    return Scaffold(
      appBar: NavigationBar(title: "搜索", leadingType: 1),
      body: Container(
        margin: EdgeInsets.only(top: 12, left: 17, right: 17),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: List.generate(5, (index) {
              return Container(
                width: _width,
                height: _hight,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://wapnewimg.uumtu.com/Thumb/2019/0408/f1958cbcd40803f92c307f2c27df4e5b.jpg"),
                          ),
                        ),
                        child: Container(
                          height: 17,
                          width: 58,
                          margin: EdgeInsets.only(right: 8, bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.place, size: 12, color: Colors.white),
                              Text(
                                "24.3km",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: _hight * 0.4,
                      padding:
                          EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(radius: 15,backgroundImage: NetworkImage(
                              "https://wapnewimg.uumtu.com/Thumb/2019/0408/f1958cbcd40803f92c307f2c27df4e5b.jpg"),),
                          SizedBox(width: 8),
                          Container(
                            height: 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "毛驴",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color.fromRGBO(51, 51, 51, 1),
                                  ),
                                ),
                                Text(
                                  "01-02    09:10",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromRGBO(205, 205, 205, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
