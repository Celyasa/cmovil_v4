import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';
import 'package:cmovil_v4/app/domain/repositories/usuario_repository.dart';
import 'package:cmovil_v4/app/presentation/modules/home/controller/home_state.dart';
import 'package:flutter_meedu/notifiers.dart';

final class HomeController extends StateNotifier<HomeState> {
  HomeController(this._usuarioRepository) : super(const HomeState());

  final UsuarioRepository _usuarioRepository;
  Future<void> cargarDatosIniciales() async {
    // Cuando agregues más, usa Future.wait para peticiones en paralelo
    await cargarPerfil();
  }

  Future<void> cargarPerfil() async {
    if (state.cargando || state.perfil != null) return;
    state = state.copyWith(cargando: true, limpiarError: true);
    try {
      final perfil = await _usuarioRepository.obtenerPerfil();
      if (!mounted) return;
      final moduloActual = state.moduloSeleccionado;

      final Modulo? moduloSeleccionado;

      if (perfil.modulos.length == 1) {
        // Selección automática cuando solo existe un módulo.
        moduloSeleccionado = perfil.modulos.single;
      } else if (moduloActual != null) {
        // Conservar la selección si el módulo todavía existe.
        Modulo? encontrado;

        for (final modulo in perfil.modulos) {
          if (modulo.usrIdExt == moduloActual.usrIdExt) {
            encontrado = modulo;
            break;
          }
        }

        moduloSeleccionado = encontrado;
      } else {
        moduloSeleccionado = null;
      }

      state = state.copyWith(
        cargando: false,
        perfil: perfil,
        moduloSeleccionado: moduloSeleccionado,
        limpiarError: true,
      );
    } catch (_) {
      if (!mounted) return;
      state = state.copyWith(
        cargando: false,
        mensajeError: 'No fue posible cargar tu perfil. Verifica tu conexión e inténtalo nuevamente.',
      );
    }
  }

  void seleccionarModulo(Modulo? modulo) {
    final modulos = state.perfil?.modulos ?? const <Modulo>[];
    // Comparar por identidad de datos, no por instancia.
    if (modulo != null && !modulos.any((m) => m.usrIdExt == modulo.usrIdExt)) {
      return;
    }
    state = state.copyWith(moduloSeleccionado: modulo, limpiarError: true);
  }

  Future<void> reintentar() async {
    if (state.cargando) return;
    state = state.copyWith(
      limpiarError: true,
      limpiarPerfil: true,
      limpiarModuloSeleccionado: true,
    );
    await cargarPerfil();
  }
}
