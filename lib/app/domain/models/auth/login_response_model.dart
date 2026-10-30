import 'package:cmovil_v4/app/domain/models/auth/usuario_sesion.dart';

final class LoginResponseModel {
  const LoginResponseModel({required this.accessToken, required this.usuario});

  final String accessToken;
  final UsuarioSesionModel usuario;

  // Un tipo incorrecto lanza TypeError; guardApiCall lo convierte en
  // InvalidResponseException.
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['accessToken'] as String,
      usuario: UsuarioSesionModel.fromJson(
        json['usuario'] as Map<String, dynamic>,
      ),
    );
  }
}

final class UsuarioSesionModel extends UsuarioSesion {
  const UsuarioSesionModel({
    required super.usrCodigo,
    required super.usrNombre,
    required super.empNombre,
    required super.licId,
    required super.licNombre,
  });

  factory UsuarioSesionModel.fromJson(Map<String, dynamic> json) {
    return UsuarioSesionModel(
      usrCodigo: json['usrCodigo'] as String,
      usrNombre: json['usrNombre'] as String,
      empNombre: json['empNombre'] as String,
      // Tolera int o String; `as Object` falla si viene null (evita guardar "null").
      licId: (json['licId'] as Object).toString(),
      licNombre: json['licNombre'] as String,
    );
  }
}
