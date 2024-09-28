import 'package:flutter/foundation.dart';

class ResponseResult<T> {
  T? value;
  T Function(dynamic)? converter;

  ResponseResult({this.value, this.converter});
}

enum MethodType { get, post, delete, put }

abstract class BaseHttpService {
  Future<void> get({
    required String url,
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
    Map<String, String>? header,
    required ResponseResult responseResult,
    dynamic extraParameters,
  }) async {
    final response = await doCall(
      url: _prepareUrl(url, pathParams, queryParams),
      method: MethodType.get,
      header: header,
      extraParameters: extraParameters,
    );

    responseResult.value = transformResponse(
        response, responseResult.value, responseResult.converter, extraParameters);
  }

  Future<void> post({
    required String url,
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
    Map<String, String>? header,
    Object? body,
    required ResponseResult responseResult,
    dynamic extraParameters,
  }) async {
    final response = await doCall(
      url: _prepareUrl(url, pathParams, queryParams),
      method: MethodType.post,
      header: header,
      body: body,
      extraParameters: extraParameters,
    );

    responseResult.value = transformResponse(
        response, responseResult.value, responseResult.converter, extraParameters);
  }

  Future<void> delete({
    required String url,
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
    Map<String, String>? header,
    required ResponseResult responseResult,
    dynamic extraParameters,
  }) async {
    final response = await doCall(
      url: _prepareUrl(url, pathParams, queryParams),
      method: MethodType.delete,
      header: header,
      extraParameters: extraParameters,
    );

    responseResult.value = transformResponse(
        response, responseResult.value, responseResult.converter, extraParameters);
  }

  Future<void> put({
    required String url,
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
    Map<String, String>? header,
    Object? body,
    required ResponseResult responseResult,
    dynamic extraParameters,
  }) async {
    final response = await doCall(
      url: _prepareUrl(url, pathParams, queryParams),
      method: MethodType.put,
      header: header,
      body: body,
      extraParameters: extraParameters,
    );

    responseResult.value = transformResponse(
        response, responseResult.value, responseResult.converter, extraParameters);
  }

  @protected
  Future doCall({
    required String url,
    required MethodType method,
    Map<String, String>? header,
    Object? body,
    dynamic extraParameters,
  });

  @protected
  dynamic transformResponse<RawResponse, TransformedResponse>(
    RawResponse response,
    TransformedResponse? value,
    TransformedResponse Function(dynamic)? converter,
    dynamic extraParameters,
  );

  String _prepareUrl(
    String url,
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
  ) {
    var preparedUrl = url;

    if (pathParams != null) preparedUrl = _applyPathParams(preparedUrl, pathParams);
    if (queryParams != null) preparedUrl = _applyQueryParams(preparedUrl, queryParams);

    return preparedUrl;
  }

  String _applyPathParams(String url, Map<String, String> params) {
    var urlWithParams = url;

    params.forEach((key, value) {
      urlWithParams = urlWithParams.replaceFirst('{$key}', value);
    });

    return urlWithParams;
  }

  String _applyQueryParams(String url, Map<String, String> params) {
    var urlWithParams = url;

    if (params.isNotEmpty) urlWithParams += '?';

    params.forEach((key, value) {
      urlWithParams += '$key=$value&';
    });

    urlWithParams.substring(0, urlWithParams.length - 1);

    return urlWithParams;
  }
}
