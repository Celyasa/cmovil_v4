import 'package:cmovil_v4/app/core/errors/app_exception.dart';

String userMessageFor(Object error) {
  return switch (error) {
    NetworkException() =>
      'No se pudo conectar con el servidor. '
          'Revisa tu conexión e inténtalo nuevamente.',

    RequestTimeoutException() =>
      'El servidor tardó demasiado en responder. '
          'Inténtalo nuevamente.',

    UnauthorizedException() => 'No fue posible autorizar la solicitud.',

    ApiException(:final message) when message.trim().isNotEmpty => message,

    ApiException() => 'No se pudo completar la operación.',

    ServerException() =>
      'El servidor no está disponible en este momento. '
          'Inténtalo más tarde.',

    HttpException() => 'No se pudo completar la solicitud.',

    InvalidResponseException() =>
      'El servidor devolvió una respuesta inesperada.',

    UnexpectedException() =>
      'Ocurrió un error inesperado. Inténtalo nuevamente.',

    _ => 'Ocurrió un error inesperado. Inténtalo nuevamente.',
  };
}
