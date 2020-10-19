import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/common/global_variable.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';
//图片
class ChatLookupPicture extends StatefulWidget {
  @override
  _ChatLookupPictureState createState() => _ChatLookupPictureState();
}
//图片地址
const String NETWORK_IMAGES =
    "http://photocdn.sohu.com/20130316/Img369071880.jpg";
//视频地址
const String NETWORK_V =
    "http://d00.paixin.com/thumbs/1310390/24664055/staff_1024.jpg?watermark/1/image/aHR0cDovL2QwMC5wYWl4aW4uY29tL3dtX2RwXzM2MF9iaWdnZXIucG5n/dissolve/100/gravity/SouthWest/dx/0/dy/0";
class _ChatLookupPictureState extends State<ChatLookupPicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new NavigationBar(
        title: '图片',
        leading: new InkWell(
          child: Container(
            width: 22,
            height: 22,
            child: Image.asset(
              "assets/images/-1.png",
              fit: BoxFit.none,
              package: packageName,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          PhotoList(date1: '今天',),
          PhotoList(date1: '昨天',),
          PhotoList(date1: '2020年2月',)
        ],
      ),
    );
  }
}

//视频
class ChatLookupVideo extends StatefulWidget {
  @override
  _ChatLookupVideoState createState() => _ChatLookupVideoState();
}

class _ChatLookupVideoState extends State<ChatLookupVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new NavigationBar(
        title: '视频',
        leading: new InkWell(
          child: Container(
            width: 22,
            height: 22,
            child: Image.asset(
              "assets/images/-1.png",
              fit: BoxFit.none,
              package: packageName,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          VideoList(date2: '今天',),
          VideoList(date2: '昨天',),
          VideoList(date2: '2020年2月',)
        ],
      ),
    );
  }
}

//文件
class ChatLookupFiles extends StatefulWidget {
  @override
  _ChatLookupFilesState createState() => _ChatLookupFilesState();
}

class _ChatLookupFilesState extends State<ChatLookupFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '文件',
        leading: new InkWell(
          child: Container(
            width: 22,
            height: 22,
            child: Image.asset(
              "assets/images/-1.png",
              fit: BoxFit.none,
              package: packageName,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 16),
              child: Text('今天')),
          FilesList(date3: '今天',),
          Container(
              padding: EdgeInsets.only(left: 16),
              child: Text('昨天')),
          FilesList(date3:'昨天' ,),
          Container(height: 12,color: Colors.white,),
          FilesList(date3:'昨天' ,),
          Container(
              padding: EdgeInsets.only(left: 16),
              child: Text('2020年2月')),
          FilesList(date3:'2020年2月' ,),
        ],
      ),
    );
  }
}

//链接
class ChatLookupLink extends StatefulWidget {
  @override
  _ChatLookupLinkState createState() => _ChatLookupLinkState();
}

class _ChatLookupLinkState extends State<ChatLookupLink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '链接',
        leading: new InkWell(
          child: Container(
            width: 22,
            height: 22,
            child: Image.asset(
              "assets/images/-1.png",
              fit: BoxFit.none,
              package: packageName,
            ),
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(left: 16),
              child: Text('今天')),
          FilesList(date3: '今天',),
          Container(
              padding: EdgeInsets.only(left: 16),
              child: Text('昨天')),
          FilesList(date3:'昨天' ,),
          Container(height: 12,color: Colors.white,),
          FilesList(date3:'昨天' ,),
          Container(
              padding: EdgeInsets.only(left: 16),
              child: Text('2020年2月')),
          FilesList(date3:'2020年2月' ,),
        ],
      ),
    );
  }
}
//图片记录
class PhotoList extends StatelessWidget {
  final String date1;

  const PhotoList({Key key, this.date1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16,right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(date1),
          SizedBox(height: 8,),
          Container(
            child: GridView.count(
              crossAxisSpacing:4,
              mainAxisSpacing: 4,
              crossAxisCount: 5,
              childAspectRatio: 1.0,
              shrinkWrap: true,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_IMAGES,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_IMAGES,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_IMAGES,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_IMAGES,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_IMAGES,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_IMAGES,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_IMAGES,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_IMAGES,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_IMAGES,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_IMAGES,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//视频记录
class VideoList extends StatelessWidget {
  final String date2;

  const VideoList({Key key, this.date2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16,right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(date2),
          SizedBox(height: 8,),
          Container(
            child: GridView.count(
              crossAxisSpacing:4,
              mainAxisSpacing: 4,
              crossAxisCount: 5,
              childAspectRatio: 1.0,
              shrinkWrap: true,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_V,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_V,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_V,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_V,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_V,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_V,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_V,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_V,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_V,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    NETWORK_V,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//文件夹记录
class FilesList extends StatelessWidget {
  final String date3;
  const FilesList({Key key, this.date3}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.white,
      padding: EdgeInsets.only(left: 16,right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Image.network(
                      NETWORK_IMAGES,width: 50,
                    ),
                  ),
                  Text('疾风剑豪'),
                ],
              ),
              Text(date3),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      NETWORK_IMAGES,width: 80,
                    ),
                  ),
                  Text('疾风剑豪的暴风大剑.pdf'),
                ],
              ),
              Text('1.23MB'),
            ],
          ),
        ],
      ),
    );
  }
}
