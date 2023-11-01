import 'dart:developer';

import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/foundation.dart';

import '../shared_preference/shared_preference.dart';

class NetworkInterceptor extends Interceptor {
  Dio refreshDio = Dio();
  bool needAuth;
  Dio previous;

  NetworkInterceptor(this.previous, {this.needAuth = false});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    String? tokens = await PreferenceHandler.retrieveToken();
    var accessToken = tokens;

    if (needAuth) {
      String? token = await PreferenceHandler.retrieveToken();
      log('access Token: $accessToken');
      options.headers["Authorization"] = "Bearer $token";
    } else {
      options.headers["Authorization"] = accessToken;
    }
    options.headers["Accept"] = "application/json";

    if (options.data != null) {
      if (options.data is! FormData) {
        options.headers["Content-Type"] = "application/json";
      }
    } else {
      options.headers["Content-Type"] = "application/json";
    }
    if (kDebugMode) {
      print('OPTIONS $options');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // ResponseAPi error = ResponseAPi.fromJson(err.response!.data);
    // Snackbar.warning(error.message ?? 'Unknown');
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    // if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
    //   logout();
    // }
    return super.onError(err, handler);
  }
}
