import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

///emoji/image text
class EmojiText extends SpecialText {
  static const String flag = "[";
  final int start;
  EmojiText(TextStyle textStyle, {this.start})
      : super(EmojiText.flag, "]", textStyle);

  @override
  InlineSpan finishText() {
    var key = toString();

    ///https://github.com/flutter/flutter/issues/42086
    /// widget span is not working on web
    if (EmojiUitl.instance.emojiMap.containsKey(key) && !kIsWeb) {
      //fontsize id define image height
      //size = 30.0/26.0 * fontSize
      final double size = 20.0;

      ///fontSize 26 and text height =30.0
      //final double fontSize = 26.0;
      return ImageSpan(
          AssetImage(
            EmojiUitl.instance.emojiMap[key],
            package: packageName,
          ),
          actualText: key,
          imageWidth: size,
          imageHeight: size,
          start: start,
          fit: BoxFit.fill,
          margin: EdgeInsets.only(left: 2.0, top: 2.0, right: 2.0));
    }

    return TextSpan(text: toString(), style: textStyle);
  }
}
// TODO 等ui表情包，需更改某些参数
class EmojiUitl {
  final Map<String, String> _emojiMap = new Map<String, String>();

  Map<String, String> get emojiMap => _emojiMap;

  final String _emojiFilePath = "assets/images/emoji";

  static EmojiUitl _instance;
  static EmojiUitl get instance {
    if (_instance == null) _instance = new EmojiUitl._();
    return _instance;
  }


  EmojiUitl._() {
    for (int i = 1; i < 5; i++) {
      _emojiMap["[$i]"] = "$_emojiFilePath/$i.png";
    }
  }
}
