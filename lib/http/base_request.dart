import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jh_im_sdk/http/api.dart';
import 'package:jh_im_sdk/http/progress_dialog.dart';
import 'package:jh_im_sdk/common/hud_view.dart';

/// 创建者：王增阳
/// 开发者：王增阳
/// 版本：1.0
/// 创建日期：2020-02-19
///
typedef OnData(t);
typedef OnError(String msg, int code);

class BaseRequest {
  String url() => null;
  bool doPost() => true;
  bool retJson() => true;
  Duration cacheTime() => null;
  bool needLogin() => false;
  Map<String, dynamic> toJson() => {};

  bool requestPost;

  Future<dynamic> sendApiAction(BuildContext context, requestPost,
      {postType, hud, OnData onData, OnError onError}) async {
//     final ls = hud != null ? DefaultStatusListener(hud:hud) : EmptyListener();
//
//     ls.onStart();

    if (context != null && hud != null) {
      HudView.show(context, msg: hud);
    }

    var result = await api(
        this.url(), requestPost, this.retJson(), this, this.cacheTime());

    if (context != null && hud != null) {
      HudView.dismiss();
    }

//     ls.onFinish();

//     if(result is String && result.contains('::')){
//       List data = result.toString().split('::');
//       if(data.length == 3){
//         if(onError != null){
//           onError(data[1], int.parse(data[0].toString()));
//         }
//         throw ResponseModel.fromError(data[1], int.parse(data[0].toString()));
//       }
//     }

    return result;
  }

  sendApi({TaskStatusListener listener, OnData onData, OnError onError}) {
    this.sendByFuture(
      api(this.url(), this.doPost(), this.retJson(), this, this.cacheTime()),
      listener: listener,
      onData: onData,
      onError: onError,
    );
  }

  sendByFuture(
    Future future, {
    TaskStatusListener listener,
    OnData onData,
    OnError onError,
  }) {
    this.send(future, listener: listener, onData: onData, onError: onError);

    return future;
  }

  send(Future observable,
      {TaskStatusListener listener, OnData onData, OnError onError}) {
    final ls = listener ?? EmptyListener();

    ls.onStart();

    observable.then(
      (data) {
        final canCall = () => true && onData != null;
        if (canCall()) Timer.run(() => canCall() ? onData(data) : null);
      },
      onError: (e, s) {
        List data = e.toString().split('::');

        if (data.length != 3) {
          return;
        }

//            errLog(e, s);

        if (onError != null) {
          Timer.run(
            () => onError(data[1], int.parse(data[0].toString())),
          );
        } else if (e is AuthError) {
//          clearLoginInfo();
//          toLogin(context, err);
        }
      },
    )..whenComplete(ls.onFinish);
  }
}

class EmptyListener extends TaskStatusListener {
  @override
  void onFinish() {}

  @override
  void onStart() {}
}

class DefaultStatusListener extends TaskStatusListener {
  final String hud;

  DefaultStatusListener({this.hud});

  @override
  onFinish() {
    ProgressOverlay.hidden();
  }

  @override
  onStart() {
    ProgressOverlay.show(hud: hud);
  }
}

abstract class TaskStatusListener {
  void onStart();

  void onFinish();
}

class AuthError extends Error {
  @override
  String toString() {
    return '登录状态已失效';
  }
}
