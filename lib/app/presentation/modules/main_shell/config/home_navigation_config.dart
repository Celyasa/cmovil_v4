import 'package:cmovil_v4/app/presentation/modules/main_shell/view/widgets/home_navigation_item.dart';
import 'package:flutter/material.dart';

abstract final class HomeNavigationConfig {
  static const HomeNavigationItem _home = HomeNavigationItem(
    label: 'Home',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
    branchIndex: 0,
  );

  static const HomeNavigationItem _indicadores = HomeNavigationItem(
    label: 'Indicadores',
    icon: Icons.bar_chart_outlined,
    selectedIcon: Icons.bar_chart,
    branchIndex: 1,
  );

  static const HomeNavigationItem _clientes = HomeNavigationItem(
    label: 'Clientes',
    icon: Icons.people_outline,
    selectedIcon: Icons.people,
    branchIndex: 2,
  );

  static const HomeNavigationItem _cartera = HomeNavigationItem(
    label: 'Cartera',
    icon: Icons.account_balance_wallet_outlined,
    selectedIcon: Icons.account_balance_wallet,
    branchIndex: 3,
  );

  static const HomeNavigationItem _distribucion = HomeNavigationItem(
    label: 'Distribución',
    icon: Icons.local_shipping_outlined,
    selectedIcon: Icons.local_shipping,
    branchIndex: 4,
  );

  static const HomeNavigationItem _sync = HomeNavigationItem(
    label: 'Sync',
    icon: Icons.sync_outlined,
    selectedIcon: Icons.sync,
    branchIndex: 5,
  );

  // ── Lista visible por módulo ──────────────────────────

  /// Devuelve los tabs visibles para el módulo dado.
  /// El `modNombre` es el que viene del API (`PREVENTA`, `COBRANZA`, ...).
  static List<HomeNavigationItem> forModule(String? modNombre) {
    final key = modNombre?.trim().toUpperCase() ?? '';

    return switch (key) {
      // PREVENTA: oculta cartera (3) y distribución (4)
      'PREVENTA' => const [_home, _indicadores, _clientes, _sync],

      // COBRANZA: oculta clientes (2) y distribución (4)
      'COBRANZA' => const [_home, _indicadores, _cartera, _sync],

      // ADMINISTRADOR: no oculta nada
      'ADMINISTRADOR' => const [
        _home,
        _indicadores,
        _clientes,
        _cartera,
        _distribucion,
        _sync,
      ],

      // ⚠️ Aún no definidos — ponlos como quieras.
      //    Mientras no se definan, usan el fallback de abajo.
      // 'AUTOVENTA'      => const [_home, _indicadores, _clientes, _sync],
      // 'SUPERVISION'    => const [_home, _indicadores, _clientes, _sync],
      // 'SUP. CARTERA'   => const [_home, _indicadores, _cartera, _sync],
      // 'ENTREGA'        => const [_home, _indicadores, _clientes, _sync],
      // 'TELEVENTA'      => const [_home, _indicadores, _clientes, _sync],
      // 'ILUMA'          => const [_home, _indicadores, _clientes, _sync],

      // Default: lo más seguro (mismo que preventa)
      _ => const [_home, _indicadores, _clientes, _sync],
    };
  }
}
