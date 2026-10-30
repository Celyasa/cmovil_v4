import 'package:cmovil_v4/app/core/di/dependency_init.dart';
import 'package:cmovil_v4/app/presentation/global/auth/auth_controller.dart';
import 'package:cmovil_v4/app/presentation/global/auth/auth_status.dart';
import 'package:cmovil_v4/app/presentation/global/widgets/route_error_view.dart';
import 'package:cmovil_v4/app/presentation/modules/clientes/cliente_lista/view/cliente_lista_view.dart';
import 'package:cmovil_v4/app/presentation/modules/home/view/home_view.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/login_view.dart';
import 'package:cmovil_v4/app/presentation/modules/main_shell/view/main_shell_view.dart';
import 'package:cmovil_v4/app/presentation/modules/splash/view/splash_view.dart';
import 'package:cmovil_v4/app/presentation/routes/routes.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  static final AuthController _auth = Dependencies.authController;
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    refreshListenable: _auth,
    errorBuilder: (context, state) =>
        RouteErrorView(location: state.uri.toString()),
    routes: [
      GoRoute(
        path: Routes.splash,
        name: Routes.splashName,
        builder: (context, state) =>
            const SplashView(), // Mejor dejar explícitos context y state
      ),
      GoRoute(
        path: Routes.login,
        name: Routes.loginName,
        builder: (context, state) => const LoginView(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShellView(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                name: Routes.homeName,
                builder: (context, state) => const HomeView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.indicadores,
                name: Routes.indicadoresName,
                builder: (context, state) => const ClienteListaView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.clienteLista,
                name: Routes.clienteListaName,
                builder: (context, state) => const ClienteListaView(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.sincronizacion,
                name: Routes.sincronizacionName,
                builder: (context, state) => const ClienteListaView(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final location = state.matchedLocation;
      final isSplash = location == Routes.splash;
      final isLogin = location == Routes.login;
      return switch (_auth.status) {
        AuthStatus.initializing => isSplash ? null : Routes.splash,
        AuthStatus.unauthenticated => isLogin ? null : Routes.login,
        AuthStatus.authenticated => (isSplash || isLogin) ? Routes.home : null,
      };
    },
  );
}
