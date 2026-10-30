import 'package:cmovil_v4/app/core/di/dependency_init.dart';
import 'package:cmovil_v4/app/presentation/modules/home/controller/home_controller.dart';
import 'package:cmovil_v4/app/presentation/modules/home/controller/home_state.dart';
import 'package:flutter_meedu/providers.dart';

final homeProvider = Provider.state<HomeController, HomeState>(
  (_) => HomeController(Dependencies.usuarioRepository),
  autoDispose: false,
);
