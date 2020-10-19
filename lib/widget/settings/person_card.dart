import 'package:flutter/material.dart';

import 'package:jh_im_sdk/util/tools.dart';

class PersonCard extends StatelessWidget {
  final String name;

  PersonCard(this.name);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: (winWidth(context) - 40) / 5,
      height: 50.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new CircleAvatar(
            radius: 36 / 2,
            child: Text(name[0]),
          ),
          new Space(width: mainSpace / 3),
          new Expanded(
            child: new Text(
              '$name',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
