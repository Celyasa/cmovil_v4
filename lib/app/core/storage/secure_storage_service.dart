import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class SecureStorageService {
  SecureStorageService(this._storage);

  final FlutterSecureStorage _storage;

  static const String _accessTokenKey = 'access_token';

  /// Guarda el token de acceso.
  Future<void> saveAccessToken(String token) async {
    if (token.trim().isEmpty) {
      throw ArgumentError.value(
        token,
        'token',
        'El token no puede estar vacío.',
      );
    }

    await _storage.write(key: _accessTokenKey, value: token);
  }

  /// Recupera el token guardado, si existe.
  Future<String?> getAccessToken() {
    return _storage.read(key: _accessTokenKey);
  }

  /// Elimina el token al cerrar sesión.
  Future<void> deleteAccessToken() {
    return _storage.delete(key: _accessTokenKey);
  }
}
