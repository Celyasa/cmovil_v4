import 'package:dio/dio.dart';

final class DownloadService {
  DownloadService(this._dio);

  final Dio _dio;

  Future<void> descargar({
    required String url,
    required String ruta,
    required CancelToken cancelToken,
    required ProgressCallback onProgress,
  }) async {
    await _dio.download(
      url,
      ruta,
      cancelToken: cancelToken,
      deleteOnError: true,
      onReceiveProgress: onProgress,
      options: Options(
        receiveTimeout: const Duration(minutes: 5),
        followRedirects: true,
        extra: <String, dynamic>{'autenticado': false},
      ),
    );
  }
}
