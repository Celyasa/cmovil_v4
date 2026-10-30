import 'dart:async';

import 'package:cmovil_v4/app/core/errors/app_exception.dart';
import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';
import 'package:cmovil_v4/app/domain/repositories/usuario_repository.dart';
import 'package:cmovil_v4/app/presentation/modules/home/controller/home_state.dart';
import 'package:cmovil_v4/app/presentation/utils/error_messages.dart';
import 'package:flutter_meedu/notifiers.dart';

final class HomeController extends StateNotifier<HomeState> {
  HomeController(this._usuarioRepository) : super(const HomeState()) {
    _escucharPerfil();
  }

  final UsuarioRepository _usuarioRepository;

  StreamSubscription<UsuarioPerfil?>? _perfilSubscription;
  bool _actualizando = false;
  bool _descargandoPortafolio = false;
  void _escucharPerfil() {
    state = state.copyWith(cargando: true, limpiarError: true);
    _perfilSubscription = _usuarioRepository.obtenerPerfil().listen(
      _onPerfil,
      onError: _onPerfilError,
    );
  }

  void _onPerfil(UsuarioPerfil? perfil) {
    if (!mounted) return;

    if (perfil == null) {
      state = state.copyWith(
        cargando: _actualizando,
        limpiarPerfil: true,
        limpiarModuloSeleccionado: true,
        mensajeError: _actualizando
            ? null
            : 'No hay un perfil guardado en el dispositivo.',
      );
      return;
    }

    final moduloSeleccionado = _resolverModuloSeleccionado(
      perfil,
      state.moduloSeleccionado,
    );

    state = state.copyWith(
      perfil: perfil,
      moduloSeleccionado: moduloSeleccionado,
      limpiarModuloSeleccionado: moduloSeleccionado == null,
      cargando: false,
      limpiarError: true,
    );
  }

  void _onPerfilError(Object _) {
    if (!mounted) return;
    state = state.copyWith(
      cargando: false,
      mensajeError: 'No fue posible leer el perfil local.',
    );
  }

  Future<void> actualizarPerfil() async {
    if (!mounted || _actualizando) return;
    _actualizando = true;
    state = state.copyWith(
      cargando: true,
      limpiarError: true,
      limpiarExito: true,
      limpiarModuloSeleccionado: true,
    );
    String? error;
    String? exito;
    try {
      await _usuarioRepository.actualizarPerfil();

      if (!mounted) return;
      exito = 'Perfil actualizado correctamente.';
    } on AppException catch (e) {
      if (!mounted) return;
      error = userMessageFor(e);
    } catch (_) {
      if (!mounted) return;
      error = 'Ocurrió un error inesperado. Inténtalo nuevamente.';
    } finally {
      _actualizando = false;
      if (mounted) {
        state = state.copyWith(
          cargando: false,
          mensajeError: error,
          mensajeExito: exito,
          limpiarError: error == null,
          limpiarExito: exito == null,
        );
      }
    }
  }

  Future<void> descargarPortafolioPdf() async {
    if (!mounted || _descargandoPortafolio) return;
    _descargandoPortafolio = true;
    state = state.copyWith(
      descargandoPortafolio: true,
      limpiarError: true,
      limpiarExito: true,
    );

    String? mensajeError;
    String? mensajeExito;

    try {
      //final rutaArchivo = await _portafolioRepository.descargarPdf();

      if (!mounted) return;

      //mensajeExito = 'Portafolio descargado correctamente: $rutaArchivo';
    } on AppException catch (error) {
      if (!mounted) return;

      mensajeError = userMessageFor(error);
    } catch (_) {
      if (!mounted) return;

      mensajeError = 'No fue posible descargar el portafolio.';
    } finally {
      _descargandoPortafolio = false;
      if (mounted) {
        state = state.copyWith(
          descargandoPortafolio: false,
          mensajeError: mensajeError,
          mensajeExito: mensajeExito,
          limpiarError: mensajeError == null,
          //limpiarExito: mensajeExito == null,
        );
      }
    }
  }

  UsuarioModulo? _resolverModuloSeleccionado(
    UsuarioPerfil perfil,
    UsuarioModulo? actual,
  ) {
    for (final modulo in perfil.modulos) {
      if (modulo.selected) return modulo;
    }
    if (perfil.modulos.length == 1) return perfil.modulos.single;
    if (actual == null) return null;
    for (final modulo in perfil.modulos) {
      if (modulo.usrIdExt == actual.usrIdExt) return modulo;
    }
    return null;
  }

  Future<void> seleccionarModulo(UsuarioModulo? modulo) async {
    if (!mounted || modulo == null) return;
    final modulos = state.perfil?.modulos ?? const <UsuarioModulo>[];
    if (!modulos.any((m) => m.usrIdExt == modulo.usrIdExt)) {
      return;
    }
    try {
      await _usuarioRepository.seleccionarModulo(modulo.usrIdExt);
      if (!mounted) return;
      state = state.copyWith(moduloSeleccionado: modulo, limpiarError: true);
    } on AppException catch (e) {
      if (!mounted) return;
      state = state.copyWith(mensajeError: userMessageFor(e));
    } catch (_) {
      if (!mounted) return;
      state = state.copyWith(
        mensajeError: 'No fue posible guardar el módulo seleccionado.',
      );
    }
  }

  /// Limpia el mensaje de error (lo llama la vista tras mostrar el SnackBar).
  void limpiarError() {
    if (state.mensajeError == null) return;
    state = state.copyWith(limpiarError: true);
  }

  void limpiarExito() {
    if (state.mensajeExito == null) return;
    state = state.copyWith(limpiarExito: true);
  }

  @override
  void dispose() {
    _perfilSubscription?.cancel();
    _perfilSubscription = null;
    super.dispose();
  }
}
