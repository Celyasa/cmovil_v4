import 'package:cmovil_v4/app/presentation/modules/main_shell/config/home_navigation_config.dart';
import 'package:cmovil_v4/app/presentation/modules/main_shell/controller/main_shell_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:go_router/go_router.dart';

class MainShellView extends StatelessWidget {
  const MainShellView({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    // Usamos el Consumer con el parámetro 'ref' que nos provee Meedu
    return Consumer(
      builder: (context, ref, child) {
        // Observamos el provider usando ref.watch() para que reconstruya la UI ante cambios
        final controller = ref.watch(mainShellProvider);
        // Obtenemos el nombre del módulo actual desde el estado (ej: 'PREVENTA', 'COBRANZA')
        final modNombre = controller.state.modNombre;
        // Obtenemos los tabs que le corresponden a este módulo según la Opción 2
        final navItems = HomeNavigationConfig.forModule(modNombre);
        // Validamos el índice actual del router respecto a los items visibles
        final currentIndex = navItems.indexWhere(
          (item) => item.branchIndex == navigationShell.currentIndex,
        );
        final safeIndex = currentIndex != -1 ? currentIndex : 0;
        return Scaffold(
          body: navigationShell, // Mantiene vivas las vistas de las pestañas
          bottomNavigationBar: NavigationBar(
            selectedIndex: safeIndex,
            onDestinationSelected: (int index) {
              final selectedItem = navItems[index];

              // Navegamos usando directamente el branchIndex seguro de la Opción 2
              navigationShell.goBranch(
                selectedItem.branchIndex,
                initialLocation:
                    selectedItem.branchIndex == navigationShell.currentIndex,
              );
            },
            destinations: navItems.map((item) {
              return NavigationDestination(
                icon: Icon(item.icon),
                selectedIcon: Icon(item.selectedIcon),
                label: item.label,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
