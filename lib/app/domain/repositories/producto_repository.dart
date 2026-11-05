import 'package:cmovil_v4/app/domain/models/producto/catalogo_pdf.dart';

abstract interface class ProductoRepository {
  Future<CatalogoPdf> obtenerCatalogoPdf();
}
