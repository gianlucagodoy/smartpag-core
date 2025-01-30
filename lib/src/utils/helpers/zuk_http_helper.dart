import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../services/services.dart';
import '../dependencies/dependecies.dart';

class ZukHttpHelper {
  static bool isSuccessCode(int? code) =>
      code != null &&
      code >= ZukHttpConstants.HTTP_OK &&
      code <= ZukHttpConstants.HTTP_NO_CONTENT;

  static bool isErrorCode(int? code) =>
      code != null && code >= ZukHttpConstants.HTTP_INTERNAL_SERVER_ERROR;

  static Map<String, String> getDefaultHeaders() => {
        'Content-Type': 'application/json; charset=utf-8',
        'accept':
            'application/json, text/plain, application/x-www-form-urlencoded, */*',
      };

  /// Retorna a instancia do Dio configurada utilizando a variavel de ambiente **DEFINE_BASE_URL**
  /// ex **--dart-define DEFINE_BASE_URL=https://api.com.br/api/v2/**
  static Dio getDefaultDio() => Dio(
        BaseOptions(
            receiveDataWhenStatusError: true,
            validateStatus: (_) => true,
            headers: getDefaultHeaders(),
            baseUrl: const String.fromEnvironment('DEFINE_BASE_URL')),
      )..interceptors.addAll(
          _getDefaultInterceptors(),
        );

  static List<Interceptor> _getDefaultInterceptors() => [
        AuthInterceptor(),
        if (kDebugMode)
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
      ];
}
