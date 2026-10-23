import 'package:cmovil_v4/app/presentation/modules/splash/controller/splash_provider.dart';
import 'package:cmovil_v4/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
      body: Center(
        // 1. Center va afuera para un centrado absoluto en pantalla
        child: SafeArea(
          child: Consumer(
            builder: (context, ref, _) {
              // 2. Listener limpio de Meedu (monitorea el estado sin re-renders visuales)
              ref.listen(
                splashProvider,
                callback: (controller) {
                  if (controller.state) {
                    context.go(Routes.home);
                  }
                },
              );
              // 3. Eliminamos el ref.watch innecesario para evitar redibujos del diseño fijo
              return Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Enfoque vertical centrado
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Enfoque horizontal centrado
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_cmovil.png',
                    height: 96,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.business_rounded,
                        size: 88,
                        color: colors.primary,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'CMovil V4',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.primary,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
