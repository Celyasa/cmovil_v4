import 'package:flutter_meedu/notifiers.dart';

class HomeController extends StateNotifier<int> {
  HomeController() : super(0);

  void increment() {
    state++;
  }
}
