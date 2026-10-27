import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';

final class HomeState {
  const HomeState({
    this.cargando = false,
    this.perfil,
    this.moduloSeleccionado,
    this.mensajeError,
  });

  final bool cargando;
  final UsuarioPerfil? perfil;
  final Modulo? moduloSeleccionado;
  final String? mensajeError;

  HomeState copyWith({
    bool? cargando,
    UsuarioPerfil? perfil,
    Modulo? moduloSeleccionado,
    String? mensajeError,
    bool limpiarError = false,
    bool limpiarPerfil = false,
    bool limpiarModuloSeleccionado = false,
  }) {
    return HomeState(
      cargando: cargando ?? this.cargando,
      perfil: limpiarPerfil ? null : perfil ?? this.perfil,
      moduloSeleccionado: limpiarModuloSeleccionado
          ? null
          : moduloSeleccionado ?? this.moduloSeleccionado,
      mensajeError: limpiarError ? null : mensajeError ?? this.mensajeError,
    );
  }
}
