import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jh_im_sdk/api/column_list_model.dart';
export 'package:jh_im_sdk/api/column_list_model.dart';
import 'package:jh_im_sdk/http/base_view_model.dart';
export 'package:jh_im_sdk/http/base_view_model.dart';

/// 创建者：王增阳
/// 开发者：王增阳
/// 版本：1.0
/// 创建日期：2020-02-19
///
/// 等后端制定规范后统一封装返回消息，数据格式下标等
ColumnListViewModel columnListViewModel = new ColumnListViewModel();

/// ViewModel
class ColumnListViewModel extends BaseViewModel {
  Future<ResponseModel> getColumnList(
    BuildContext context, {
    int columnId,
    int pageNum,
    String seoTag,
  }) async {
    ResponseModel responseModel = await new ColumnListRequestModel(
      columnId: columnId,
      pageNum: pageNum,
      seoTag: seoTag,
    ).sendApiAction(context, true).then((rep) {
      Map data = rep['data'];
      List list = data['list'];
      List _dataList = dataModelListFromJson(list, new InformationDetail());
      return ResponseModel.fromSuccess(_dataList);
    }).catchError((e) {
      print('e==> ${e.toString()}');
      throw ResponseModel.fromError(e.message, e.code);
    });

    return responseModel;
  }

  /// 其他方法写下面，包括View层的执行方法
}
