import 'package:dio/dio.dart';
import 'package:gradution_app/core/api/api_interceptors.dart';
import 'package:gradution_app/core/errors/server_failure.dart';
import 'package:gradution_app/core/api/api_consumer.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.interceptors.add(LogInterceptor(
      request: true,
      error: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    dio.interceptors.add(ApiInterceptors());
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      Response response = await dio.post(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future<dynamic> get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final respose = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return respose.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future<dynamic> delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final respose = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return respose.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future<dynamic> pacth(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      final respose = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return respose.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }
}
