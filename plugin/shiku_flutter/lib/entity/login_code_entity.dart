/// **************************************************************************
/// 来自金慧科技Json转Dart工具
/// **************************************************************************

class LoginCodeEntity {
  final int currentTime;
  final Data data;
  final int resultCode;

  LoginCodeEntity({
    this.currentTime,
    this.data,
    this.resultCode,
  });

  factory LoginCodeEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginCodeEntityFromJson(json);

  LoginCodeEntity from(Map<String, dynamic> json) =>
      _$LoginCodeEntityFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentTime'] = this.currentTime;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['resultCode'] = this.resultCode;
    return data;
  }
}

LoginCodeEntity _$LoginCodeEntityFromJson(Map<String, dynamic> json) {
  return LoginCodeEntity(
    currentTime: json['currentTime'],
    data: json['data'] != null ? new Data.fromJson(json['data']) : null,
    resultCode: json['resultCode'],
  );
}

class Data {
  final String code;
  final String userId;

  Data({
    this.code,
    this.userId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data from(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['userId'] = this.userId;
    return data;
  }
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    code: json['code'],
    userId: json['userId'],
  );
}
