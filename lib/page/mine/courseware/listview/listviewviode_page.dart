import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/mine/courseware/upload/viode_upload_page.dart';
import 'package:jh_im_sdk/util/tools.dart';

class ListViewviode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(

      children: <Widget>[
        SizedBox(
          height: 18,
        ),
        Viodo(),
        Viodo(),
        Viodo(),
      ],
    );
   
  }
}

class Viodo extends StatelessWidget {
  const Viodo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
 Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587912798156&di=60ffa7144f3cd69ef8f4a9e554d4cf13&imgtype=0&src=http%3A%2F%2Fcimg.163.com%2Ftravel%2F0310%2F20%2F1634.jpg',
              width: 319,
              height: 112,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 40,
              left: 138
              ,child: Image.network('https://lanhu.oss-cn-beijing.aliyuncs.com/xd1570081a-e01f-491e-8e1d-6d54ad1d827a',height: 43,width:43 ,)),
              ],
            ),
           
            Container(
            width : 319,
              height: 93,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '大学物理',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                        width: 252,
                        height: 34,
                        child: Text(
                          '大学物理，是大学理工科类的一门基础课程，通过课程的学习，使学生熟悉自然界物质的结构...',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(153, 153, 153, 1)),
                        )),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('王老师',style: TextStyle(fontSize: 10,color: Color.fromRGBO(153,153,153,1)),),
                        Icon(Icons.chevron_right,color: Color.fromRGBO(153,153,153,1),size: 10,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        routePush(Viodeupload());
      },
    );
  }
}
