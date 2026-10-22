import 'package:cmovil_v4/app/presentation/modules/splash/controller/splash_controller.dart';
import 'package:flutter_meedu/providers.dart';

final splashProvider = Provider.state<SplashController, bool>(
  (_) => SplashController(),
);
