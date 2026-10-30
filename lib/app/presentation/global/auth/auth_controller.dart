import 'package:cmovil_v4/app/domain/repositories/authentication_repository.dart';
import 'package:cmovil_v4/app/domain/repositories/usuario_repository.dart';
import 'package:cmovil_v4/app/presentation/global/auth/auth_status.dart';
import 'package:flutter/foundation.dart';

final class AuthController extends ChangeNotifier {
  AuthController(this._repository, this._usuarioRepository);

  final AuthenticationRepository _repository;
  final UsuarioRepository _usuarioRepository;

  AuthStatus _status = AuthStatus.initializing;
  AuthStatus get status => _status;

  Future<void>? _initialization;

  Future<void> initialize() {
    return _initialization ??= _restoreSession();
  }

  Future<void> _restoreSession() async {
    try {
      final hasSession = await _repository.hasActiveSession();
      _setStatus(
        hasSession ? AuthStatus.authenticated : AuthStatus.unauthenticated,
      );
    } catch (_) {
      // Un fallo al leer el almacenamiento seguro equivale a "sin sesión".
      _setStatus(AuthStatus.unauthenticated);
    }
  }

  Future<void> login({required String usrCodigo}) async {
    await _repository.login(usrCodigo: usrCodigo);
    try {
      await _usuarioRepository.actualizarPerfil();
    } catch (_) {
      // Si la actualización del perfil falla, ejecutamos la limpieza defensiva en cadena
      try {
        // Intentamos cerrar sesión en el servidor
        await _repository.logout();
      } finally {
        // Pase lo que pase con el logout del servidor, garantizamos la limpieza de la DB local
        await _usuarioRepository.limpiarPerfilLocal();
      }
      rethrow; // Propagamos el error original hacia el LoginController
    }
    _setStatus(AuthStatus.authenticated);
  }

  Future<void> logout() async {
    try {
      await _repository.logout();
      await _usuarioRepository.limpiarPerfilLocal();
    } finally {
      _setStatus(AuthStatus.unauthenticated);
    }
  }

  void _setStatus(AuthStatus value) {
    if (_status == value) {
      return;
    }

    _status = value;
    notifyListeners();
  }
}
