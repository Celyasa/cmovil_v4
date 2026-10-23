import 'package:cmovil_v4/app/core/network/dio_factory.dart';
import 'package:cmovil_v4/app/core/storage/secure_storage_service.dart';
import 'package:cmovil_v4/app/data/data_source/remote/authentication_api.dart';
import 'package:cmovil_v4/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:cmovil_v4/app/domain/repositories/authentication_repository.dart';
import 'package:cmovil_v4/app/presentation/global/auth/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract final class Dependencies {
  // 1. Dejamos SOLAMENTE el authController como estado global accesible
  static late final AuthController authController;
}

Future<void> initializeDependencies() async {
  // 2. Las dependencias internas ahora son variables locales (mueren al terminar la función)
  final Dio dio = DioFactory.create();
  final SecureStorageService secureStorageService = SecureStorageService(
    const FlutterSecureStorage(),
  );
  final AuthenticationApi authenticationApi = AuthenticationApi(dio);
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepositoryImpl(authenticationApi, secureStorageService);
  // 3. Se asigna el controlador a la propiedad estática global
  Dependencies.authController = AuthController(authenticationRepository);
}
