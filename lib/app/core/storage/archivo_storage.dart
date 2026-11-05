import 'dart:io';

import 'package:cmovil_v4/app/core/errors/app_exception.dart';
import 'package:cmovil_v4/app/core/storage/tipo_archivo.dart';
import 'package:path_provider/path_provider.dart';

final class ArchivoStorage {
  Directory? _raiz;

  Future<Directory> _carpeta(TipoArchivo tipo) async {
    _raiz ??= await getApplicationSupportDirectory();
    return Directory('${_raiz!.path}/archivos/${tipo.carpeta}')
        .create(recursive: true);
  }

  /// El nombre viene del servidor: se rechaza cualquier intento de salir de la carpeta.
  Future<File> _destino(TipoArchivo tipo, String nombre) async {
    if (nombre.isEmpty ||
        nombre.contains(RegExp(r'[\\/]')) ||
        nombre.contains('..')) {
      throw const InvalidResponseException();
    }
    return File('${(await _carpeta(tipo)).path}/$nombre');
  }

  /// Devuelve el archivo local. Si ya existe con el mismo nombre y tamaño no
  /// vuelve a descargar. [descargar] escribe en la ruta temporal que recibe.
  /// El destino solo se toca cuando la descarga está completa y validada.
  Future<File> asegurar(
    TipoArchivo tipo, {
    required String nombre,
    required int tamanoBytes,
    required Future<void> Function(String rutaTemporal) descargar,
  }) async {
    if (tamanoBytes <= 0) throw const InvalidResponseException();

    final destino = await _destino(tipo, nombre);

    if (await _coincide(destino, tamanoBytes)) {
      // La vida cuenta desde el último uso.
      await destino.setLastModified(DateTime.now());
    } else {
      final parcial = File('${destino.path}.part');
      try {
        await descargar(parcial.path);
        // El tamaño declarado detecta descargas cortadas y páginas de error.
        if (!await _coincide(parcial, tamanoBytes)) {
          throw const InvalidResponseException();
        }
        await parcial.rename(destino.path);
      } catch (_) {
        await _borrar(parcial); // la copia anterior no se toca
        rethrow;
      }
    }

    await _purgar(tipo, conservar: destino);
    return destino;
  }

  /// El archivo más reciente del tipo, para trabajar sin conexión.
  Future<File?> ultimo(TipoArchivo tipo) async {
    File? ultimo;
    DateTime? fecha;
    await for (final e in (await _carpeta(tipo)).list()) {
      if (e is! File || e.path.endsWith('.part')) continue;
      final modificado = await e.lastModified();
      if (fecha == null || modificado.isAfter(fecha)) {
        ultimo = e;
        fecha = modificado;
      }
    }
    return ultimo;
  }

  Future<bool> _coincide(File archivo, int tamanoBytes) async =>
      await archivo.exists() && await archivo.length() == tamanoBytes;

  /// Aplica `soloUltimo` y `diasVida`. Nunca toca el archivo que se acaba de asegurar.
  Future<void> _purgar(TipoArchivo tipo, {required File conservar}) async {
    final ahora = DateTime.now();
    await for (final e in conservar.parent.list()) {
      if (e is! File || e.path == conservar.path) continue;

      final edad = ahora.difference(await e.lastModified());
      final esParcial = e.path.endsWith('.part');
      final borrar = esParcial
          // Un .part reciente puede ser una descarga en curso: solo huérfanos viejos.
          ? edad > const Duration(hours: 1)
          : tipo.soloUltimo ||
                (tipo.diasVida != null && edad.inDays >= tipo.diasVida!);

      if (borrar) await _borrar(e);
    }
  }

  Future<void> _borrar(File archivo) async {
    try {
      if (await archivo.exists()) await archivo.delete();
    } on FileSystemException {
      // Best-effort: un residuo no debe romper la descarga.
    }
  }
}
