import 'package:dio/dio.dart';

import 'package:gradution_app/core/utils/api_keys.dart';

class FailureModel {
  final String errorMessage;
  final int cause;

  FailureModel({
    required this.errorMessage,
    required this.cause,
  });
  factory FailureModel.fromJson(Map<String, dynamic> json) {
    return FailureModel(
        cause: json[ApiKey.cause], errorMessage: json[ApiKey.message]);
  }
}

class ServerFailure implements Exception {
  final FailureModel failure;

  ServerFailure({required this.failure});
}

ServerFailure handelDioException(DioException dioException) {
  switch (dioException.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.badResponse:
      switch (dioException.response!.statusCode) {
        case 400:
          throw ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 401:
          throw ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 403:
          throw ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 404:
          throw ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 409:
          throw ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 422:
          throw ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        case 504:
          throw ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        default:
          throw ServerFailure(
              failure: FailureModel.fromJson(dioException.response!.data));
        // if (dioException.response?.data is Map<String, dynamic>) {
        //   throw ServerFailure(
        //       failure: FailureModel.fromJson(dioException.response!.data));
        // } else if (dioException.response?.data is String) {
        //   // Handle the case when data is a string (might be an error message)
        //   throw ServerFailure(
        //       failure:
        //           FailureModel(errorMessage: dioException.response!.data));
        // } else {
        //   // Handle other cases if necessary
        //   throw ServerFailure(
        //       failure: FailureModel(errorMessage: "Unknown error"));
        // }
      }
    case DioExceptionType.cancel:
      throw ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.connectionError:
      throw ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.unknown:
      if (dioException.message!.contains('SocketException')) {
        throw ServerFailure(
            failure: FailureModel.fromJson(dioException.response!.data));
      }
      throw ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
    default:
      throw ServerFailure(
          failure: FailureModel.fromJson(dioException.response!.data));
  }
}
