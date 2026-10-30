sealed class AppException implements Exception {
  const AppException();
}

/// No se pudo establecer comunicación con el servidor.
final class NetworkException extends AppException {
  const NetworkException();
}

/// La operación superó el tiempo de espera.
final class RequestTimeoutException extends AppException {
  const RequestTimeoutException();
}

/// HTTP 401 sin un error de negocio reconocido.
final class UnauthorizedException extends AppException {
  const UnauthorizedException();
}

/// Error de negocio devuelto por el backend.
final class ApiException extends AppException {
  const ApiException({
    required this.code,
    required this.message,
    this.statusCode,
  });

  final String code;
  final String message;
  final int? statusCode;
}

/// El servidor respondió con un estado HTTP 5xx.
final class ServerException extends AppException {
  const ServerException({this.statusCode, this.code});

  final int? statusCode;
  final String? code;
}

/// Respuesta HTTP no exitosa sin un sobre de error reconocible.
final class HttpException extends AppException {
  const HttpException({this.statusCode});

  final int? statusCode;
}

/// La respuesta no cumple el formato esperado.
final class InvalidResponseException extends AppException {
  const InvalidResponseException();
}

/// Error no clasificado.
final class UnexpectedException extends AppException {
  const UnexpectedException();
}

/// Respuesta HTTP no exitosa sin un sobre de error reconocible.
final class HttpStatusException extends AppException {
  const HttpStatusException({this.statusCode});

  final int? statusCode;
}
