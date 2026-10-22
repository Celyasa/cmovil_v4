import 'package:cmovil_v4/app/core/providers/repositories.dart';
import 'package:cmovil_v4/app/presentation/modules/login/controller/login_controller.dart';
import 'package:cmovil_v4/app/presentation/modules/login/controller/login_state.dart';
import 'package:flutter_meedu/providers.dart';

final loginProvider = StateNotifierProvider<LoginController, LoginState>(
  (_) => LoginController(Repositories.auth.read()),
);
