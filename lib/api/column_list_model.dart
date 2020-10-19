import 'package:jh_im_sdk/util/tools.dart';
import 'package:jh_im_sdk/http/base_request.dart';

/// 创建者：王增阳
/// 开发者：王增阳
/// 版本：1.0
/// 创建日期：2020-02-19
///
/// 请求Model (只做示例)
class ColumnListRequestModel extends BaseRequest {
  final int columnId;
  final int pageNum;
  final String seoTag;

  ColumnListRequestModel({
    this.columnId,
    this.pageNum,
    this.seoTag,
  });

  @override
  String url() => 'app/column/list';

  Map<String, dynamic> toJson() => _$ColumnListRequestModelToJson(this);
}

Map<String, dynamic> _$ColumnListRequestModelToJson(
    ColumnListRequestModel instance) {
  return <String, dynamic>{
    'columnId': instance.columnId,
    'pageNum': instance.pageNum,
    'seoTag': instance.seoTag,
  };
}

/// ignore_for_file: non_constant_identifier_names,library_prefixes

/// **************************************************************************
/// 来自金慧科技Json转Dart工具
/// **************************************************************************

/*
* 响应Model
*
* @param int columnId 资讯id
* @param String title 文章标题
* @param String miniContent 大概内容
* @param String firstImg 第一张图片
* @param int readCount 阅读次数
* @param int customerId 创建人id
* @param String recommend 推荐0 默认 1 推荐
* @param int commentCount 评论人数
* @param int supportCount 支持人数
* @param String authType 0未认证 1认证
* @param String keyWords 关键词
* @param String seoTag 专栏所属类型
* @param int createDate 创建日期
* @param String userName 用户名
* @param String headImg 头像地址
* @param bool attentionTag 是否已关注 true 已关注 false 没关注
* */
class InformationDetail {
  final int columnId;
  final String title;
  final int createDate;
  final String miniContent;
  final String firstImg;
  final int readCount;
  final int customerId;
  final int commentCount;
  final int supportCount;
  final String authType;
  final String seoTag;
  final String userName;
  final String headImg;
  final String collectStatus;
  final bool attentionTag;

  InformationDetail({
    this.columnId,
    this.title,
    this.createDate,
    this.miniContent,
    this.firstImg,
    this.readCount,
    this.customerId,
    this.commentCount,
    this.supportCount,
    this.authType,
    this.seoTag,
    this.userName,
    this.headImg,
    this.collectStatus,
    this.attentionTag,
  });

  factory InformationDetail.fromJson(Map<String, dynamic> json) =>
      _$InformationDetailFromJson(json);

  InformationDetail from(Map<String, dynamic> json) =>
      _$InformationDetailFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columnId'] = this.columnId;
    data['title'] = this.title;
    data['miniContent'] = this.miniContent;
    data['firstImg'] = this.firstImg;
    data['readCount'] = this.readCount;
    data['customerId'] = this.customerId;
    data['commentCount'] = this.commentCount;
    data['supportCount'] = this.supportCount;
    data['authType'] = this.authType;
    data['seoTag'] = this.seoTag;
    data['createDate'] = this.createDate;
    data['userName'] = this.userName;
    data['headImg'] = this.headImg;
    data['attentionTag'] = this.attentionTag;

    return data;
  }
}

InformationDetail _$InformationDetailFromJson(Map<String, dynamic> json) {
  return InformationDetail(
    columnId: json['columnId'],
    title: json['title'],
    createDate: json['createDate'],
    miniContent: json['miniContent'],
    firstImg: json['firstImg'],
    readCount: json['readCount'],
    customerId: json['customerId'],
    commentCount: json['commentCount'],
    supportCount: json['supportCount'],
    authType: json['authType'],
    seoTag: json['seoTag'],
    userName: json['userName'],
    headImg: json['headImg'],
    collectStatus: json['collectStatus'],
    attentionTag: json['attentionTag'],
  );
}
