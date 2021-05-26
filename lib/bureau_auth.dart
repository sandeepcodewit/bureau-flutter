import 'dart:async';

import 'package:flutter/services.dart';

class BureauAuth {
  static const MethodChannel _channel = const MethodChannel('bureau_auth');

  static Future<void> authenticate
      (
      String correlationId, String mobileNumber,int mode,String clientId,String callbackUrl,bool useFinalize)
  async {
   /* print('correlationId $correlationId');
    print('mobileNumber $mobileNumber');
    print('mode $mode');
    print('clientId $clientId');
    print('callbackUrl $callbackUrl');
    print('useFinalize $useFinalize');*/
     await _channel
        .invokeMethod('authenticate', {'correlationId':correlationId, 'mobileNumber':mobileNumber,'mode':mode
       ,'clientId':clientId,'callbackUrl':callbackUrl,'useFinalize':useFinalize}
        );
    //return authenticationStatus;
  }
 /* Mode mode;
  String clientId;
  String host;
  int timeoutInMs;
  String callbackUrl;
  bool useFinalize;*/
/*
  BureauAuth(Mode mode, String clientId, int timeoutInMs, String callbackUrl,
      bool useFinalize) {
    if (null == mode) {
      this.mode = Mode.Production;
    } else {
      this.mode = mode;
    }
    switch (this.mode) {
      case Mode.Sandbox:
        host = "api.sandbox.bureau.id";
        break;
      default:
        host = "api.bureau.id";
        break;
    }
    this.clientId = clientId;
    if (timeoutInMs < 1) {
      this.timeoutInMs = 4 * 1000; //4sec
    } else {
      this.timeoutInMs = timeoutInMs;
    }
    callbackUrl = null == callbackUrl ? null : callbackUrl.trim();
    this.callbackUrl = null == callbackUrl
        ? null
        : callbackUrl.length == 0
        ? null
        : callbackUrl;
    this.useFinalize = useFinalize;
  }*/
}

/*
enum Mode { Sandbox, Production }
*/
/*
enum AuthenticationStatus {
  Completed,
  NetworkUnavailable,
  OnDifferentNetwork,
  ExceptionOnAuthenticate,
  UnknownState
}

extension AuthenticationStatusExtension on AuthenticationStatus {
  String get getMessage {
    switch (this) {
      case AuthenticationStatus.Completed:
        return 'Authentication flow completed';
      case AuthenticationStatus.NetworkUnavailable:
        return 'Mobile network is not available';
      case AuthenticationStatus.OnDifferentNetwork:
        return 'Device is using a different network';
      case AuthenticationStatus.ExceptionOnAuthenticate:
        return 'Exception occurred while trying to authenticate';
      case AuthenticationStatus.UnknownState:
        return 'Unknown authentication state';
      default:
        return null;
    }
  }
}

class Builder {
  Mode mode;
  String clientId;
  int timeOutInMs;
  String callbackUrl;
  bool useFinalize;

  Builder _mode(Mode mode) {
    this.mode = mode;
    return this;
  }

  Builder _clientId(String clientId) {
    this.clientId = clientId;
    return this;
  }

  Builder _timeOutInMs(int timeOutInMs) {
    this.timeOutInMs = timeOutInMs;
    return this;
  }

  Builder _callbackUrl(String callbackUrl) {
    this.callbackUrl = callbackUrl;
    return this;
  }

  Builder _useFinalize(bool useFinalize) {
    this.useFinalize = useFinalize;
    return this;
  }

  BureauAuth build() {
    return new BureauAuth(
        mode, clientId, timeOutInMs, callbackUrl, useFinalize);
  }
}*/

