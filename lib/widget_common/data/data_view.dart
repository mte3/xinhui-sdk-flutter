import 'package:flutter/material.dart';
import 'package:jh_im_sdk/util/tools.dart';

/// 创建者：王增阳
/// 开发者：王增阳
/// 版本：1.0
/// 创建日期：2020-02-18
class DataView extends StatelessWidget {
  final bool isLoadingOk;
  final List data;
  final String label;
  final Widget child;
  final Widget noDataView;
  final VoidCallback onRefresh;

  DataView({
    @required this.isLoadingOk,
    @required this.data,
    @required this.child,
    this.onRefresh,
    this.label = '暂无数据',
    this.noDataView,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoadingOk) {
      return new LoadingView();
    } else if (!listNoEmpty(data)) {
      if (noDataView != null) return noDataView;
      return new NoDataView(label: label, onRefresh: onRefresh);
    } else {
      return child;
    }
  }
}
