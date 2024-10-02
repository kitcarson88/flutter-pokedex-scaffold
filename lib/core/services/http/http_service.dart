import 'dart:convert';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_scaffold/core/base/base_http_service.dart';
import 'package:pokedex_scaffold/core/services/http/interceptors/common_headers_interceptor.dart';
import 'package:pokedex_scaffold/core/services/http/interceptors/logger_interceptor.dart';
import 'package:pokedex_scaffold/core/services/http/interceptors/response_validation_interceptor.dart';
import 'package:pokedex_scaffold/core/services/http/interceptors/timeout_and_auth_retry_interceptor.dart';

class ExtraParameters {
  final ResponseType? clientResponseType;
  final List<Interceptor>? overriddenInterceptors;
  final bool? deactivateInterceptors;
  final bool? deactivateRetryPolicy;
  final bool? deactivateIsolateResponseParse;

  ExtraParameters({
    this.clientResponseType,
    this.overriddenInterceptors,
    this.deactivateInterceptors,
    this.deactivateRetryPolicy,
    this.deactivateIsolateResponseParse,
  });
}

class HttpService extends BaseHttpService {
  static const _kServiceConnectTimeout = Duration(milliseconds: 3000);
  static const _kServiceReceiveTimeout = Duration(milliseconds: 3000);

  @override
  Future doCall({
    required String url,
    required MethodType method,
    Map<String, String>? header,
    Object? body,
    dynamic extraParameters,
  }) async {
    final parameters = extraParameters as ExtraParameters?;

    final dio = getDioClient(parameters);

    Response response;
    switch (method) {
      case MethodType.get:
        response = await dio.get(
          url,
          options: Options(
              headers: header, responseType: parameters?.clientResponseType ?? ResponseType.json),
        );
        break;
      case MethodType.post:
        response = await dio.post(
          url,
          data: body,
          options: Options(
              headers: header, responseType: parameters?.clientResponseType ?? ResponseType.json),
        );
        break;
      case MethodType.delete:
        response = await dio.delete(
          url,
          options: Options(
              headers: header, responseType: parameters?.clientResponseType ?? ResponseType.json),
        );
        break;
      case MethodType.put:
        response = await dio.put(
          url,
          data: body,
          options: Options(
              headers: header, responseType: parameters?.clientResponseType ?? ResponseType.json),
        );
        break;
    }

    return response;
  }

  @override
  transformResponse<RawResponse, TransformedResponse>(
    RawResponse response,
    TransformedResponse? value,
    TransformedResponse Function(dynamic p1)? converter,
    dynamic extraParameters,
  ) {
    final parsedResponse = response as Response;
    final parameters = extraParameters as ExtraParameters?;

    if (parameters?.clientResponseType == ResponseType.stream) {
      return response;
    } else {
      // Client response will be a Map or a List of Map objects
      dynamic clientResponse;

      if (parameters?.clientResponseType == ResponseType.bytes) {
        clientResponse = jsonDecode(utf8.decode(parsedResponse.data));
      } else if (parameters?.clientResponseType == ResponseType.plain) {
        clientResponse = jsonDecode(parsedResponse.data);
      } else {
        clientResponse = parsedResponse.data;
      }

      if (converter != null) {
        return converter(clientResponse);
      } else if (value is Map || value is List) {
        return clientResponse;
      } else {
        return response;
      }
    }
  }

  static Dio getDioClient([ExtraParameters? parameters]) {
    final options = BaseOptions(
      connectTimeout: _kServiceConnectTimeout,
      receiveTimeout: _kServiceReceiveTimeout,
      receiveDataWhenStatusError: true,
    );
    final dio = Dio(options);

    if (parameters?.deactivateInterceptors == null || !parameters!.deactivateInterceptors!) {
      dio.interceptors.addAll(parameters?.overriddenInterceptors ??
          [
            CommonHeadersInterceptor(),
            CurlLoggerDioInterceptor(
              printOnSuccess: true,
            ),
            LoggerInterceptor(),
            ResponseValidationInterceptor(),
          ]);
    }

    if (parameters?.deactivateRetryPolicy == null || !parameters!.deactivateRetryPolicy!) {
      dio.interceptors.add(
        TimeoutAndAuthRetryInterceptor(dio: dio),
      );
    }

    // if (F.isDev()) {
    //   (dio.httpClientAdapter as IOHttpClientAdapter).validateCertificate =
    //       (X509Certificate? cert, String host, int port) => true;
    // } else if (F.isTest()) {
    //   // dio.interceptors.add(CertificatePinningInterceptor(allowedSHAFingerprints: shaFingerprints));
    // }

    if (parameters?.deactivateIsolateResponseParse == null ||
        !parameters!.deactivateIsolateResponseParse!) {
      dio.transformer = BackgroundTransformer();
    }

    return dio;
  }
}
