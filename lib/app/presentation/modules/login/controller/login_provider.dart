import 'package:cmovil_v4/app/core/di/dependency_init.dart';
import 'package:cmovil_v4/app/presentation/modules/login/controller/login_controller.dart';
import 'package:cmovil_v4/app/presentation/modules/login/controller/login_state.dart';
import 'package:flutter_meedu/providers.dart';

final loginProvider = Provider.state<LoginController, LoginState>(
  (_) => LoginController(Dependencies.authController),
);
