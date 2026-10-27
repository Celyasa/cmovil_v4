import 'package:cmovil_v4/app/presentation/modules/home/controller/home_provider.dart';
import 'package:cmovil_v4/app/presentation/modules/main_shell/config/shell_navigation_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';
import 'package:go_router/go_router.dart';

final class MainShellView extends StatelessWidget {
  const MainShellView({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, _) {
        final modulo = ref.watch(homeProvider).state.moduloSeleccionado;
        final items = ShellNavigationConfig.forModule(modulo?.modNombre);

        final selectedIndex = items.indexWhere(
          (item) => item.branchIndex == navigationShell.currentIndex,
        );

        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
            onDestinationSelected: (index) {
              final branchIndex = items[index].branchIndex;

              navigationShell.goBranch(
                branchIndex,
                initialLocation: branchIndex == navigationShell.currentIndex,
              );
            },
            destinations: [
              for (final item in items)
                NavigationDestination(
                  icon: Icon(item.icon),
                  selectedIcon: Icon(item.selectedIcon),
                  label: item.label,
                ),
            ],
          ),
        );
      },
    );
  }
}
