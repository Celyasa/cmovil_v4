import 'package:cmovil_v4/app/domain/models/auth/login_response_model.dart';

class LoginState {
  const LoginState({
    this.usrCodigo = '',
    this.loading = false,
    this.error,
    this.response,
  });

  final String usrCodigo;
  final bool loading;
  final String? error;
  final LoginResponseModel? response;

  static const LoginState initial = LoginState();

  bool get canSubmit => usrCodigo.trim().isNotEmpty && !loading;

  bool get isSuccess => response != null;

  LoginState copyWith({
    String? usrCodigo,
    bool? loading,
    String? error,
    LoginResponseModel? response,
    bool clearError = false,
    bool clearResponse = false,
  }) {
    return LoginState(
      usrCodigo: usrCodigo ?? this.usrCodigo,
      loading: loading ?? this.loading,
      error: clearError ? null : (error ?? this.error),
      response: clearResponse ? null : (response ?? this.response),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginState &&
          other.usrCodigo == usrCodigo &&
          other.loading == loading &&
          other.error == error &&
          other.response == response;

  @override
  int get hashCode => Object.hash(usrCodigo, loading, error, response);
}
