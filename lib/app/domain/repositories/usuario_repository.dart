import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';

abstract interface class UsuarioRepository {
  Stream<UsuarioPerfil?> obtenerPerfil();
  Future<void> actualizarPerfil();
  Future<void> limpiarPerfilLocal();
  Future<void> seleccionarModulo(String usrIdExt);
}
