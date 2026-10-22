import 'package:cmovil_v4/app/presentation/modules/home/controller/home_controller.dart';
import 'package:flutter_meedu/providers.dart';

final homeProvider = Provider.state<HomeController, int>(
  (_) => HomeController(),
);
