//import 'package:extended_text_field/extended_text_field.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:mvvmdemo/page/mine/MyExtendedMaterialTextSelectionControls.dart';
//
//import 'my_special_text_span_builder.dart';
//
//class MinePage extends StatefulWidget {
//  @override
//  _MinePageState createState() => _MinePageState();
//}
//
//class _MinePageState extends State<MinePage> {
//  TextEditingController _textEditingController = TextEditingController();
//  MyExtendedMaterialTextSelectionControls
//      _myExtendedMaterialTextSelectionControls =
//      MyExtendedMaterialTextSelectionControls();
//  final GlobalKey _key = GlobalKey();
//  MySpecialTextSpanBuilder _mySpecialTextSpanBuilder =
//      MySpecialTextSpanBuilder();
//
//  FocusNode _focusNode = FocusNode();
//  double _keyboardHeight = 267.0;
//
//  bool get showCustomKeyBoard =>
//      activeEmojiGird || activeAtGrid || activeDollarGrid || activeImageGrid;
//  bool activeEmojiGird = false;
//  bool activeAtGrid = false;
//  bool activeDollarGrid = false;
//  bool activeImageGrid = false;
//  List<String> sessions = <String>[
//    "[44] @Dota2 CN dota best dota",
//    "yes, you are right [36].",
//    "大家好，我是拉面，很萌很新 [12].",
//    "\$Flutter\$. CN dev best dev",
//    "\$Dota2 Ti9\$. Shanghai,I'm coming.",
//    "error 0 [45] warning 0",
//  ];
//
//  @override
//  void initState() {
////    tuChongRepository = TuChongRepository();
//    super.initState();
//  }
//
//  @override
//  void dispose() {
////    tuChongRepository.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
////    FocusScope.of(context).autofocus(_focusNode);
////    var keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
////    if (keyboardHeight > 0) {
////      activeEmojiGird =
////          activeAtGrid = activeDollarGrid = activeImageGrid = false;
////    }
////
////    _keyboardHeight = max(_keyboardHeight, keyboardHeight);
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("quickly build special text"),
//      ),
//      body: ExtendedTextField(
//        key: _key,
//        specialTextSpanBuilder: MySpecialTextSpanBuilder(
//          showAtBackground: true,
//        ),
//        controller: _textEditingController,
//        textSelectionControls: _myExtendedMaterialTextSelectionControls,
//        maxLines: null,
//        focusNode: _focusNode,
//        decoration: InputDecoration(
//            suffixIcon: GestureDetector(
//              onTap: () {
//                setState(() {
//                  sessions.insert(0, _textEditingController.text);
//                  _textEditingController.value = _textEditingController.value
//                      .copyWith(
//                          text: "",
//                          selection: TextSelection.collapsed(offset: 0),
//                          composing: TextRange.empty);
//                });
//              },
//              child: Icon(Icons.send),
//            ),
//            contentPadding: EdgeInsets.all(12.0)),
//        //textDirection: TextDirection.rtl,
//      ),
//    );
//  }
//}
