import 'package:cmovil_v4/app/data/data_source/local/services/secure_storage_service.dart';
import 'package:cmovil_v4/app/data/data_source/remote/api_client.dart';
import 'package:cmovil_v4/app/data/data_source/remote/authentication_api.dart';
import 'package:cmovil_v4/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:cmovil_v4/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract final class Repositories {
  Repositories._();

  // Cliente HTTP compartido (lo usan todos los data sources).
  static final ApiClient apiClient = ApiClient();

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static final SecureStorageService secureStorage = SecureStorageService(
    _secureStorage,
  );

  // Repositorios (contratos de dominio).
  static final Provider<AuthenticationRepository> auth =
      Provider<AuthenticationRepository>(
        (_) => AuthenticationRepositoryImpl(
          AuthenticationApi(apiClient),
          secureStorage,
        ),
      );
}
