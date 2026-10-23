import 'package:cmovil_v4/app/presentation/global/auth/auth_controller.dart';
import 'package:flutter_meedu/notifiers.dart';

class SplashController extends StateNotifier<void> {
  SplashController(this._auth) : super(null) {
    _init();
  }
  static const Duration _minimumDuration = Duration(seconds: 3);
  final AuthController _auth;
  Future<void> _init() async {
    await _auth.initialize();
    await Future<void>.delayed(_minimumDuration);
  }
}
