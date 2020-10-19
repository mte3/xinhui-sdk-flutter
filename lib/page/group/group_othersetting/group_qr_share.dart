import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Share extends StatelessWidget {
  List<String> nameItems = <String>[
    '微信', '朋友圈', '微博', 'QQ', '发送至朋友',
  ];
  List<String> urlItems = <String>[
    'http://pic50.photophoto.cn/20190305/1190120507913157_b.jpg',
    'http://www.kuaipng.com/Uploads/pic/water/13448/goods_water_13448_698_698_.png',
    'https://p5.ssl.qhimgs1.com/sdr/400__/t01f17244112d4774cf.png'
        'http://img.zcool.cn/community/01d5265944e531a8012193a3479c3c.jpg',
    'http://bpic.588ku.com/element_origin_min_pic/00/91/37/6556f1691ab6c20.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10))
      ),
      height: 184.0,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('分享至'),
          SizedBox(height: 12,),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: new Image.network( urlItems[0], width: 60.0, height: 60.0, fit: BoxFit.fill, )),
                  ),
                  new Text(nameItems[0])
                ],
              ),Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: new Image.network( urlItems[1], width: 60.0, height: 60.0, fit: BoxFit.fill, )),
                  ),
                  new Text(nameItems[1])
                ],
              ),Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: new Image.network( urlItems[2], width: 60.0, height: 60.0, fit: BoxFit.fill, )),
                  ),
                  new Text(nameItems[2])
                ],
              ),Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: new Image.network( urlItems[3], width: 60.0, height: 60.0, fit: BoxFit.fill, )),
                  ),
                  new Text(nameItems[3])
                ],
              ),Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: new Image.network('http://bpic.588ku.com/element_origin_min_pic/00/91/37/6556f1691ab6c20.jpg', width: 60.0, height: 60.0, fit: BoxFit.fill, )),
                  ),
                  new Text('发送至朋友')
                ],
              ),
            ],
          ),
          SizedBox(height: 12,),
          InkWell(
            child: Container(
                height: 46,
                child: new Center(
                  child: new Text( '取  消',
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),
                  ), )),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}