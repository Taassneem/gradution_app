import 'package:dio/dio.dart';
import 'package:gradution_app/core/utils/api_keys.dart';

class FailureModel {
  final String errorMessage;

  FailureModel({required this.errorMessage});
  factory FailureModel.fromJson(Map<String, dynamic> json) {
    return FailureModel(errorMessage: json[ApiKey.message]);
  }
}

class ServerFailure implements Exception {
  final FailureModel failure;

  ServerFailure({required this.failure});
}

ServerFailure handelDioException(DioException dioException) {
  switch (dioException.type) {
    case DioExceptionType.connectionTimeout:
      return ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.sendTimeout:
      return ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.receiveTimeout:
      return ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.badResponse:
      switch (dioException.response!.statusCode) {
        case 400:
          return ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 401:
          return ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 403:
          return ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 404:
          return ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 409:
          return ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 422:
          return ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 504:
          return ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        default:
          if (dioException.response?.data is Map<String, dynamic>) {
            return ServerFailure(
                failure: FailureModel.fromJson(dioException.response!.data));
          } else if (dioException.response?.data is String) {
            // Handle the case when data is a string (might be an error message)
            return ServerFailure(
                failure:
                    FailureModel(errorMessage: dioException.response!.data));
          } else {
            // Handle other cases if necessary
            return ServerFailure(
                failure: FailureModel(errorMessage: "Unknown error"));
          }
      }
    case DioExceptionType.cancel:
      return ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.connectionError:
      return ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.unknown:
      if (dioException.message!.contains('SocketException')) {
        return ServerFailure(
            failure: FailureModel.fromJson(dioException.response!.data));
      }
      return ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.badCertificate:
      return ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    default:
      return ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
  }
}
