import 'package:cmovil_v4/app/domain/repositories/authentication_repository.dart';
import 'package:cmovil_v4/app/presentation/global/auth/auth_status.dart';
import 'package:flutter/foundation.dart';

final class AuthController extends ChangeNotifier {
  AuthController(this._repository);

  final AuthenticationRepository _repository;

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
    // La validación y el recorte ya se gestionan en el estado de pantalla (LoginState.canSubmit).
    // Aquí el controlador procesa directamente el valor ya validado.
    await _repository.login(usrCodigo: usrCodigo);

    _setStatus(AuthStatus.authenticated);
  }

  Future<void> logout() async {
    try {
      await _repository.logout();
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
