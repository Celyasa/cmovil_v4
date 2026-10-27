import 'package:flutter/widgets.dart';

@immutable
final class ShellNavigationItem {
  const ShellNavigationItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.branchIndex,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final int branchIndex;
}
