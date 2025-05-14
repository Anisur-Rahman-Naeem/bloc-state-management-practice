import 'package:dio/dio.dart';

import 'configurations.dart';

Dio getDioInstance() {
  BaseOptions diooption = BaseOptions(
    baseUrl: Configurations.baseUrl,
    connectTimeout: Configurations.connectionTimeOut,
    sendTimeout: Configurations.sendTimeOut,
    receiveTimeout: Configurations.receiveTimeOut,
    headers: {
      'token' : 'global token',
      'content-type' : 'application/json'
    },

  );

  final Dio dio = Dio(diooption);
  return dio;
}