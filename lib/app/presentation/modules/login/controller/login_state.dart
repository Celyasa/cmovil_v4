final class LoginState {
  const LoginState({this.usrCodigo = '', this.loading = false, this.error});

  static const LoginState initial = LoginState();

  final String usrCodigo;
  final bool loading;
  final String? error;

  bool get canSubmit => usrCodigo.trim().isNotEmpty && !loading;

  LoginState copyWith({
    String? usrCodigo,
    bool? loading,
    String? error,
    bool clearError = false,
  }) {
    return LoginState(
      usrCodigo: usrCodigo ?? this.usrCodigo,
      loading: loading ?? this.loading,
      error: clearError ? null : (error ?? this.error),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginState &&
          other.usrCodigo == usrCodigo &&
          other.loading == loading &&
          other.error == error;

  @override
  int get hashCode => Object.hash(usrCodigo, loading, error);
}
