enum TipoArchivo {
  catalogo('catalogos', soloUltimo: true),
  factura('facturas', diasVida: 180),
  recibo('recibos', diasVida: 180),
  foto('fotos', diasVida: 90), // ajusta según el uso real
  apk('apks', soloUltimo: true),
  temporal('temporal', diasVida: 7);

  const TipoArchivo(this.carpeta, {this.soloUltimo = false, this.diasVida});
  final String carpeta;

  /// `true`: al guardar uno nuevo se borran los anteriores del mismo tipo.
  final bool soloUltimo;

  /// Días sin uso tras los cuales se borra. `null`: nunca caduca por edad.
  final int? diasVida;
}
