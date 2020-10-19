import 'dart:convert' show jsonDecode;
import 'dart:io';

import 'package:jh_im_sdk/data/store.dart';
export 'package:jh_im_sdk/data/store.dart';

export 'notice.dart';

/// 创建者：王增阳
/// 开发者：王增阳
/// 版本：1.0
/// 创建日期：2020-02-19
///
class ShopActions {

  static String delPublicToListPublic() => 'delPublicToListPublic';

  static String toTabBarIndex() => 'toTabBarIndex';

  static String toTab(int index) => 'toTab$index';

  static String token() => 'token';

  static String userId() => 'userId';

  static String userName() => 'userName';

  static String refreshMerchantInfo() => 'refreshMerwchantInfo';

  static String goodsStatusRefresh() => 'goodsStatusRefresh';

  static String searchHistory() => 'searchHistory';

  static String isLogin() => 'isLogin';

  static String loginResult() => 'loginResult';

  static String inviteCode() => 'inviteCode';

  static String userIcon() => 'userIcon';

  static String userPhone() => 'userPhone';

  static String isSensitive() => 'isSensitive';

  static String platformInfo() => 'platformInfo';

  static String appVersion() => 'appVersion';
}

typedef Finish();

class Data {
  static initStore({Finish finish}) {
    Store(ShopActions.isLogin()).value = false;

    Store(ShopActions.isSensitive()).value = Platform.isAndroid ? true : false;

    getStoreValue(ShopActions.token()).then((v) {
      Store(ShopActions.token()).value = v;
      print('user.token => ${Data.token() ?? ' status :is not login yet'}');
    });
    getStoreValue(ShopActions.loginResult()).then((onValue) {
      if (onValue != null) {
        Map data = jsonDecode(onValue);
        Store(ShopActions.isLogin()).value = true;
        Store(ShopActions.userId()).value = data['Id'];
        Store(ShopActions.inviteCode()).value = data['InviteCode'];
        Store(ShopActions.userIcon()).value = data['Avatar'];
        Store(ShopActions.userName()).value = data['Username'];
        Store(ShopActions.userPhone()).value = data['PhoneNumber'];
        Store(ShopActions.loginResult()).value = data;
        if (finish != null) {
          finish();
        }
      }
    });
  }

  static String userId() => Store(ShopActions.userId()).value;

  static String token() => Store(ShopActions.token()).value ?? '';

  static String userIcon() => Store(ShopActions.userIcon()).value;

  static bool isLogin() => Store(ShopActions.isLogin()).value ?? false;

  static String inviteCode() =>
      Store(ShopActions.inviteCode()).value ?? '111111';

  static String userName() => Store(ShopActions.userName()).value ?? '';

  static String userPhone() => Store(ShopActions.userPhone()).value ?? '';

  static String appVersion() => Store(ShopActions.appVersion()).value ?? '';

  static bool isSensitive() => Platform.isAndroid
      ? true
      : Store(ShopActions.isSensitive()).value ?? false;
}
