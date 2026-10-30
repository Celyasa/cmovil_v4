import 'package:cmovil_v4/app/presentation/global/theme/app_colors.dart';
import 'package:cmovil_v4/app/presentation/global/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

abstract final class AppSnackBar {
  static const Duration _defaultDuration = Duration(seconds: 4);

  static Color _semanticColor(
    BuildContext context, {
    required Color light,
    required Color dark,
  }) {
    return Theme.of(context).brightness == Brightness.dark ? dark : light;
  }

  /// Notificación de operación exitosa.
  static void success(
    BuildContext context,
    String message, {
    Duration duration = _defaultDuration,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    _show(
      context,
      message: message,
      backgroundColor: _semanticColor(
        context,
        light: AppColors.lightSuccess,
        dark: AppColors.darkSuccess,
      ),
      icon: Icons.check_circle_outline_rounded,
      duration: duration,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  /// Notificación de error.
  static void error(
    BuildContext context,
    String message, {
    Duration duration = _defaultDuration,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    _show(
      context,
      message: message,
      backgroundColor: Theme.of(context).colorScheme.error,
      icon: Icons.error_outline_rounded,
      duration: duration,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  /// Notificación de advertencia.
  static void warning(
    BuildContext context,
    String message, {
    Duration duration = _defaultDuration,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    _show(
      context,
      message: message,
      backgroundColor: _semanticColor(
        context,
        light: AppColors.lightWarning,
        dark: AppColors.darkWarning,
      ),
      icon: Icons.warning_amber_rounded,
      duration: duration,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  /// Notificación informativa.
  static void info(
    BuildContext context,
    String message, {
    Duration duration = _defaultDuration,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    _show(
      context,
      message: message,
      backgroundColor: _semanticColor(
        context,
        light: AppColors.lightInfo,
        dark: AppColors.darkInfo,
      ),
      icon: Icons.info_outline_rounded,
      duration: duration,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
    required Duration duration,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          elevation: 4,
          showCloseIcon: true,
          closeIconColor: Colors.white70,
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          action: actionLabel != null && onAction != null
              ? SnackBarAction(
                  label: actionLabel,
                  onPressed: onAction,
                  textColor: Colors.white,
                )
              : null,
        ),
      );
  }
}
