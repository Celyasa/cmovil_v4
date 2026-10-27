import 'package:cmovil_v4/app/core/errors/app_exception.dart';
import 'package:cmovil_v4/app/core/storage/secure_storage_service.dart';
import 'package:dio/dio.dart';

final class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._secureStorageService);
  final SecureStorageService _secureStorageService;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _secureStorageService.getAccessToken();

    // Mantenemos tu validación estricta local: si no hay token, cancelamos antes de consumir internet
    if (token == null || token.trim().isEmpty) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: const UnauthorizedException(),
          type: DioExceptionType.cancel,
        ),
      );
    }

    options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }
}
