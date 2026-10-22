import 'package:cmovil_v4/app/domain/models/auth/login_response_model.dart';

abstract interface class AuthenticationRepository {
  Future<LoginResponseModel> login({required String usrCodigo});
  Future<String?> getAccessToken();
  Future<void> logout();
  Future<bool> hasActiveSession();
}
