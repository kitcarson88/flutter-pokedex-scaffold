import 'dart:async' hide TimeoutException;

import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:logging/logging.dart';
import 'package:pokedex_scaffold/core/services/http/http_exceptions.dart';

class TimeoutAndAuthRetryInterceptor extends RetryInterceptor {
  TimeoutAndAuthRetryInterceptor({
    required super.dio,
  }) : super(
          logPrint: Logger('TimeoutInterceptor').finer,
          retries: 2,
          retryDelays: const [
            Duration(milliseconds: 500),
            Duration(milliseconds: 1000),
          ],
          retryEvaluator: _RetryEvaluator().evaluate,
        );
}

class _RetryEvaluator extends DefaultRetryEvaluator {
  _RetryEvaluator() : super({});

  @override
  FutureOr<bool> evaluate(dynamic error, int attempt) async {
    if (error is TimeoutException) {
      return true;
    }

    // TODO: apply this part of code only when rest calls must be retried on 401 or 403 http status codes
    // if (error is UnauthorizedException) {
    //   final sessionService = SessionService.getInstance();

    //   try {
    //     final refreshedData =
    //         await AuthRepository().refreshAccessToken(sessionService.token!.refreshToken!);
    //     sessionService.initToken(refreshedData);

    //     return true;
    //   } catch (e) {
    //     return false;
    //   }
    // }

    return false;
  }
}
