import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:state_management_practice_ostad/core/network_executor/interceptions/core_interceptor.dart';

import '../core/network_executor/interceptions/logger_interceptor.dart';
import 'configurations.dart';

Dio getDioInstance() {
  BaseOptions diooption = BaseOptions(
    baseUrl: Configurations.baseUrl,
    connectTimeout: Configurations.connectionTimeOut,
    sendTimeout: Configurations.sendTimeOut,
    receiveTimeout: Configurations.receiveTimeOut,
    headers: {'token': 'global token', 'content-type': 'application/json'},
  );

  final Dio dio = Dio(diooption);
  List<Interceptor> interceptors = [
    LoggerInterceptor(),
    CoreInterceptor(
      accessToken: Configurations.accessToken,
      basePath: Configurations.baseUrl,
    ),
    RetryInterceptor(
      dio: dio,
      retries: 2,
      retryDelays: [Duration(seconds: 5), Duration(seconds: 10)],
    ),
    //Retry Interceptor
  ];

  dio.interceptors.addAll(interceptors);
  return dio;
}
