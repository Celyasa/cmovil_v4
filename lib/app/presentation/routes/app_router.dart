import 'package:cmovil_v4/app/presentation/modules/home/view/home_view.dart';
import 'package:cmovil_v4/app/presentation/modules/splash/view/splash_view.dart';
import 'package:cmovil_v4/app/presentation/routes/routes.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        name: Routes.splashName,
        builder: (context, state) =>
            const SplashView(), // Mejor dejar explícitos context y state
      ),
      // GoRoute(
      //   path: Routes.login,
      //   name: Routes.loginName,
      //   builder: (context, state) => const LoginView(),
      // ),
      GoRoute(
        path: Routes.home,
        name: Routes.homeName,
        builder: (context, state) => const HomeView(),
      ),
    ],
    // redirect: (context, state) {
    //   return null;
    //   // final location = state.matchedLocation;

    //   // final isLoggedIn = true;
    //   // final isLogin = location == Routes.login;
    //   // final isSplash = location == Routes.splash;

    //   // // Sin sesión: no permitir entrar a Home.
    //   // if (!isLoggedIn && !isLogin && !isSplash) {
    //   //   return Routes.login;
    //   // }

    //   // // Con sesión: evitar volver al Login.
    //   // if (isLoggedIn && (isLogin || isSplash)) {
    //   //   return Routes.home;
    //   // }

    //   // return null;

    //   // Opcion 1
    //   // final location = state.matchedLocation;
    //   // // Leemos el estado del splashProvider
    //   // final isReady = splashProvider.read().state;
    //   // // Mientras no esté listo, quédate en splash
    //   // if (!isReady) return location == Routes.splash ? null : Routes.splash;
    //   // // Aquí vendrá tu AuthController real
    //   // final bool loggedIn = false;
    //   // if (!loggedIn && location == Routes.home) {
    //   //   return Routes.login;
    //   // }
    //   // if (loggedIn && (location == Routes.splash || location == Routes.login)) {
    //   //   return Routes.home;
    //   // }
    //   // return null;

    //   // Opcion 2
    //   // final bool loggedIn =
    //   //     true; // Aquí conectarás tu AuthController o Drift/Hive/SecureStorage

    //   // final String location = state.matchedLocation;

    //   // // 1. Definimos las rutas que no requieren estar logueado
    //   // final bool isGoingToPublicRoute =
    //   //     location == Routes.splash || location == Routes.login;

    //   // // 2. Si NO está logueado y quiere entrar a una zona privada (como Home), al calabozo (Login)
    //   // if (!loggedIn && !isGoingToPublicRoute) {
    //   //   return Routes.login;
    //   // }

    //   // // 3. Si SÍ está logueado y de ocioso quiere volver al Login o Splash, lo mandamos a trabajar (Home)
    //   // if (loggedIn && isGoingToPublicRoute) {
    //   //   return Routes.home;
    //   // }

    //   // // De lo contrario, lo dejamos navegar libremente
    //   // return null;
    // },
  );
}
