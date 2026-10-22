import 'package:cmovil_v4/app/core/providers/repositories.dart';
import 'package:cmovil_v4/app/presentation/global/widgets/route_error_view.dart';
import 'package:cmovil_v4/app/presentation/modules/home/view/home_view.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/login_view.dart';
import 'package:cmovil_v4/app/presentation/modules/splash/view/splash_view.dart';
import 'package:cmovil_v4/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Configuración central de navegación de la aplicación.
abstract final class AppRouter {
  /// Clave del navegador raíz.
  ///
  /// Puede utilizarse para acceder al estado del navegador principal
  /// cuando no se dispone directamente de un BuildContext.
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  /// Instancia única y persistente del enrutador.
  ///
  /// Se inicializa una sola vez cuando se accede por primera vez.
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.splash,

    // ─── Guards globales ────────────────────────────────────────────────
    //
    // Se configurarán cuando exista el estado de autenticación.
    //
    redirect: (BuildContext context, GoRouterState state) async {
      final authRepository = Repositories.auth.read();
      final bool isLoggedIn = await authRepository.hasActiveSession();
      final bool isOnLogin = state.matchedLocation == Routes.login;
      final bool isOnSplash = state.matchedLocation == Routes.splash;
      // Si no ha iniciado sesión y no está en Login o Splash, redirigir a Login
      if (!isLoggedIn && !isOnLogin && !isOnSplash) {
        return Routes.login;
      }
      // Si ya inició sesión e intenta ir a Login o Splash, redirigir a Home
      if (isLoggedIn && (isOnLogin || isOnSplash)) {
        return Routes.home;
      }
      // De lo contrario, permitir la navegación normal
      return null;
    },

    // ─── Rutas de la aplicación ────────────────────────────────────────
    routes: <RouteBase>[
      GoRoute(
        name: Routes.splashName,
        path: Routes.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        name: Routes.loginName,
        path: Routes.login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        name: Routes.homeName,
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),

      // Ejemplo futuro:
      //
    ],

    // ─── Ruta no encontrada ────────────────────────────────────────────
    errorBuilder: (BuildContext context, GoRouterState state) {
      return RouteErrorView(location: state.uri.toString());
    },
  );
}
