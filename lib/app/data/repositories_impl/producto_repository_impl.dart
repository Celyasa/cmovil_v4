import 'package:cmovil_v4/app/data/data_source/remote/producto_api.dart';
import 'package:cmovil_v4/app/domain/models/producto/catalogo_pdf.dart';
import 'package:cmovil_v4/app/domain/repositories/producto_repository.dart';

final class ProductoRepositoryImpl implements ProductoRepository {
  ProductoRepositoryImpl(this._productoApi);
  final ProductoApi _productoApi;

  @override
  Future<CatalogoPdf> obtenerCatalogoPdf() async {
    final response = await _productoApi.obtenerCatalogoPdf();
    return response.toEntity();
  }
}
