import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tmdb/core/config/main.dart';
import 'package:tmdb/core/http/http_service.dart';

class DioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.queryParameters.addAll({'api_key': Environment().config.TMDBApiKey});
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Exception? exception;

    int? statusCode = err.response?.statusCode;
    if (statusCode != null) {
      exception = {
            400: BadRequestException(
              statusCode: err.response?.statusCode,
              serverError: err.message?.toString(),
            ),
            401: UnauthorizedException(
              statusCode: err.response?.statusCode,
              serverError: err.message?.toString(),
            ),
            500: (err.message != null && err.message!.toString().contains("401"))
                ? UnauthorizedException(
                    statusCode: err.response?.statusCode,
                    serverError: err.message?.toString(),
                  )
                : InternalServerError(
                    statusCode: err.response?.statusCode,
                    serverError: err.message?.toString(),
                  ),
            522: TimeOutException(
              statusCode: err.response?.statusCode,
              serverError: err.message?.toString(),
            ),
          }[statusCode] ??
          null;
    }

    if (exception == null) {
      exception = {
        DioExceptionType.connectionError: NoConnectionException(
          statusCode: err.response?.statusCode,
          serverError: err.message?.toString(),
        ),
        DioExceptionType.connectionTimeout: TimeOutException(
          statusCode: err.response?.statusCode,
          serverError: err.message?.toString(),
        ),
        DioExceptionType.receiveTimeout: TimeOutException(
          statusCode: err.response?.statusCode,
          serverError: err.message?.toString(),
        ),
        DioExceptionType.sendTimeout: TimeOutException(
          statusCode: err.response?.statusCode,
          serverError: err.message?.toString(),
        ),
        DioExceptionType.unknown: UnexpectedException(
          statusCode: err.response?.statusCode,
          serverError: err.message?.toString(),
        ),
      }[err.type];
    }

    if (err.error is SocketException) {
      exception = NoConnectionException();
    }

    if (exception == null)
      exception = UnexpectedException(
        statusCode: err.response?.statusCode,
        serverError: err.message?.toString(),
      );
    throw exception;
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
