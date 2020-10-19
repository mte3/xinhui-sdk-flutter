import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FindRecordedPictures extends StatefulWidget {
  @override
  _FindRecordedPicturesState createState() => _FindRecordedPicturesState();
}

class _FindRecordedPicturesState extends State<FindRecordedPictures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(leadingType: 1, title: "图片"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.black38,
        child: ListView(
          children: <Widget>[
            Space(),
            Text("今日",style: TextStyle(color: Colors.white,fontSize: 18)),
            findImages(),
            Text("昨日",style: TextStyle(color: Colors.white,fontSize: 18)),
            findImages(),
            Text("本月",style: TextStyle(color: Colors.white,fontSize: 18)),
            findImages(),
          ],
        ),
      ),
    );
  }
  Widget findImages(){
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(10, (_) {
        return Container(
          width: (winWidth(context) - 50) / 4,
          height: (winWidth(context) - 50) / 4,
          child: CachedNetworkImage(
            imageUrl:
            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2337756152,1867712973&fm=26&gp=0.jpg",
            fit: BoxFit.cover,
          ),
        );
      },
      ),
    );
  }
}
