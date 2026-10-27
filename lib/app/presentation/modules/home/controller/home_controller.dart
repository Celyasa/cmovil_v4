import 'package:flutter_meedu/notifiers.dart';

class HomeController extends StateNotifier<int> {
  HomeController() : super(0);

  void increment() {
    state++;
  }

  // Función para actualizar el estado con el ID del combo box
  void setModulo(int id) {
    state = id;
  }
}
