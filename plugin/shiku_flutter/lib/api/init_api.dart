import 'package:shiku_flutter/http/req.dart';
import 'package:shiku_flutter/model/api_config_model.dart';
import 'package:shiku_flutter/tools/util.dart';

class InitApi {
  /*
  * 初始化
  * */
  static Future<String> config(String url) async {
    try {
      Map resultData = await Req().get(url: url + '/config');
      ApiConfigModel().setValue(resultData['data']);
      if (!strNoEmpty(ApiConfigModel.apiUrl)) {
        return 'config faild';
      } else {
        return 'config success';
      }
    } catch (e) {
      return 'config faild';
    }
  }
}
