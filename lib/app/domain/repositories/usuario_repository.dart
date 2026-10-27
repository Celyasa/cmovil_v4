import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';

abstract interface class UsuarioRepository {
  Future<UsuarioPerfil> obtenerPerfil();
}
