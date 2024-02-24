import 'package:dio/dio.dart';
import 'package:gradution_app/core/utils/api_keys.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class FailureString extends Failure {
  FailureString(super.errorMessage);
  factory FailureString.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return FailureString(
          'Connection timed out with ApiServer',
        );
      case DioExceptionType.sendTimeout:
        return FailureString(
          'Send timed out with ApiServer',
        );
      case DioExceptionType.receiveTimeout:
        return FailureString(
          'Receiver timed out with ApiServer',
        );

      case DioExceptionType.badResponse:
        return FailureString.fromBadResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return FailureString(
          'Request with ApiServer was canceled',
        );
      case DioExceptionType.connectionError:
        return FailureString(
          'Connection error',
        );
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return FailureString('No Internet connection');
        }
        return FailureString(
          'Unexpected error, please try later',
        );
      case DioExceptionType.badCertificate:
        return FailureString(
          'Somthing went wrong',
        );
      default:
        return FailureString('OOPS! Something went wrong, please try later.');
    }
  }
  factory FailureString.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return FailureString(response[ApiKey.message]);
    } else if (statusCode == 404) {
      return FailureString('Your request not found, please try later.');
    } else if (statusCode == 500) {
      return FailureString('Internal server error, please try later.');
    } else {
      return FailureString('OOPS! Something went wrong, please try later.');
    }
  }
}
