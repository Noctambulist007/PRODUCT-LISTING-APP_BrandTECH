import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final method = options.method;
    final uri = options.uri;
    debugPrint('REQUEST[$method] => $uri');
    debugPrint('Headers: ${options.headers}');
    debugPrint('Data: ${options.data}');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'RESPONSE[${response.statusCode}] => ${response.requestOptions.uri}',
    );
    debugPrint('Data: ${response.data}', wrapWidth: 200);

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => ${err.requestOptions.uri}',
    );
    debugPrint('Message: ${err.message}');
    handler.next(err);
  }
}
