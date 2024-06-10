import 'package:dio/dio.dart';

import 'failure.dart';

class ErrorHandler {
  late Failure failure;

  ErrorHandler.handle(Exception error) {
    if (error is DioException) {
      failure = _handleDioError(error);
    } else {
      failure = Failure(ResponseCode.unKnown, error.toString().substring(11));
    }
  }

  Failure _handleDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorType.connectionTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return ErrorType.sendTimeOut.getFailure();
      case DioExceptionType.receiveTimeout:
        return ErrorType.receiveTimeOut.getFailure();
      case DioExceptionType.badCertificate:
        return ErrorType.badCertificate.getFailure();
      case DioExceptionType.cancel:
        return ErrorType.cancel.getFailure();
      case DioExceptionType.badResponse:
        {
          if (dioException.response?.statusMessage != null && dioException.response?.statusCode != null) {
            final String message = _getErrorMessage(dioException.response!);
            return Failure(dioException.response!.statusCode!, message);
          } else {
            return ErrorType.unKnown.getFailure();
          }
        }
      case DioExceptionType.connectionError:
        return ErrorType.noInternetConnection.getFailure();
      case DioExceptionType.unknown:
        return ErrorType.unKnown.getFailure();
      default:
        return ErrorType.unKnown.getFailure();
    }
  }

  String _getErrorMessage(Response response) {
    switch (response.statusCode) {
      case ResponseCode.unauthorized:
        return ResponseMessage.unauthorized;
      default:
        return response.data["message"].toString();
    }
  }
}

enum ErrorType {
  cancel,
  connectionTimeout,
  receiveTimeOut,
  sendTimeOut,
  noInternetConnection,
  badCertificate,
  unauthorized,
  unKnown,
}

extension ErrorTypeException on ErrorType {
  Failure getFailure() {
    switch (this) {
      case ErrorType.connectionTimeout:
        return Failure(ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);
      case ErrorType.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case ErrorType.receiveTimeOut:
        return Failure(ResponseCode.receiveTimeOut, ResponseMessage.receiveTimeOut);
      case ErrorType.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case ErrorType.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection);
      case ErrorType.badCertificate:
        return Failure(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection);
      case ErrorType.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case ErrorType.unKnown:
        return Failure(ResponseCode.unKnown, ResponseMessage.unKnown);
    }
  }
}

class ResponseCode {
  static const int cancel = -1;
  static const int connectTimeOut = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int noInternetConnection = -5;
  static const int badCertificate = -6;
  static const int unKnown = -7;

  static const int unauthorized = 403;
}

class ResponseMessage {
  static const String cancel = "Request was cancelled, try again.";
  static const String connectTimeOut = "Time out error, try again.";
  static const String receiveTimeOut = "Receive time error, try again.";
  static const String sendTimeOut = "Time out error, try again.";
  static const String noInternetConnection = "Please check your internet connection.";
  static const String badCertificate = "Error validating certificate, try again later.";
  static const String unKnown = "Something went wrong, try again.";
  static const String unauthorized = "Unauthorized !!";
}
