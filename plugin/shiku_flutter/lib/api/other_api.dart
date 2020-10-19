import 'package:shiku_flutter/http/req.dart';
import 'package:shiku_flutter/model/api_config_model.dart';

class OtherApi {
  /*
  * 获取服务器时间戳
  * */
  static Future get getCurrentTime async {
    var result =  await Req().get(
      url: ApiConfigModel.apiUrl + 'getCurrentTime',
    );
    return result;
  }
}
