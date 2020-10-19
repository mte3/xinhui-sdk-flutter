import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';

class GroupSharedFiles extends StatefulWidget {
  @override
  _GroupSharedFilesState createState() => _GroupSharedFilesState();
}

class _GroupSharedFilesState extends State<GroupSharedFiles> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new NavigationBar(
        title: '群共享文件',
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
            onTap: () => routePush(fileUpload(context)),
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
            height: 44,
            margin: EdgeInsets.only(left: 24,right: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color:Colors.white,
            ),
            child: Row(
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
          ),
          Container(
              padding: EdgeInsets.only(left: 24,top: 12,bottom: 12),
              child: Text('共XXX个文件（已使用1.91G/10G）')),
          ListTile(
            title: Text('文件夹名称'),
            subtitle: Text('20-2-20 共x个文件') ,
            leading: Container(
              child: Icon(Icons.folder,size: 36,),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6))
              ),
            ),
          ),
          ListTile(
            title: Text('视频名称'),
            subtitle: Text('20-2-20 来自xxx 888.8kb') ,
            leading: Container(
              child: Icon(Icons.videocam,size: 36,),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
            ),
          ),
          ListTile(
            title: Text('图片名称'),
            subtitle: Text('20-2-20 来自xxx 888.8kb') ,
            leading: Container(
              child: Icon(Icons.photo,size: 36,),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
            ),
          ),
          ListTile(
            title: Text('音频名称'),
            subtitle: Text('20-2-20 来自xxx 888.8kb') ,
            leading: Container(
              child: Icon(Icons.volume_up,size: 36,),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//上传文件
fileUpload(context) {
  Widget itemBuild(item) {
    String label = item['label'];
    IconData icon = item['icon'];
    return new InkWell(
      child: new Container(
        padding: EdgeInsets.all(10),
        width: 130,
        child: new Row(
          children: <Widget>[
            new Icon(icon,color: Colors.grey,),
            new SizedBox(width: 10),
            new Text(label),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();

      },
    );
  }
  showDialog(
    context: context,
    builder: (context) {
      List data = [
        {'label': '上传文件', 'icon':Icons.insert_drive_file},
        {'label': '上传视频', 'icon': Icons.videocam},
        {'label': '上传图片', 'icon': Icons.photo},
        {'label': '上传音频', 'icon': Icons.volume_up},
        {'label': '创建文件夹', 'icon':  Icons.folder_open},

      ];
      return new GestureDetector(
        child: new Material(
          type: MaterialType.transparency,
          child: new Stack(
            children: <Widget>[
              new Positioned(
                top: topBarHeight(context) - statusBarHeight(context),
                right: 16,
                child: new Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: new Column(children: data.map(itemBuild).toList()),
                ),
              ),
            ],
          ),
        ),
        onTap: () => Navigator.of(context).pop(),
      );
    },
  );
}
