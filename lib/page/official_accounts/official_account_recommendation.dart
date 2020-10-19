import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:cached_network_image/cached_network_image.dart';

class OfficialAccountRecommendation extends StatefulWidget {
  @override
  _OfficialAccountRecommendationState createState() =>
      _OfficialAccountRecommendationState();
}

class _OfficialAccountRecommendationState
    extends State<OfficialAccountRecommendation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        leadingType: 1,
        title: "推荐给",
        rightDMActions: <Widget>[
          Icon(Icons.search, size: 22, color: Colors.black),
          Space(),
        ],
      ),
      body: ListView(
        children: <Widget>[
          recommendationRowContext("创建新的群聊"),
          SizedBox(height: 16),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  child: Text("最近", style: TextStyle(fontSize: 16)),
                ),
                Column(
                  children: [0, 1, 2, 3, 4].map(
                    (number) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ListTile(
                          leading: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: NETWORK_IMAGE,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text('我是群名称'),
                        ),
                      );
                    },
                  ).toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget recommendationRowContext(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      height: 48,
      child: Row(
        children: <Widget>[
          Text(text, style: TextStyle(fontSize: 16)),
          Spacer(),
          Icon(
            Icons.chevron_right,
            size: 30,
            color: Color.fromRGBO(153, 153, 153, 1),
          )
        ],
      ),
    );
  }
}
