import 'package:cmovil_v4/app/core/config/api_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract final class DioFactory {
  /// Crea la instancia de Dio de la app.
  /// [interceptors] permite agregar más adelante, sin tocar esta clase,
  /// interceptores como el de autenticación.
  static Dio create({
    String? baseUrl,
    List<Interceptor> interceptors = const <Interceptor>[],
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? ApiConfig.defaultBaseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        sendTimeout: ApiConfig.sendTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: <String, dynamic>{'Accept': Headers.jsonContentType},
      ),
    );

    dio.interceptors.addAll(interceptors);

    if (kDebugMode) {
      // Sin cabeceras ni cuerpos: evita registrar tokens y contraseñas.
      dio.interceptors.add(
        LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          logPrint: (object) => debugPrint(object.toString()),
        ),
      );
    }

    return dio;
  }
}
