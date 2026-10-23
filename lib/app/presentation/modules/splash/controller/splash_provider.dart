import 'package:cmovil_v4/app/core/di/dependency_init.dart';
import 'package:cmovil_v4/app/presentation/modules/splash/controller/splash_controller.dart';
import 'package:flutter_meedu/providers.dart';

final splashProvider = StateNotifierProvider<SplashController, void>(
  (_) => SplashController(Dependencies.authController),
);
