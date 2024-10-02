import 'package:dio/dio.dart';

class HttpException extends DioException {
  HttpException({
    required super.requestOptions,
    super.error,
    super.response,
    super.stackTrace,
    super.message,
  });
}

// 400 Bad Request
class BadRequestException extends HttpException {
  BadRequestException({
    required super.requestOptions,
    String? message,
    super.error,
    super.response,
    super.stackTrace,
  }) : super(message: 'Bad request: $message');
}

// 404 Not Found
class NotFoundException extends HttpException {
  NotFoundException({
    required super.requestOptions,
    String? message,
    super.error,
    super.response,
    super.stackTrace,
  }) : super(message: 'Not Found: $message');
}

// 401 Unauthorized, 403 Forbidden
class UnauthorizedException extends HttpException {
  UnauthorizedException({
    required super.requestOptions,
    String? message,
    super.error,
    super.response,
    super.stackTrace,
  }) : super(message: 'Unauthorized Request: $message');
}

// 500 Internal Server Error
class FetchDataException extends HttpException {
  FetchDataException({
    required super.requestOptions,
    String? message,
    super.error,
    super.response,
    super.stackTrace,
  }) : super(message: 'Error During Communication: $message');
}

// 503 Service Unavailable
class ServiceUnavailableException extends HttpException {
  ServiceUnavailableException({
    required super.requestOptions,
    String? message,
    super.error,
    super.response,
    super.stackTrace,
  }) : super(message: 'Service Unavailable: $message');
}

class ParsingDataException extends HttpException {
  ParsingDataException({
    required super.requestOptions,
    String? message,
    super.error,
    super.response,
    super.stackTrace,
  }) : super(message: 'Error parsing data: $message');
}

class TimeoutException extends HttpException {
  TimeoutException({
    required super.requestOptions,
    String? message,
    super.error,
    super.response,
    super.stackTrace,
  }) : super(message: 'Timeout occured: $message');
}

class NetworkUnavailableException extends HttpException {
  NetworkUnavailableException({
    required super.requestOptions,
    String? message,
    super.error,
    super.response,
    super.stackTrace,
  }) : super(message: 'Network unavailable: $message');
}
