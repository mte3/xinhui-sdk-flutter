library jh_im_sdk;

export 'package:jh_im_sdk/common/check.dart';
export 'package:jh_im_sdk/data/data.dart';
export 'package:jh_im_sdk/http/base_request.dart';
export 'package:jh_im_sdk/http/http.dart';
export 'package:jh_im_sdk/util/service_url.dart';
export 'package:jh_im_sdk/widget_common/data/loading_view.dart';
export 'package:jh_im_sdk/widget_common/data/no_data_view.dart';
export 'package:jh_im_sdk/common/win_media.dart';
export 'package:jh_im_sdk/common/ui.dart';
export 'package:jh_im_sdk/common/global_variable.dart';
export 'package:jh_im_sdk/widget_common/bar/navigation_bar.dart';
export 'package:jh_im_sdk/widget_common/view/show_toast.dart';
export 'package:jh_im_sdk/widget_common/button/small_button.dart';
export 'package:jh_im_sdk/widget_common/dialog/confirm_alert.dart';
export 'package:jh_im_sdk/widget_common/view/field_view.dart';
export 'package:jh_im_sdk/widget_common/view/main_input.dart';
export 'package:jh_im_sdk/widget_common/tile/label_tile.dart';
export 'package:jh_im_sdk/page/settings/settings_page.dart';

export 'package:nav_router/nav_router.dart';

String packageName = 'jh_im_sdk';

/// 回调
typedef Callback(data);
typedef VoidCallbackConfirm = void Function(bool isOk);