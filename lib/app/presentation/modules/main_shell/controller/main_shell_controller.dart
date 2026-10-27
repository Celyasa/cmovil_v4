import 'package:cmovil_v4/app/presentation/modules/main_shell/controller/main_shell_state.dart';
import 'package:flutter_meedu/notifiers.dart';

class MainShellController extends StateNotifier<MainShellState> {
  MainShellController() : super(const MainShellState());

  /// Inicializa o actualiza el nombre del módulo activo (ej. desde el login o perfil)
  void setModulo(String? modNombre) {
    state = state.copyWith(modNombre: modNombre);
  }
}
