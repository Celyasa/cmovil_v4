import 'package:flutter_meedu/notifiers.dart';

class SplashController extends StateNotifier<bool> {
  SplashController() : super(false) {
    _init();
  }

  Future<void> _init() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    state = true;
  }
}
