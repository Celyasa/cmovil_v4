class Usuario {
  const Usuario({
    required this.usrCodigo,
    required this.usrNombre,
    required this.empNombre,
    required this.licId,
    required this.licNombre,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      usrCodigo: json['usrCodigo'] as String,
      usrNombre: json['usrNombre'] as String,
      empNombre: json['empNombre'] as String,
      licId: json['licId'] as String,
      licNombre: json['licNombre'] as String,
    );
  }

  final String usrCodigo;
  final String usrNombre;
  final String empNombre;
  final String licId;
  final String licNombre;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'usrCodigo': usrCodigo,
      'usrNombre': usrNombre,
      'empNombre': empNombre,
      'licId': licId,
      'licNombre': licNombre,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Usuario &&
          other.usrCodigo == usrCodigo &&
          other.usrNombre == usrNombre &&
          other.empNombre == empNombre &&
          other.licId == licId &&
          other.licNombre == licNombre;

  @override
  int get hashCode =>
      Object.hash(usrCodigo, usrNombre, empNombre, licId, licNombre);
}
