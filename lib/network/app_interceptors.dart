import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors({required this.dio});
  final _cache = <Uri, Response>{};
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO: implement onRequest
    super.onRequest(options, handler);

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _cache[response.requestOptions.uri] = response;
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response!.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException("Unauthorized", err.requestOptions);
          case 403:
            throw UnauthorizedException("Permission Deny", err.requestOptions);
          case 500:
            throw NoQueryResultException("Internal Server Error", err.requestOptions);
          case 422:
            throw ValidationErrorException("Invalid Input", err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);
      default:
    }
    return handler.next(err);
  }
}

class ValidationErrorException extends DioError {
  String message;
  ValidationErrorException(this.message, r) : super(requestOptions: r);

  @override
  String toString() {
    return message;
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  String message;
  UnauthorizedException(this.message, r) : super(requestOptions: r);

  @override
  String toString() {
    return message;
  }
}

class NoQueryResultException extends DioError {
  String message;
  NoQueryResultException(this.message, r) : super(requestOptions: r);

  @override
  String toString() {
    return message;
  }
}

class WrongPasswordException extends DioError {
  WrongPasswordException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    // TODO: implement toString
    return 'Your Password was not Correct';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
