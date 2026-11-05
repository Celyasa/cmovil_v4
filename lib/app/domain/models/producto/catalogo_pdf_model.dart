import 'package:cmovil_v4/app/domain/models/producto/catalogo_pdf.dart';

class CatalogoPdfModel extends CatalogoPdf {
  CatalogoPdfModel({
    required super.nombre,
    required super.tipo,
    required super.tamanoBytes,
    required super.extension,
    required super.urlDescarga,
  });

  /// Factory para mapear el nodo 'data' que viene en el response de la API
  factory CatalogoPdfModel.fromJson(Map<String, dynamic> json) {
    return CatalogoPdfModel(
      nombre: json['nombre'] as String? ?? '',
      tipo: json['tipo'] as String? ?? '',
      tamanoBytes: json['tamanoBytes'] as int? ?? 0,
      extension: json['extension'] as String? ?? '',
      urlDescarga: json['urlDescarga'] as String? ?? '',
    );
  }

  /// Convierte el modelo técnico en la entidad limpia del dominio
  CatalogoPdf toEntity() {
    return CatalogoPdf(
      nombre: nombre,
      tipo: tipo,
      tamanoBytes: tamanoBytes,
      extension: extension,
      urlDescarga: urlDescarga,
    );
  }

  /// Método opcional por si necesitas enviar este objeto de vuelta al servidor
  // Map<String, dynamic> toJson() {
  //   return {
  //     'nombre': nombre,
  //     'tipo': tipo,
  //     'tamanoBytes': tamanoBytes,
  //     'extension': extension,
  //     'urlDescarga': urlDescarga,
  //   };
  // }
}
