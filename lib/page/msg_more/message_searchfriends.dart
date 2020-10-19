import 'package:flutter/material.dart';
import 'package:jh_im_sdk/common/global_variable.dart';
import 'package:jh_im_sdk/util/tools.dart';

class searchBarDelegate extends SearchDelegate<String> {
  String searchHint = "请输入搜索内容...";
  @override
  String get searchFieldLabel => searchHint;
//重写右侧的图标
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

//重写返回图标
  @override
  Widget buildLeading(BuildContext context) {
    return  IconButton(
      iconSize: 22,
      padding: EdgeInsets.symmetric(vertical: 13),
      icon: Image.asset(
        "assets/images/commom/ic_back.png",
        color: Color(0xff707070),package: packageName,
      ),
      onPressed: () => close(context, null),
    );
  }

  //重写搜索结果
  @override
  Widget buildResults(BuildContext context) {
    // ignore: missing_return
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: new NetworkImage(NETWORK_IMAGE),
        radius: 22.5,
      ),
      title: Text(query),
    );
  }
  ///方法返回一个控件，显示为搜索内容区域的搜索结果内容
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return MainInputBody(
      child: ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage: new NetworkImage(NETWORK_IMAGE),
            radius: 22.5,
          ),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(color: Color.fromRGBO(45, 136, 255, 1), fontWeight: FontWeight.bold,fontSize: 16),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1),fontSize: 16))
              ],
            ),
          ),
          onTap: () {
            searchHint="";
            query = suggestionList[index].toString();
            showResults(context);
          },
        ),
      ),
    );
  }
}

const searchList = [
  "Augenstern",
  "Augenstern3543",
  "Augenstern23",
];

const recentSuggest = ["Augenstern", "Augenstern3543","Augenstern23"];

//import 'package:flutter/material.dart';
//typedef SearchItemCall = void Function(String item);
//
//class searchBarDelegate extends SearchDelegate<String> {
//
//  @override
//  List<Widget> buildActions(BuildContext context) {
//    //右侧显示内容 这里放清除按钮
//    return [
//      IconButton(
//        icon: Icon(Icons.clear),
//        onPressed: () {
//          query = "";
//          showSuggestions(context);
//        },
//      ),
//    ];
//  }
//
//  @override
//  Widget buildLeading(BuildContext context) {
//    //左侧显示内容 这里放了返回按钮
//    return IconButton(
//      icon: AnimatedIcon(
//          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
//      onPressed: () {
//        if (query.isEmpty) {
//          close(context, null);
//        } else {
//          query = "";
//          showSuggestions(context);
//        }
//      },
//    );
//  }
//
//  @override
//  Widget buildResults(BuildContext context) {
//    //点击了搜索显示的页面
//    return Center(
//      child: Text('12312321'),
//    );
//  }
//
//  @override
//  Widget buildSuggestions(BuildContext context) {
//    //点击了搜索窗显示的页面
//    return SearchContentView();
//  }
//
//  @override
//  ThemeData appBarTheme(BuildContext context) {
//    return super.appBarTheme(context);
//  }
//}
//
//class SearchContentView extends StatefulWidget {
//  @override
//  _SearchContentViewState createState() => _SearchContentViewState();
//}
//
//class _SearchContentViewState extends State<SearchContentView> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: EdgeInsets.all(10),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Container(
//            child: Text(
//              '大家都在搜',
//              style: TextStyle(fontSize: 16),
//            ),
//          ),
//          SearchItemView(),
//          Container(
//            margin: EdgeInsets.only(top: 20),
//            child: Text(
//              '历史记录',
//              style: TextStyle(fontSize: 16),
//            ),
//          ),
//          SearchItemView()
//        ],
//      ),
//    );
//  }
//}
//
//class SearchItemView extends StatefulWidget {
//  @override
//  _SearchItemViewState createState() => _SearchItemViewState();
//}
//
//class _SearchItemViewState extends State<SearchItemView> {
//  List<String> items = [
//    '面试',
//    'Studio3',
//    '动画dfsfds',
//    '自定义View',
//    '性能优化',
//    'gradle',
//    'Camera',
//    '代码混淆 安全',
//    '逆向加固'
//  ];
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Wrap(
//        spacing: 10,
//        // runSpacing: 0,
//        children: items.map((item) {
//          return SearchItem(title: item);
//        }).toList(),
//      ),
//    );
//  }
//}
//
//class SearchItem extends StatefulWidget {
//  @required
//  final String title;
//  const SearchItem({Key key, this.title}) : super(key: key);
//  @override
//  _SearchItemState createState() => _SearchItemState();
//}
//
//class _SearchItemState extends State<SearchItem> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: InkWell(
//        child: Chip(
//          label: Text(widget.title),
//          shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(10)
//          ),
//        ),
//        onTap: () {
//          print(widget.title);
//        },
//      ),
//      color: Colors.red,
//    );
//  }
//}