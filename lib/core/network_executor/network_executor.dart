import 'package:dio/dio.dart';

import 'error_mapper/error_mapper.dart';
import 'models/network_response.dart';
import 'models/request_model.dart';

/// Network executor is a class for handling all the http calls

class NetworkExecutor {
  final Dio dio;
  final ErrorMapper errorMapper;

  NetworkExecutor({required this.errorMapper, required this.dio});

  Future<NetworkResponse> getRequest(RequestModel requestModel) async {
    try{
      final Response response = await dio.get(
        requestModel.path,
        queryParameters: requestModel.queryParams,
        options: Options(headers: requestModel.headers),
      );
      return NetworkResponse(
          statusCode: response.statusCode ?? -1, data: response.data);
    } catch (e) {
      return errorMapper.mapError(e as Exception);
    }
  }
}
