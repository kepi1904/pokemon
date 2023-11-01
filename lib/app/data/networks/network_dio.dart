import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'network_interceptor.dart';

class NetworkDio {
  static Dio createDio({
    required bool needAuth,
  }) {
    const String url = "https://pokeapi.co/api/v2";

    final options = BaseOptions(
        baseUrl: url,
        responseType: ResponseType.plain,
        connectTimeout: 60 * 2000,
        receiveTimeout: 60 * 2000);

    Dio dio = Dio(options);
    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
      NetworkInterceptor(dio, needAuth: needAuth)
    ]);

    return dio;
  }
}
