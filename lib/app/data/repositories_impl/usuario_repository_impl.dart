import 'package:cmovil_v4/app/data/data_source/remote/usuario_api.dart';
import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';
import 'package:cmovil_v4/app/domain/repositories/usuario_repository.dart';

final class UsuarioRepositoryImpl implements UsuarioRepository {
  UsuarioRepositoryImpl(this._usuarioApi);
  final UsuarioApi _usuarioApi;
  @override
  Future<UsuarioPerfil> obtenerPerfil() async {
    return await _usuarioApi.obtenerPerfil();
  }
}
