import 'package:cmovil_v4/app/domain/models/auth/usuario.dart';

class LoginResponseModel {
  const LoginResponseModel({
    required this.tokenType,
    required this.accessToken,
    required this.usuario,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      tokenType: json['tokenType'] as String,
      accessToken: json['accessToken'] as String,
      usuario: Usuario.fromJson(json['usuario'] as Map<String, dynamic>),
    );
  }

  final String tokenType;
  final String accessToken;
  final Usuario usuario;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'tokenType': tokenType,
      'accessToken': accessToken,
      'usuario': usuario.toJson(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseModel &&
          other.tokenType == tokenType &&
          other.accessToken == accessToken &&
          other.usuario == usuario;

  @override
  int get hashCode => Object.hash(tokenType, accessToken, usuario);
}
