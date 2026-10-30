import 'package:cmovil_v4/app/core/errors/app_exception.dart';

String userMessageFor(Object error) {
  return switch (error) {
    NetworkException() =>
      'No se pudo conectar con el servidor. '
          'Revisa tu conexión e inténtalo nuevamente.',

    RequestTimeoutException() =>
      'El servidor tardó demasiado en responder. '
          'Inténtalo nuevamente.',

    UnauthorizedException() => 'Tu sesión expiró. Vuelve a iniciar sesión.',

    ApiException(:final message) when message.trim().isNotEmpty => message,

    ApiException() => 'No se pudo completar la operación.',

    ServerException() =>
      'El servidor no está disponible en este momento. '
          'Inténtalo más tarde.',

    HttpStatusException(:final statusCode) => switch (statusCode) {
      400 => 'Solicitud inválida. Verifica los datos.',
      403 => 'No tienes permiso para esta acción.',
      404 => 'El recurso solicitado no está disponible.',
      409 => 'Ya existe un registro con esos datos.',
      422 => 'Los datos enviados no son válidos.',
      _ => 'No se pudo completar la solicitud.',
    },

    InvalidResponseException() =>
      'El servidor devolvió una respuesta inesperada.',

    _ => 'Ocurrió un error inesperado. Inténtalo nuevamente.',
  };
}
