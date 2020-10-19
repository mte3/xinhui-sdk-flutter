import 'package:flutter/material.dart';
import 'package:jh_im_sdk/page/mine/courseware/upload/file_upload_page.dart';
import 'package:jh_im_sdk/util/tools.dart';

class ListViewfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(

      children: <Widget>[
        SizedBox(
          height: 18,
        ),
        File(),
        File(),
        File(),
      ],
    );
  }
}

class File extends StatelessWidget {
  const File({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: 319,
              height: 89,
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal:28),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               FlutterLogo(size: 54,),
               SizedBox(
                 width: 22,
               ),
               Container(
                 height: 44,
                 width: 160,
                 child: Text('[文件]学生使用说明(学生用).pdf',style: TextStyle(fontSize: 16,),),
               ),
             ],
           ),
         ),
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
        routePush(Fileupload());
      },
    );
  }
}
