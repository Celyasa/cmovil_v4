import 'package:cmovil_v4/app/core/network/dio_factory.dart';
import 'package:dio/dio.dart';

abstract final class Dependencies {
  static late final Dio dio;
}

Future<void> initializeDependencies() async {
  Dependencies.dio = DioFactory.create();
}
