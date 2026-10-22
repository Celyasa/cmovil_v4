import 'package:cmovil_v4/app/presentation/global/theme/app_theme.dart';
import 'package:cmovil_v4/app/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Usamos .router para conectar GoRouter nativamente con el ciclo de vida de la app
    return MaterialApp.router(
      title: 'CMovil V4',
      debugShowCheckedModeBanner: false,
      routerConfig:
          AppRouter.router, // Inyecta la configuración única del enrutador
      // ─── Configuración de Temas (Opcional) ──────────────────────────────
      theme: AppTheme.light, // Tema claro
      darkTheme: AppTheme.dark, // Tema oscuro
      themeMode:
          ThemeMode.system, // Se adapta automáticamente al modo del teléfono
    );
  }
}
