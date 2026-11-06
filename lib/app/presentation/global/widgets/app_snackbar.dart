import 'package:cmovil_v4/app/presentation/global/theme/app_colors.dart';
import 'package:cmovil_v4/app/presentation/global/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

abstract final class AppSnackBar {
  static const Duration _defaultDuration = Duration(seconds: 4);

  // ── API pública ──────────────────────────────────────────

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

  // ── Construcción ─────────────────────────────────────────

  static void _show(
    BuildContext context, {
    required _Variant variant,
    required String message,
    required Duration duration,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final messenger = ScaffoldMessenger.of(context);

    final (Color background, Color foreground) = _resolve(
      variant,
      theme.colorScheme,
      isDark,
    );

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(_iconOf(variant), color: foreground, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: foreground,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: background,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          elevation: 2,
          showCloseIcon: true,
          closeIconColor: foreground.withValues(alpha: 0.75),
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: foreground.withValues(alpha: 0.12)),
          ),
          action: actionLabel != null && onAction != null
              ? SnackBarAction(
                  label: actionLabel,
                  onPressed: onAction,
                  textColor: foreground,
                )
              : null,
        ),
      );
  }

  // ── Colores según AppTheme ───────────────────────────────

  static (Color, Color) _resolve(
    _Variant variant,
    ColorScheme scheme,
    bool isDark,
  ) {
    switch (variant) {
      case _Variant.success:
        return (
          isDark ? AppColors.darkSuccess : AppColors.lightSuccess,
          Colors.white,
        );

      case _Variant.error:
        return (scheme.error, scheme.onError);

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

      case _Variant.neutral:
        return (
          isDark ? AppColors.darkSnackNeutral : AppColors.lightSnackNeutral,
          scheme.onSurface,
        );
    }
  }

  // ── Iconografía ──────────────────────────────────────────

  static IconData _iconOf(_Variant variant) => switch (variant) {
    _Variant.success => Icons.check_circle_outline_rounded,
    _Variant.error => Icons.error_outline_rounded,
    _Variant.warning => Icons.warning_amber_rounded,
    _Variant.info => Icons.info_outline_rounded,
    _Variant.neutral => Icons.check_rounded,
  };
}

enum _Variant { success, error, warning, info, neutral }
