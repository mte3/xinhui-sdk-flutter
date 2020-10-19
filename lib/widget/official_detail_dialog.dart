import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class OfficialDialog extends StatelessWidget {
  final String title;
  final String imageUrl;
 final Function onTap;
  const OfficialDialog({Key key, this.title, this.imageUrl,this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(right: 5),
                child: Image.asset(imageUrl,
                    package: packageName)),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                  fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
