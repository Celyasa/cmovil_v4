abstract final class Routes {
  // Splash
  static const String splash = '/';
  static const String splashName = 'splash';

  // Login
  static const String login = '/login';
  static const String loginName = 'login';

  // ── Shell: cada tab es hermano, no hijo
  //    (el shell no tiene path; estos son los paths de las tabs)

  // Tab 1
  static const String home = '/home';
  static const String homeName = 'home';

  // Tab 2
  static const String indicadores = '/indicadores';
  static const String indicadoresName = 'indicadores';

  // Tab 3 dinámico — clientes (tu feature actual)
  static const String clienteLista = '/cliente/cliente-lista';
  static const String clienteListaName = 'clienteLista';

  // Tab 4
  static const String sync = '/sync';
  static const String syncName = 'sync';
}
