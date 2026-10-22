import 'package:cmovil_v4/app/domain/repositories/authentication_repository.dart';
import 'package:cmovil_v4/app/presentation/modules/login/controller/login_state.dart';
import 'package:flutter_meedu/notifiers.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this._authenticationRepository) : super(LoginState.initial);

  final AuthenticationRepository _authenticationRepository;

  void onUsrCodigoChanged(String usrCodigo) {
    state = state.copyWith(
      usrCodigo: usrCodigo,
      clearError: true,
      clearResponse: true,
    );
  }

  Future<void> login() async {
    if (!state.canSubmit) return;

    state = state.copyWith(
      loading: true,
      clearError: true,
      clearResponse: true,
    );

    try {
      final response = await _authenticationRepository.login(
        usrCodigo: state.usrCodigo.trim(),
      );
      if (!mounted) return;
      state = state.copyWith(loading: false, response: response);
    } catch (_) {
      if (!mounted) return;

      state = state.copyWith(
        loading: false,
        error: 'No se pudo iniciar sesión. Verifica tu código.',
      );
    }
  }
}
