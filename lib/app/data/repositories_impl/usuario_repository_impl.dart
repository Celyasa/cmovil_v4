import 'package:cmovil_v4/app/data/data_source/local/dao/usuario_dao.dart';
import 'package:cmovil_v4/app/data/data_source/remote/usuario_api.dart';
import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';
import 'package:cmovil_v4/app/domain/repositories/usuario_repository.dart';

final class UsuarioRepositoryImpl implements UsuarioRepository {
  UsuarioRepositoryImpl(this._usuarioApi, this._usuarioDao);
  final UsuarioApi _usuarioApi;
  final UsuarioDao _usuarioDao;

  @override
  Stream<UsuarioPerfil?> obtenerPerfil() => _usuarioDao.watchPerfilLocal();

  @override
  Future<void> actualizarPerfil() async {
    final perfil = await _usuarioApi.obtenerPerfil();
    await _usuarioDao.guardarPerfilLocal(perfil);
  }

  @override
  Future<void> limpiarPerfilLocal() => _usuarioDao.eliminarPerfilLocal();

  @override
  Future<void> seleccionarModulo(String usrIdExt) {
    return _usuarioDao.seleccionarModulo(usrIdExt);
  }
}
