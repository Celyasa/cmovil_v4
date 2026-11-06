import 'dart:io';

import 'package:cmovil_v4/app/core/network/download_service.dart';
import 'package:cmovil_v4/app/core/storage/archivo_storage.dart';
import 'package:cmovil_v4/app/core/storage/tipo_archivo.dart';
import 'package:cmovil_v4/app/presentation/global/widgets/app_progress_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final class AppDownloadController extends ChangeNotifier {
  AppDownloadController(this._downloadService, this._storage);

  final DownloadService _downloadService;
  final ArchivoStorage _storage;

  double? _progress;
  String _message = 'Preparando...';
  bool _isDownloading = false;

  CancelToken? _cancelToken;

  double? get progress => _progress;
  String get message => _message;
  bool get isDownloading => _isDownloading;

  void _update({double? progress, String? message}) {
    _progress = progress;

    if (message != null) {
      _message = message;
    }

    notifyListeners();
  }

  Future<File> descargar(
    BuildContext context, {
    required String url,
    required String nombre,
    required int tamanoBytes,
    required TipoArchivo tipo,
    String titulo = 'Descargando archivo',
  }) async {
    if (_isDownloading) {
      throw StateError('Ya existe una descarga en curso.');
    }

    // Comprobar si el archivo ya existe con el tamaño esperado.
    final existente = await _storage.existente(
      tipo,
      nombre: nombre,
      tamanoBytes: tamanoBytes,
    );

    if (existente != null) return existente;

    if (!context.mounted) {
      throw StateError('La pantalla ya no está disponible.');
    }

    _isDownloading = true;

    final token = CancelToken();
    _cancelToken = token;

    _update(progress: null, message: 'Preparando descarga...');

    final navigator = Navigator.of(context, rootNavigator: true);

    final dialog = AppProgressDialog.show(
      context,
      listenable: this,
      progress: () => progress,
      message: () => message,
      title: titulo,
      onCancel: cancelar,
    );

    try {
      final archivo = await _storage.asegurar(
        tipo,
        nombre: nombre,
        tamanoBytes: tamanoBytes,
        descargar: (rutaTemporal) async {
          _update(message: 'Conectando con el servidor...');

          await _downloadService.descargar(
            url: url,
            ruta: rutaTemporal,
            cancelToken: token,
            onProgress: (recibidos, total) {
              _update(
                progress: total > 0
                    ? (recibidos / total).clamp(0.0, 1.0).toDouble()
                    : null,
                message: 'Descargando archivo...',
              );
            },
          );
        },
      );

      _update(progress: 1, message: 'Descarga completada');

      return archivo;
    } finally {
      _cancelToken = null;
      _isDownloading = false;

      notifyListeners();

      if (navigator.mounted && navigator.canPop()) {
        navigator.pop();
      }

      await dialog;
    }
  }

  void cancelar() {
    final token = _cancelToken;

    if (token == null || token.isCancelled) return;

    _update(message: 'Cancelando descarga...');

    token.cancel('Cancelado por el usuario');
  }

  @override
  void dispose() {
    _cancelToken?.cancel('Controlador destruido');
    super.dispose();
  }
}
