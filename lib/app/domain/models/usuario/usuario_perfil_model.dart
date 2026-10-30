import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';

final class UsuarioPerfilModel extends UsuarioPerfil {
  const UsuarioPerfilModel({
    required super.empId,
    required super.empNombre,
    required super.usrNombre,
    required super.usrCodigo,
    required super.modulos,
  });

  factory UsuarioPerfilModel.fromJson(Map<String, dynamic> json) {
    return UsuarioPerfilModel(
      empId: json['empId'] as int,
      empNombre: json['empNombre'] as String,
      usrNombre: json['usrNombre'] as String,
      usrCodigo: json['usrCodigo'] as String,
      modulos: [
        for (final m in json['modulos'] as List)
          _moduloFromJson(m as Map<String, dynamic>),
      ],
    );
  }

  static UsuarioModulo _moduloFromJson(Map<String, dynamic> json) {
    return UsuarioModulo(
      modId: json['modId'] as int,
      modNombre: json['modNombre'] as String,
      usrIdExt: json['usrIdExt'] as String,
      almId: json['almId'] as int,
      almNombre: json['almNombre'] as String,
      selected: false,
    );
  }
}
