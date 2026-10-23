import 'package:cmovil_v4/app/presentation/global/auth/auth_controller.dart';
import 'package:cmovil_v4/app/presentation/modules/login/controller/login_state.dart';
import 'package:cmovil_v4/app/presentation/utils/error_messages.dart';
import 'package:flutter_meedu/notifiers.dart';

final class LoginController extends StateNotifier<LoginState> {
  LoginController(this._auth) : super(LoginState.initial);

  final AuthController _auth;

  void onUsrCodigoChanged(String usrCodigo) {
    state = state.copyWith(usrCodigo: usrCodigo, clearError: true);
  }

  Future<void> login() async {
    if (!mounted || !state.canSubmit) return;

    final String usrCodigo = state.usrCodigo.trim();

    state = state.copyWith(loading: true, clearError: true);

    try {
      await _auth.login(usrCodigo: usrCodigo);
    } catch (error) {
      if (!mounted) return;

      state = state.copyWith(error: userMessageFor(error));
    } finally {
      if (mounted) {
        state = state.copyWith(loading: false);
      }
    }
  }
}
