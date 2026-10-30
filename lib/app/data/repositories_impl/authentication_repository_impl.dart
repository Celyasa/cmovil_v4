import 'package:cmovil_v4/app/core/errors/app_exception.dart';
import 'package:cmovil_v4/app/core/storage/secure_storage_service.dart';
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
      throw const InvalidResponseException();
    }
    await _secureStorageService.saveAccessToken(response.accessToken);
    return response;
  }

  @override
  Future<bool> hasActiveSession() async {
    final token = await _secureStorageService.getAccessToken();
    return token != null && token.trim().isNotEmpty;
  }

  @override
  Future<void> logout() async {
    try {
      // Le dice al backend "cierra mi sesión" (libera el SESSION_BLOCKED).
      await _authenticationApi.logout();
    } on AppException {
      // Si el backend falla, igual limpiamos el token local.
      // El backend liberará la sesión cuando expire el JWT.
    } catch (_) {
      // Idem: cualquier error del backend no debe bloquear el logout local.
    } finally {
      await _secureStorageService.deleteAccessToken();
    }
  }
}
