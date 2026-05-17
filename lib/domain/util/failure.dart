import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();

  /// Dio Exception
  const factory Failure.cancelException({required String message}) =
      CancelException;

  const factory Failure.connectionTimeoutException({required String message}) =
      ConnectionTimeoutException;

  const factory Failure.receiveTimeoutException({required String message}) =
      ReceiveTimeoutException;

  const factory Failure.sendTimeoutException({required String message}) =
      SendTimeoutException;

  const factory Failure.socketException({required String message}) =
      SocketException;

  const factory Failure.unrecognizedException({required String message}) =
      UnrecognizedException;

  const factory Failure.tokenExpiredException({required String message}) =
      TokenEpiredException;

  const factory Failure.serverException({
    required String message,
    required int statusCode,
    dynamic data,
  }) = ServerException;

  /// Format Exception
  const factory Failure.formatException({required String message}) =
      FormatException;

  /// Serialization Exception
  const factory Failure.serializationException({required String message}) =
      SerializationException;

  /// Parse Dio Exception
  static Failure mapDioException(Exception exception) {
    try {
      if (exception is DioException) {
        switch (exception.type) {
          case DioExceptionType.connectionTimeout:
            return const Failure.connectionTimeoutException(
              message: 'Connection not established',
            );
          case DioExceptionType.sendTimeout:
            return const Failure.sendTimeoutException(
              message: 'Send timeout in connection with API server',
            );
          case DioExceptionType.receiveTimeout:
            return const Failure.receiveTimeoutException(
              message: 'Receive timeout in connection with API server',
            );
          case DioExceptionType.badCertificate:
            return const Failure.socketException(
              message: 'SSL certificate is not valid',
            );
          case DioExceptionType.cancel:
            return const Failure.cancelException(
              message: 'Request to API server was cancelled',
            );
          case DioExceptionType.connectionError:
            return const Failure.socketException(
              message: 'No Internet connection',
            );
          case DioExceptionType.badResponse:
            final responseData = exception.response?.data;

            String errorMessage =
                exception.response?.statusMessage ??
                'Bad response from API server';

            if (responseData is Map<String, dynamic>) {
              try {
                if (responseData.containsKey('error') &&
                    responseData['error'] is Map<String, dynamic>) {
                  final errorObj =
                      responseData['error'] as Map<String, dynamic>;

                  if (errorObj['message'] != null &&
                      errorObj['message'] is String &&
                      errorObj['message'].toString().isNotEmpty) {
                    errorMessage = errorObj['message'];
                  }
                } else if (responseData.containsKey('message')) {
                  final message = responseData['message'];
                  if (message is String && message.isNotEmpty) {
                    errorMessage = message;
                  }
                } else if (responseData.containsKey('errors') &&
                    responseData['errors'] is List) {
                  final errorsList = responseData['errors'] as List;

                  if (errorsList.isNotEmpty) {
                    final firstError = errorsList.first;

                    if (firstError is Map<String, dynamic> &&
                        firstError['message'] is String) {
                      errorMessage = firstError['message'];
                    } else if (firstError is String) {
                      errorMessage = firstError;
                    }
                  }
                }
              } catch (_) {}
            }

            return Failure.serverException(
              message: errorMessage,
              statusCode: exception.response?.statusCode ?? 400,
              data: responseData,
            );
          case DioExceptionType.unknown:
            return const Failure.unrecognizedException(
              message: 'Unknown error occurred',
            );
        }
      }
    } on FormatException catch (e) {
      return Failure.formatException(message: e.message);
    }
    return const Failure.unrecognizedException(
      message: 'Unknown error occurred',
    );
  }

  static Failure mapParsingException(Exception exception) {
    return const Failure.serializationException(
      message: 'Failed to parse network response to model or vice versa',
    );
  }

  @override
  String get message {
    return when(
      cancelException: (message) => message,
      connectionTimeoutException: (message) => message,
      receiveTimeoutException: (message) => message,
      sendTimeoutException: (message) => message,
      socketException: (message) => message,
      unrecognizedException: (message) => message,
      tokenExpiredException: (message) => message,
      serverException: (message, statusCode, data) => message,
      formatException: (message) => message,
      serializationException: (message) => message,
    );
  }
}
