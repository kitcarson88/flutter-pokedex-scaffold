import 'package:dio/dio.dart';

class CommonHeadersInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Accept': 'application/json',
      'Content-type': 'application/json',
    });

    super.onRequest(options, handler);
  }
}
