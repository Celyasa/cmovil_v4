import 'package:cmovil_v4/app/presentation/modules/main_shell/view/widgets/shell_navigation_item.dart';
import 'package:flutter/material.dart';

abstract final class ShellNavigationConfig {
  static const _home = ShellNavigationItem(
    label: 'Home',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
    branchIndex: 0,
  );

  static const _indicadores = ShellNavigationItem(
    label: 'Indicadores',
    icon: Icons.bar_chart_outlined,
    selectedIcon: Icons.bar_chart,
    branchIndex: 1,
  );

  static const _clientes = ShellNavigationItem(
    label: 'Clientes',
    icon: Icons.people_outline,
    selectedIcon: Icons.people,
    branchIndex: 2,
  );

  static const _cartera = ShellNavigationItem(
    label: 'Cartera',
    icon: Icons.account_balance_wallet_outlined,
    selectedIcon: Icons.account_balance_wallet,
    branchIndex: 2,
  );

  static const _distribucion = ShellNavigationItem(
    label: 'Distribución',
    icon: Icons.local_shipping_outlined,
    selectedIcon: Icons.local_shipping,
    branchIndex: 2,
  );

  static const _sync = ShellNavigationItem(
    label: 'Sync',
    icon: Icons.sync_outlined,
    selectedIcon: Icons.sync,
    branchIndex: 3,
  );

  static const _sinModulo = [_home, _indicadores, _sync];

  static const _conClientes = [_home, _indicadores, _clientes, _sync];

  static const _conCartera = [_home, _indicadores, _cartera, _sync];

  static const _conDistribucion = [_home, _indicadores, _distribucion, _sync];

  static List<ShellNavigationItem> forModule(String? modNombre) {
    final key = modNombre?.trim().toUpperCase();

    return switch (key) {
      null || '' => _sinModulo,
      'PREVENTA' => _conClientes,
      'COBRANZA' || 'SUP. CARTERA' => _conCartera,
      'ADMINISTRADOR' => _conDistribucion,
      _ => _conClientes,
    };
  }
}
