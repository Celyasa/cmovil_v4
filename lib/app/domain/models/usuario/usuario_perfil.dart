class UsuarioPerfil {
  const UsuarioPerfil({
    required this.empId,
    required this.empNombre,
    required this.usrNombre,
    required this.usrCodigo,
    required this.modulos,
  });

  final int empId;
  final String empNombre;
  final String usrNombre;
  final String usrCodigo;
  final List<UsuarioModulo> modulos;
  @override
  String toString() {
    return 'UsuarioPerfil(empId: $empId, empNombre: $empNombre, usrNombre: $usrNombre, usrCodigo: $usrCodigo, modulos: $modulos)';
  }
}

class UsuarioModulo {
  const UsuarioModulo({
    required this.modId,
    required this.modNombre,
    required this.usrIdExt,
    required this.almId,
    required this.almNombre,
    required this.selected,
  });

  final int modId;
  final String modNombre;
  final String usrIdExt;
  final int almId;
  final String almNombre;
  final bool selected;
  @override
  String toString() {
    return 'UsuarioModulo(modId: $modId, modNombre: $modNombre, usrIdExt: $usrIdExt, almId: $almId, almNombre: $almNombre, selected: $selected)';
  }
}
