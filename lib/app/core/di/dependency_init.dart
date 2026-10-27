import 'package:cmovil_v4/app/core/network/auth_interceptor.dart';
import 'package:cmovil_v4/app/core/network/dio_factory.dart';
import 'package:cmovil_v4/app/core/storage/secure_storage_service.dart';
import 'package:cmovil_v4/app/data/data_source/remote/authentication_api.dart';
import 'package:cmovil_v4/app/data/data_source/remote/usuario_api.dart';
import 'package:cmovil_v4/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:cmovil_v4/app/data/repositories_impl/usuario_repository_impl.dart';
import 'package:cmovil_v4/app/domain/repositories/authentication_repository.dart';
import 'package:cmovil_v4/app/domain/repositories/usuario_repository.dart';
import 'package:cmovil_v4/app/presentation/global/auth/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract final class Dependencies {
  // 1. Dejamos SOLAMENTE el authController como estado global accesible
  static late final AuthController authController;

  static late final UsuarioRepository usuarioRepository;
}

Future<void> initializeDependencies() async {
  final SecureStorageService secureStorageService = SecureStorageService(
    const FlutterSecureStorage(),
  );
  final Dio dioPublico = DioFactory.create();
  // 2. Las dependencias internas ahora son variables locales (mueren al terminar la función)
  final Dio dioProtegido = DioFactory.create(
    interceptors: [AuthInterceptor(secureStorageService)],
  );

  final AuthenticationApi authenticationApi = AuthenticationApi(dioPublico);
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepositoryImpl(authenticationApi, secureStorageService);

  final UsuarioApi usuarioApi = UsuarioApi(dioProtegido);
  // 3. Se asigna el controlador a la propiedad estática global
  Dependencies.authController = AuthController(authenticationRepository);
  Dependencies.usuarioRepository = UsuarioRepositoryImpl(usuarioApi);
}
