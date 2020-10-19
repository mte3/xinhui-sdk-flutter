import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';
import 'package:video_player/video_player.dart';

class MessageFindVideo extends StatefulWidget {
  @override
  _MessageFindVideoState createState() => _MessageFindVideoState();
}

class _MessageFindVideoState extends State<MessageFindVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NavigationBar(
          leadingType: 1,
          title: "视频",
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: Colors.black38,
          child: ListView(
            children: <Widget>[
              Space(),
              Text("今天", style: TextStyle(color: Colors.white, fontSize: 18)),
              videoWrap(13),
            ],
          ),
        ),
    );
  }

  Widget videoWrap(int length) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(
        length,
        (index) {
          return InkWell(
            onTap: () {
              print(index.toString());
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: Scaffold(
                        body: HeroFindVideo(tag: index.toString()),
                      ),
                    );
                  },
                ),
              );
            },
            child: Hero(
              tag: index.toString(),
              child: Image.network(
                "http://pic.51yuansu.com/pic3/cover/02/22/04/59affbf8f0a65_610.jpg",
                width: (winWidth(context) - 50) / 4,
                height: (winWidth(context) - 50) / 4,
              ),
            ),
          );
        },
      ),
    );
  }
}
///点击查看视频
class HeroFindVideo extends StatefulWidget {
  @override
  _HeroFindVideoState createState() => _HeroFindVideoState();
  final Object tag;
  HeroFindVideo({this.tag});
}
class _HeroFindVideoState extends State<HeroFindVideo> {
  VideoPlayerController videoPlayerController;
  ChewieController videoController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        'http://vfx.mtime.cn/Video/2019/03/21/mp4/190321153853126488.mp4');
     videoController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
    videoController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Hero(
        tag: widget.tag,
        child: Chewie(
          controller: videoController,
        ),
      ),
    );
  }
}
