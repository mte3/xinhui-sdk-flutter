import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

///
/// 讯息搜索----未找到入口
class SearchBarViewDelegate extends SearchDelegate<String> {
  String searchHint = "请输入搜索内容...";
  var sourceList = [
    "dart",
    "flutter",
    "ler",
    "你好",
    "测试",
  ];

  var suggestList = [
    "dart",
    "flutter",
    "ler",
    "你好",
    "测试",
  ];

  @override
  String get searchFieldLabel => searchHint;

  @override
  List<Widget> buildActions(BuildContext context) {
    ///显示在最右边的控件列表
    return null;
  }

  ///左侧带动画的控件，一般都是返回
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      iconSize: 22,
      padding: EdgeInsets.symmetric(vertical: 13),
      icon: Image.asset(
        "assets/images/commom/ic_back.png",
        color: Color(0xff707070),package: packageName,
      ),
      onPressed: () => close(context, null),
    );
  }

  ///展示搜索结果
  @override
  Widget buildResults(BuildContext context) {
    List<String> result = List();

    ///模拟搜索过程
    for (var str in sourceList) {
      ///query 就是输入框的 TextEditingController
      if (query.isNotEmpty && str.contains(query)) {
        result.add(str);
      }
    }

    ///展示搜索结果
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 500,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 26),
                Center(
                  child: Text(
                    "搜索到以下资讯",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(167, 167, 167, 1),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  title: Text(result[index], style: TextStyle(fontSize: 18)),
                  subtitle: RichText(
                    text: TextSpan(
                      text: suggest[index].substring(0, query.length), //输入框词
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "${suggest[index].substring(query.length)}  你好！很高兴认识你", //提示词
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: new NetworkImage(NETWORK_IMAGE),
                    radius: 22.5,
                  ),
                  trailing: Column(
                    children: <Widget>[
                      Space(),
                      Text(
                        "4分钟前",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(167, 167, 167, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
    );
  }

  List<String> suggest;

  ///方法返回一个控件，显示为搜索内容区域的搜索结果内容
  @override
  Widget buildSuggestions(BuildContext context) {
    suggest = query.isEmpty
        ? suggestList
        : sourceList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggest.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: new NetworkImage(NETWORK_IMAGE),
            radius: 22.5,
          ),
          title: RichText(
            text: TextSpan(
              text: suggest[index].substring(0, query.length), //输入框词
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: suggest[index].substring(query.length), //提示词
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          searchHint = "";
          query = suggest[index].toString();
          showResults(context); //显示建议的搜索内容，也就是widget
        },
      ),
    );
  }
}
