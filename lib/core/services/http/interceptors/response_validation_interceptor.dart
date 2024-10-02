import 'package:dio/dio.dart';
import 'package:pokedex_scaffold/core/services/http/http_exceptions.dart';

class ResponseValidationInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Validating application protocol response
      // (response.data has type specified during the rest call. Default is a map specified by ResponseType.json)
      // if (response.data .....) {
      //   throw BadRequestException(
      //     requestOptions: response.requestOptions,
      //     response: response,
      //     message: 'Error validating response',
      //   );
      // }
    }

    // DEBUG
    // throw DioException(requestOptions: response.requestOptions, error: const SocketException('PROVA'));

    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    var error = err;

    // final connectivityStatus = await Connectivity().checkConnectivity();

    // if (!connectivityStatus.contains(ConnectivityResult.ethernet) &&
    //     !connectivityStatus.contains(ConnectivityResult.wifi) &&
    //     !connectivityStatus.contains(ConnectivityResult.mobile)) {
    //   error = NetworkUnavailableException(
    //     error: error.error,
    //     message: error.message,
    //     response: error.response,
    //     stackTrace: error.stackTrace,
    //     requestOptions: error.requestOptions,
    //   );
    // } else
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      error = TimeoutException(
        error: error.error,
        message: error.message,
        response: error.response,
        stackTrace: error.stackTrace,
        requestOptions: error.requestOptions,
      );
    } else if (err.response != null) {
      switch (err.response!.statusCode) {
        case 400:
          error = BadRequestException(
            error: error.error,
            message: error.message,
            response: error.response,
            stackTrace: error.stackTrace,
            requestOptions: error.requestOptions,
          );
          break;
        case 401:
        case 403:
          error = UnauthorizedException(
            error: error.error,
            message: error.message,
            response: error.response,
            stackTrace: error.stackTrace,
            requestOptions: error.requestOptions,
          );
          break;
        case 503:
          error = ServiceUnavailableException(
            error: error.error,
            message: error.message,
            response: error.response,
            stackTrace: error.stackTrace,
            requestOptions: error.requestOptions,
          );
          break;
        case 500:
        default:
          error = FetchDataException(
            error: error.error,
            message: error.message,
            response: error.response,
            stackTrace: error.stackTrace,
            requestOptions: error.requestOptions,
          );
          break;
      }
    }

    super.onError(error, handler);
  }
}
