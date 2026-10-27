abstract final class HomeUtils {
  static String obtenerIniciales(String nombre) {
    final palabras = nombre
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .take(2)
        .toList();
    if (palabras.isEmpty) return '?';
    return palabras.map((p) => p[0].toUpperCase()).join();
  }
}
