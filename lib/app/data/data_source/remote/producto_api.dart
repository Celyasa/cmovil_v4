import 'package:cmovil_v4/app/core/config/api_config.dart';
import 'package:cmovil_v4/app/core/errors/app_exception.dart';
import 'package:cmovil_v4/app/core/network/api_guard.dart';
import 'package:cmovil_v4/app/domain/models/producto/catalogo_pdf_model.dart';
import 'package:dio/dio.dart';

final class ProductoApi {
  ProductoApi(this._dio);
  final Dio _dio;
  Future<CatalogoPdfModel> obtenerCatalogoPdf() {
    return guardApiCall(() async {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiConfig.productoCatalogo,
      );
      final data = response.data;
      if (data == null) throw const InvalidResponseException();
      if (data['success'] != true) throw const InvalidResponseException();
      final payload = data['data'] as Map<String, dynamic>;
      return CatalogoPdfModel.fromJson(payload);
    });
  }
}
