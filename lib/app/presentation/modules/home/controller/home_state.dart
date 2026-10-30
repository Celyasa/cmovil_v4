import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';

final class HomeState {
  const HomeState({
    this.cargando = false,
    this.descargandoPortafolio = false,
    this.perfil,
    this.moduloSeleccionado,
    this.mensajeError,
    this.mensajeExito,
  });

  final bool cargando;
  final bool descargandoPortafolio;
  final UsuarioPerfil? perfil;
  final UsuarioModulo? moduloSeleccionado;
  final String? mensajeError;
  final String? mensajeExito;

  HomeState copyWith({
    bool? cargando,
    bool? descargandoPortafolio,
    UsuarioPerfil? perfil,
    UsuarioModulo? moduloSeleccionado,
    String? mensajeError,
    String? mensajeExito,
    bool limpiarError = false,
    bool limpiarExito = false,
    bool limpiarPerfil = false,
    bool limpiarModuloSeleccionado = false,
  }) {
    return HomeState(
      cargando: cargando ?? this.cargando,
      descargandoPortafolio:
          descargandoPortafolio ?? this.descargandoPortafolio,
      perfil: limpiarPerfil ? null : perfil ?? this.perfil,
      moduloSeleccionado: limpiarModuloSeleccionado
          ? null
          : moduloSeleccionado ?? this.moduloSeleccionado,
      mensajeError: limpiarError ? null : mensajeError ?? this.mensajeError,
      mensajeExito: limpiarExito ? null : mensajeExito ?? this.mensajeExito,
    );
  }
}
