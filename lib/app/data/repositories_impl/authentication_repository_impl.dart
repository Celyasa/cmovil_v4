import 'package:cmovil_v4/app/data/data_source/local/services/secure_storage_service.dart';
import 'package:cmovil_v4/app/data/data_source/remote/authentication_api.dart';
import 'package:cmovil_v4/app/domain/models/auth/login_response_model.dart';
import 'package:cmovil_v4/app/domain/repositories/authentication_repository.dart';

final class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl(
    this._authenticationApi,
    this._secureStorageService,
  );
  final AuthenticationApi _authenticationApi;
  final SecureStorageService _secureStorageService;
  @override
  Future<LoginResponseModel> login({required String usrCodigo}) async {
    final response = await _authenticationApi.login(usrCodigo: usrCodigo);
    if (response.accessToken.trim().isEmpty) {
      throw const FormatException(
        'La API no devolvió un token de acceso válido.',
      );
    }
    await _secureStorageService.saveAccessToken(response.accessToken);
    return response;
  }

  @override
  Future<String?> getAccessToken() {
    return _secureStorageService.getAccessToken();
  }

  @override
  Future<void> logout() {
    return _secureStorageService.deleteAccessToken();
  }

  @override
  Future<bool> hasActiveSession() async {
    final token = await _secureStorageService.getAccessToken();
    return token != null && token.trim().isNotEmpty;
  }
}
