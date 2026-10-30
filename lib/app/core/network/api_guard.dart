import 'package:cmovil_v4/app/core/errors/app_exception.dart';
import 'package:dio/dio.dart';

Future<T> guardApiCall<T>(Future<T> Function() call) async {
  try {
    return await call();
  } on DioException catch (error) {
    throw mapDioException(error);
  } on FormatException {
    throw const InvalidResponseException();
  } on TypeError {
    throw const InvalidResponseException();
  }
}

AppException mapDioException(DioException error) {
  // El interceptor ya clasificó el error (p. ej. UnauthorizedException).
  if (error.error case final AppException appException) {
    return appException;
  }
  return switch (error.type) {
    DioExceptionType.connectionTimeout ||
    DioExceptionType.sendTimeout ||
    DioExceptionType.receiveTimeout ||
    DioExceptionType.transformTimeout => const RequestTimeoutException(),
    DioExceptionType.connectionError => const NetworkException(),
    DioExceptionType.badResponse => _mapResponse(error.response),
    DioExceptionType.badCertificate ||
    DioExceptionType.cancel ||
    DioExceptionType.unknown => const UnexpectedException(),
  };
}

typedef _ErrorEnvelope = ({String code, String message});

AppException _mapResponse(Response<Object?>? response) {
  if (response == null) {
    return const UnexpectedException();
  }

  final int? statusCode = response.statusCode;
  final _ErrorEnvelope? envelope = _parseEnvelope(response.data);

  // No exponer detalles internos de los errores 5xx.
  if (statusCode != null && statusCode >= 500) {
    return ServerException(statusCode: statusCode, code: envelope?.code);
  }

  // Conservar los errores de negocio enviados por el backend.
  if (envelope != null) {
    return ApiException(
      code: envelope.code,
      message: envelope.message,
      statusCode: statusCode,
    );
  }

  if (statusCode == 401) {
    return const UnauthorizedException();
  }

  return HttpStatusException(statusCode: statusCode);
}

_ErrorEnvelope? _parseEnvelope(Object? data) {
  if (data is! Map<Object?, Object?>) {
    return null;
  }

  final Object? rawCode = data['code'];
  final Object? rawMessage = data['message'];

  if (rawCode is! String || rawMessage is! String) {
    return null;
  }

  final String code = rawCode.trim();
  final String message = rawMessage.trim();

  if (code.isEmpty || message.isEmpty) {
    return null;
  }

  return (code: code, message: message);
}
