import 'package:cmovil_v4/app/core/config/api_config.dart';
import 'package:cmovil_v4/app/core/network/api_guard.dart';
import 'package:cmovil_v4/app/domain/models/auth/login_response_model.dart';
import 'package:dio/dio.dart';

final class AuthenticationApi {
  AuthenticationApi(this._dio);
  final Dio _dio;
  Future<LoginResponseModel> login({required String usrCodigo}) {
    return guardApiCall(() async {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConfig.login,
        data: <String, dynamic>{'usrCodigo': usrCodigo, 'platform': 'APP'},
      );

      final data = response.data;

      if (data == null) {
        throw const FormatException('La API devolvió una respuesta vacía.');
      }

      return LoginResponseModel.fromJson(data);
    });
  }
}
