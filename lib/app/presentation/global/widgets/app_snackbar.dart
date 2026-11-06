import 'package:cmovil_v4/app/presentation/global/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppSnackBar {
  static const Duration _defaultDuration = Duration(seconds: 4);

  // ── API pública ────────────────────────────────────────────

  static void success(
    BuildContext context,
    String message, {
    Duration duration = _defaultDuration,
    String? actionLabel,
    VoidCallback? onAction,
  }) => _show(
    context,
    variant: _Variant.success,
    message: message,
    duration: duration,
    actionLabel: actionLabel,
    onAction: onAction,
  );

  static void error(
    BuildContext context,
    String message, {
    Duration duration = _defaultDuration,
    String? actionLabel,
    VoidCallback? onAction,
  }) => _show(
    context,
    variant: _Variant.error,
    message: message,
    duration: duration,
    actionLabel: actionLabel,
    onAction: onAction,
  );

  static void warning(
    BuildContext context,
    String message, {
    Duration duration = _defaultDuration,
    String? actionLabel,
    VoidCallback? onAction,
  }) => _show(
    context,
    variant: _Variant.warning,
    message: message,
    duration: duration,
    actionLabel: actionLabel,
    onAction: onAction,
  );

  static void info(
    BuildContext context,
    String message, {
    Duration duration = _defaultDuration,
    String? actionLabel,
    VoidCallback? onAction,
  }) => _show(
    context,
    variant: _Variant.info,
    message: message,
    duration: duration,
    actionLabel: actionLabel,
    onAction: onAction,
  );

  /// Neutro — para confirmaciones banales ("Copiado", "Guardado").
  /// Usa `surfaceContainerHighest` + `onSurface` del tema → se ve bien
  /// en light y dark sin tocar `AppColors`.
  static void neutral(
    BuildContext context,
    String message, {
    Duration duration = _defaultDuration,
    String? actionLabel,
    VoidCallback? onAction,
  }) => _show(
    context,
    variant: _Variant.neutral,
    message: message,
    duration: duration,
    actionLabel: actionLabel,
    onAction: onAction,
  );

  // ── Internos ───────────────────────────────────────────────

  static void _show(
    BuildContext context, {
    required _Variant variant,
    required String message,
    required Duration duration,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final messenger = ScaffoldMessenger.of(context);

    final (Color bg, Color fg) = _resolve(variant, scheme, isDark);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: <Widget>[
              Icon(_iconOf(variant), color: fg, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: theme.textTheme.labelLarge?.copyWith(color: fg),
                ),
              ),
            ],
          ),
          backgroundColor: bg,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          elevation: 4,
          showCloseIcon: true,
          closeIconColor: fg.withValues(alpha: 0.75),
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          action: (actionLabel != null && onAction != null)
              ? SnackBarAction(
                  label: actionLabel,
                  onPressed: onAction,
                  textColor: fg,
                )
              : null,
        ),
      );
  }

  /// Resuelve `(background, foreground)` por variante y por modo.
  /// **Único sitio** con `AppColors` para estados.
  static (Color, Color) _resolve(
    _Variant variant,
    ColorScheme scheme,
    bool isDark,
  ) {
    switch (variant) {
      case _Variant.success:
        return (
          isDark ? AppColors.darkSuccess : AppColors.lightSuccess,
          isDark ? Colors.black : Colors.white,
        );
      case _Variant.warning:
        return (
          isDark ? AppColors.darkWarning : AppColors.lightWarning,
          isDark ? Colors.black : Colors.white,
        );
      case _Variant.info:
        return (
          isDark ? AppColors.darkInfo : AppColors.lightInfo,
          isDark ? Colors.black : Colors.white,
        );
      case _Variant.error:
        return (scheme.error, scheme.onError);
      case _Variant.neutral:
        return (scheme.surfaceContainerHighest, scheme.onSurface);
    }
  }

  static IconData _iconOf(_Variant v) => switch (v) {
    _Variant.success => Icons.check_circle_outline_rounded,
    _Variant.error => Icons.error_outline_rounded,
    _Variant.warning => Icons.warning_amber_rounded,
    _Variant.info => Icons.info_outline_rounded,
    _Variant.neutral => Icons.check_rounded,
  };
}

enum _Variant { success, error, warning, info, neutral }
