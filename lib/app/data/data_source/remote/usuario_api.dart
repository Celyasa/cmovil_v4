import 'package:cmovil_v4/app/core/config/api_config.dart';
import 'package:cmovil_v4/app/core/network/api_guard.dart';
import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';
import 'package:dio/dio.dart';

final class UsuarioApi {
  UsuarioApi(this._dio);
  final Dio _dio;
  Future<UsuarioPerfil> obtenerPerfil() {
    return guardApiCall(() async {
      final response = await _dio.get<Map<String, dynamic>>(ApiConfig.profile);
      final data = response.data;
      if (data == null) {
        throw const FormatException(
          'El servidor devolvió una respuesta vacía.',
        );
      }
      return UsuarioPerfil.fromJson(data);
    });
  }
}
