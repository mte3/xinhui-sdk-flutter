import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jh_im_sdk/util/tools.dart';

class Collection extends StatefulWidget {
  @override
  CollectionState createState() => CollectionState();
}

class CollectionState extends State<Collection> {
  List data = [0];

  String number;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: NavigationBar(
        backgroundColor: Color(0xffFAFAFA),
        title: '我的收藏',
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
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return new NewsCard(index);
        },
        itemCount: data.length, //列表的长度限制多少列
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final int index;

  NewsCard(this.index);

//  ChewieController chewieController1;
  static List imgList = [0, 1, 2]; //static 静态的数组也就是一共的图片数量

  Widget rowItemBuild(item) {
    return new Container(
      margin: EdgeInsets.only(right: 8.0),
      child: new Material(
        color: Colors.white,
        child: new InkWell(
          child: new Row(
            children: <Widget>[
              new Icon(
                Icons.tab,
                color: item == 2 ? Color(0xffE2782B) : null,
              ),
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: new Text('20'),
              ),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new Container(
        margin: EdgeInsets.only(top: 12.0),
        padding:
            EdgeInsets.symmetric(vertical: 15.0, horizontal: 17.0), //v是上下，h是左右
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Upper(),
            new SizedBox(height: 8),
            Container(
              margin: EdgeInsets.only(left: 60),
              child: new Wrap(
                //类似网格的那种
                spacing: 12, //左右边局
                runSpacing: 12, //上下边距
                children: List.generate(imgList.length, (index) {
                  if (index > 2) return new Container();
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg',
                        width: 86,
                        height: 86,
                      ));
                }),
              ),
            ),
          ],
        ),
      ),
      new Container(
        margin: EdgeInsets.only(top: 12.0),
        padding:
            EdgeInsets.symmetric(vertical: 15.0, horizontal: 17.0), //v是上下，h是左右
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Upper(),
            new SizedBox(height: 8),
            Container(
              margin: EdgeInsets.only(left: 60),
              child: new Wrap(
                //类似网格的那种
                spacing: 12, //左右边局
                runSpacing: 12, //上下边距
                children: List.generate(imgList.length, (index) {
                  if (index > 2) return new Container();

                  return Stack(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'http://b-ssl.duitang.com/uploads/item/201803/30/20180330234706_stfoo.jpg',
                            width: 86,
                            height: 86,
                          )),
                      Positioned(
                          top: 34,
                          left: 26,
                          child: Image.network(
                            'https://lanhu.oss-cn-beijing.aliyuncs.com/xd1570081a-e01f-491e-8e1d-6d54ad1d827a',
                            height: 32,
                            width:32,
                          )),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class Upper extends StatelessWidget {
  const Upper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new CircleAvatar(
          //圆角
          backgroundImage: new NetworkImage(
            'https://img2.woyaogexing.com/2020/03/02/199ad1ecb19743928a17daaa48b33bfd!400x400.jpeg',
          ),
          radius: 49 / 2,
        ),
        new SizedBox(width: 10),
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(
                '我是用户名称',
                style: TextStyle(fontSize: 16.0),
                overflow: TextOverflow.ellipsis,
              ),
              new SizedBox(height: 11),
              new Text(
                '刚刚',
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
              new SizedBox(height: 11),
              new Text(
                '测试文案',
                style: TextStyle(
                    color: Color.fromRGBO(102, 102, 102, 1), fontSize: 14.0),
              ),
            ],
          ),
        ),
        new SizedBox(width: MediaQuery.of(context).size.width / 3),
        new Text(
          '取消收藏',
          style:
              TextStyle(color: Color.fromRGBO(45, 136, 255, 1), fontSize: 12.0),
        )
      ],
    );
  }
}
