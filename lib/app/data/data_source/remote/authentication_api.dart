import 'package:cmovil_v4/app/data/data_source/remote/api_client.dart';
import 'package:cmovil_v4/app/data/helpers/api_config.dart';
import 'package:cmovil_v4/app/domain/models/auth/login_response_model.dart';

class AuthenticationApi {
  final ApiClient _apiClient;

  AuthenticationApi(this._apiClient);
  Future<LoginResponseModel> login({required String usrCodigo}) async {
    final response = await _apiClient.dio.post<Object?>(
      ApiConfig.login,
      data: <String, String>{'usrCodigo': usrCodigo, 'platform': 'APP'},
    );

    final data = response.data;

    if (data is! Map<String, dynamic>) {
      throw const FormatException(
        'La respuesta del servidor tiene un formato inválido.',
      );
    }

    return LoginResponseModel.fromJson(data);
  }
}
