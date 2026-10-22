import 'package:cmovil_v4/app/presentation/modules/splash/controller/splash_provider.dart';
import 'package:cmovil_v4/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Consumer(
            builder: (context, ref, _) {
              ref.listen(
                splashProvider,
                callback: (notifier) {
                  if (notifier.state) {
                    context.go(Routes.home);
                  }
                },
              );

              ref.watch(splashProvider);

              return Column(
                mainAxisSize: MainAxisSize.min,
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
