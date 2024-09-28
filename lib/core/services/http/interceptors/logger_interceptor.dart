import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class LoggerInterceptor extends Interceptor {
  static final _log = Logger('LoggerInterceptor');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log.info('onRequest ${options.method.toUpperCase()}: ${_getRequestInfos(options)}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var logString =
        'onResponse ${response.requestOptions.method.toUpperCase()} ${response.requestOptions.path}: ${_getResponseInfos(response)}';
    if (response.statusCode == 200 || response.statusCode == 201) {
      _log.info(logString);
    } else {
      _log.severe(logString);
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _log.severe(
        'onError ${err.requestOptions.method.toUpperCase()} ${err.requestOptions.path}: ${err.response != null ? _getResponseInfos(err.response!) : err}');
    super.onError(err, handler);
  }

  String _getRequestInfos(RequestOptions data) {
    final method = data.method.toUpperCase();

    if (method == 'GET' || method == 'DELETE') {
      return jsonEncode({
        'url': data.uri.toString(),
        'header': data.headers,
      });
    } else if (method == 'POST' || method == 'PUT') {
      if (data.data is FormData) {
        return jsonEncode({
          'url': data.uri.toString(),
          'header': data.headers,
          'body': (data.data as FormData)
              .fields
              .map((element) => '${element.key}=${element.value}')
              .toList()
              .reduce((value, element) => '$value&$element'),
        });
      } else {
        return jsonEncode({
          'url': data.uri.toString(),
          'header': data.headers,
          'body': data.data,
        });
      }
    } else {
      return '';
    }
  }

  String _getResponseInfos(Response data) {
    final log = jsonEncode({
      'statusCode': data.statusCode,
      'header': data.headers.map,
      if (data.data != null && data.data is! ResponseBody) 'body': data.data,
    });

    return log;
  }
}
