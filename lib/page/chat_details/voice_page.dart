import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

class VoicePage extends StatefulWidget {
  @override
  _VoicePageState createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/nopath----7.png",
              fit: BoxFit.cover,
              package: packageName,
            ),
          ),
          Positioned(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Opacity(
                  opacity: 0.4,
                  child: Container(
                      decoration: BoxDecoration(color: Colors.grey[100])),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    "assets/images/nopath----8.png",
                    width: MediaQuery.of(context).size.width * 0.52,
                    height: MediaQuery.of(context).size.width * 0.52,
                    fit: BoxFit.cover,
                    package: packageName,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "Krystal",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ButtonStyle(img: "assets/images/-866.png"),
                ButtonStyle(img: "assets/images/-5700.png"),
                ButtonStyle(img: "assets/images/-5703.png"),
                ButtonStyle(img: "assets/images/-870.png"),
                ButtonStyle(img: "assets/images/-5688.png"),
                ButtonStyle(img: "assets/images/-874.png"),
                ButtonStyle(img: "assets/images/-5689.png"),
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(right: 16, top: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                    "assets/images/-5704.png",package: packageName,
                  ))),
                  child: Image.asset(
                    "assets/images/-882.png",
                    fit: BoxFit.none,package: packageName,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.357),
                  height: 77,
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      StackHeadStyle(ima: "assets/images/nopath----11.png"),
                      StackHeadStyle(ima: "assets/images/nopath----13.png"),
                    ],
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

class ButtonStyle extends StatelessWidget {
  final String img;
  const ButtonStyle({Key key, @required this.img}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.only(right: 16, top: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          "assets/images/-5685.png",package: packageName,
        ))),
        child: Image.asset(
          img,
          fit: BoxFit.none,package: packageName,
        ),
      ),
    );
  }
}

class StackHeadStyle extends StatelessWidget {
  final String ima;

  const StackHeadStyle({Key key, @required this.ima}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 21),
        child: Stack(
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                ima,
                width: 77,
                height: 77,
                fit: BoxFit.cover,
                package: packageName,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.bottomLeft,
              width: 77,
              height: 77,
              child: Image.asset("assets/images/-154.png",
                  package: packageName),
            ),
          ],
        ),
      ),
    );
  }
}
