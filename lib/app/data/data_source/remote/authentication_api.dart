import 'package:cmovil_v4/app/core/config/api_config.dart';
import 'package:cmovil_v4/app/core/errors/app_exception.dart';
import 'package:cmovil_v4/app/core/network/api_guard.dart';
import 'package:cmovil_v4/app/domain/models/auth/login_response_model.dart';
import 'package:dio/dio.dart';

final class AuthenticationApi {
  AuthenticationApi(this._dioPublico, this._dioProtegido);
  final Dio _dioPublico;
  final Dio _dioProtegido;
  Future<LoginResponseModel> login({required String usrCodigo}) {
    return guardApiCall(() async {
      final response = await _dioPublico.post<Map<String, dynamic>>(
        ApiConfig.login,
        data: <String, dynamic>{'usrCodigo': usrCodigo, 'platform': 'APP'},
      );
      final data = response.data;
      if (data == null) {
        throw const InvalidResponseException();
      }
      return LoginResponseModel.fromJson(data);
    });
  }

  Future<void> logout() async {
    await guardApiCall(() async {
      await _dioProtegido.get<void>(ApiConfig.logout);
    });
  }
}
