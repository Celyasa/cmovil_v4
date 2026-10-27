class MainShellState {
  final String? modNombre;

  const MainShellState({this.modNombre});

  MainShellState copyWith({String? modNombre}) {
    return MainShellState(modNombre: modNombre ?? this.modNombre);
  }
}
