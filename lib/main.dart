import 'package:cmovil_v4/app/core/di/dependency_init.dart';
import 'package:cmovil_v4/app/my_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await injectDependencies();
  runApp(const MyApp());
}
