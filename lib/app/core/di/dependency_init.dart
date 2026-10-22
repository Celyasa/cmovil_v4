import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> injectDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inyección de dependencias de los repositorios.
  const secureStorage = FlutterSecureStorage();
  //QUÍ INTEGRARÁS TU BASE DE DATOS LOCAL
}
