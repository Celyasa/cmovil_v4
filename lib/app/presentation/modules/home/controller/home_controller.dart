import 'package:flutter_meedu/notifiers.dart';

class HomeController extends StateNotifier<int> {
  HomeController() : super(0);
  final Map<int, String> modulos = {
    1: 'PREVENTA',
    2: 'ENTREGA',
    3: 'SUPERVISION',
    4: 'AUTOVENTA',
    5: 'COBRANZA',
    6: 'TELEVENTA',
    7: 'ILUMA',
    8: 'SUP. CARTERA',
    9: 'ADMINISTRADOR',
  };

  void increment() {
    state++;
  }

  // Función para actualizar el estado con el ID del combo box
  void setModulo(int id) {
    state = id;
  }
}
