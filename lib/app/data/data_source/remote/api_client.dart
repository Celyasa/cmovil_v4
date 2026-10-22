import 'package:cmovil_v4/app/data/helpers/api_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Cliente HTTP central de la aplicación.
///
/// Configura los valores comunes utilizados por la capa Data:
/// URL base, tiempos de espera, encabezados e interceptores.
final class ApiClient {
  ApiClient({String? baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl ?? ApiConfig.defaultBaseUrl,
          connectTimeout: ApiConfig.connectTimeout,
          sendTimeout: ApiConfig.sendTimeout,
          receiveTimeout: ApiConfig.receiveTimeout,
          responseType: ResponseType.json,
          headers: const <String, String>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      ) {
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: true,
          logPrint: (Object value) {
            debugPrint(value.toString());
          },
        ),
      );
    }
  }

  final Dio _dio;

  /// Cliente HTTP para uso exclusivo de la capa Data.
  Dio get dio => _dio;
}

// final class ApiClient {
//   ApiClient({String? baseUrl})
//     : _dio = Dio(
//         BaseOptions(
//           baseUrl: baseUrl ?? ApiConfig.defaultBaseUrl,
//           connectTimeout: ApiConfig.connectTimeout,
//           sendTimeout: ApiConfig.sendTimeout,
//           receiveTimeout: ApiConfig.receiveTimeout,
//           responseType: ResponseType.json,
//           headers: const <String, String>{
//             'Accept': 'application/json',
//             'Content-Type': 'application/json',
//           },
//         ),
//       ) {
//     if (kDebugMode) {
//       _dio.interceptors.add(
//         LogInterceptor(
//           requestHeader: true,
//           requestBody: true,
//           responseHeader: false,
//           responseBody: true,
//           error: true,
//           logPrint: (Object value) => debugPrint(value.toString()),
//         ),
//       );
//     }
//   }

//   final Dio _dio;

//   Dio get dio => _dio;
// }
