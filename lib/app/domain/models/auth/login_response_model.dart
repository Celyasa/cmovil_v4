class LoginResponseModel {
  const LoginResponseModel({
    required this.tokenType,
    required this.accessToken,
    required this.usuario,
  });

  final String tokenType;
  final String accessToken;
  final LoginUserModel usuario;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      tokenType: json['tokenType'] as String,
      accessToken: json['accessToken'] as String,
      usuario: LoginUserModel.fromJson(
        Map<String, dynamic>.from(json['usuario'] as Map),
      ),
    );
  }
}

class LoginUserModel {
  const LoginUserModel({
    required this.usrCodigo,
    required this.usrNombre,
    required this.empNombre,
    required this.licId,
    required this.licNombre,
  });

  final String usrCodigo;
  final String usrNombre;
  final String empNombre;
  final String licId;
  final String licNombre;

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      usrCodigo: json['usrCodigo'] as String,
      usrNombre: json['usrNombre'] as String,
      empNombre: json['empNombre'] as String,
      licId: json['licId'].toString(),
      licNombre: json['licNombre'] as String,
    );
  }
}
