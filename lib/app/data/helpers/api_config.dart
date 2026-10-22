abstract final class ApiConfig {
  /// URL predeterminada de desarrollo.
  static const String defaultBaseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'http://192.168.10.102:3001/cmovil4/api/v1',
  );
  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration sendTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  static const String login = '/auth/login';
}
