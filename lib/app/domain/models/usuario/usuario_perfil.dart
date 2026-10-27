class UsuarioPerfil {
  const UsuarioPerfil({
    required this.empId,
    required this.empNombre,
    required this.usrNombre,
    required this.modulos,
  });

  final int empId;
  final String empNombre;
  final String usrNombre;
  final List<Modulo> modulos;

  // En Dart moderno, si un tipo no coincide, Dart lanzará un TypeError automáticamente.
  // No necesitas validar tipo por tipo con 'is!'.
  factory UsuarioPerfil.fromJson(Map<String, dynamic> json) {
    return UsuarioPerfil(
      empId: json['empId'] as int,
      empNombre: json['empNombre'] as String,
      usrNombre: json['usrNombre'] as String,
      modulos: (json['modulos'] as List)
          .map((m) => Modulo.fromJson(m as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Modulo {
  const Modulo({
    required this.usrIdExt,
    required this.modNombre,
    required this.almNombre,
  });

  final String usrIdExt;
  final String modNombre;
  final String almNombre;

  factory Modulo.fromJson(Map<String, dynamic> json) {
    return Modulo(
      usrIdExt: json['usrIdExt'] as String,
      modNombre: json['modNombre'] as String,
      almNombre: json['almNombre'] as String,
    );
  }
}
