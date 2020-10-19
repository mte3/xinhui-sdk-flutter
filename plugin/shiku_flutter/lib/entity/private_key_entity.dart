/// **************************************************************************
/// 来自金慧科技Json转Dart工具
/// **************************************************************************

class PrivateKeyEntity {
  final int currentTime;
  final Data data;
  final int resultCode;

  PrivateKeyEntity({
    this.currentTime,
    this.data,
    this.resultCode,
  });

  factory PrivateKeyEntity.fromJson(Map<String, dynamic> json) =>
      _$PrivateKeyEntityFromJson(json);

  PrivateKeyEntity from(Map<String, dynamic> json) =>
      _$PrivateKeyEntityFromJson(json);

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

PrivateKeyEntity _$PrivateKeyEntityFromJson(Map<String, dynamic> json) {
  return PrivateKeyEntity(
    currentTime: json['currentTime'],
    data: json['data'] != null ? new Data.fromJson(json['data']) : null,
    resultCode: json['resultCode'],
  );
}

class Data {
  final String privateKey;

  Data({
    this.privateKey,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Data from(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privateKey'] = this.privateKey;
    return data;
  }
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    privateKey: json['privateKey'],
  );
}
