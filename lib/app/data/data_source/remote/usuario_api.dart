import 'package:cmovil_v4/app/core/config/api_config.dart';
import 'package:cmovil_v4/app/core/errors/app_exception.dart';
import 'package:cmovil_v4/app/core/network/api_guard.dart';
import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';
import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil_model.dart';
import 'package:dio/dio.dart';

final class UsuarioApi {
  UsuarioApi(this._dio);
  final Dio _dio;
  Future<UsuarioPerfilModel> obtenerPerfil() {
    return guardApiCall(() async {
      final response = await _dio.get<Map<String, dynamic>>(ApiConfig.profile);
      final data = response.data;
      if (data == null) throw const InvalidResponseException();
      return UsuarioPerfilModel.fromJson(data);
    });
  }
}
