import 'package:cmovil_v4/app/presentation/global/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

abstract final class AppProgressDialog {
  static Future<void> show(
    BuildContext context, {
    required Listenable listenable,
    required double? Function() progress,
    required String Function() message,
    String title = 'Procesando',
    bool barrierDismissible = false,
    bool useRootNavigator = true,
    VoidCallback? onCancel,
  }) {
    return showDialog<void>(
      context: context,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      builder: (_) => PopScope(
        canPop: false,
        child: _ProgressDialogContent(
          title: title,
          listenable: listenable,
          progress: progress,
          message: message,
          onCancel: onCancel,
        ),
      ),
    );
  }
}

class _ProgressDialogContent extends StatelessWidget {
  const _ProgressDialogContent({
    required this.title,
    required this.listenable,
    required this.progress,
    required this.message,
    this.onCancel,
  });

  final String title;
  final Listenable listenable;
  final double? Function() progress;
  final String Function() message;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return AlertDialog(
      backgroundColor: scheme.surface,
      surfaceTintColor: Colors.transparent,
      shape: theme.dialogTheme.shape,
      title: Text(
        title,
        style: AppTextStyles.titleLarge.copyWith(
          color: scheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: ListenableBuilder(
          listenable: listenable,
          builder: (context, _) {
            final value = progress();

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (value != null)
                  Text(
                    '${(value.clamp(0.0, 1.0) * 100).toStringAsFixed(0)}%',
                    textAlign: TextAlign.end,
                    style: AppTextStyles.titleMedium.copyWith(
                      color: scheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: value?.clamp(0.0, 1.0),
                    minHeight: 9,
                    backgroundColor: scheme.surfaceContainerHighest,
                    color: scheme.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  message(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      actions: onCancel != null
          ? [TextButton(onPressed: onCancel, child: const Text('Cancelar'))]
          : null,
    );
  }
}
