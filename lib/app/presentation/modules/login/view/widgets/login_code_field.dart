import 'package:cmovil_v4/app/presentation/global/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoginCodeField extends StatelessWidget {
  const LoginCodeField({
    required this.onChanged,
    required this.onSubmitted,
    this.errorText,
    this.enabled = true,
    super.key,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final String? errorText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return TextField(
      enabled: enabled,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      style: theme.textTheme.titleLarge,
      decoration: InputDecoration(
        hintText: 'Ej. 1024',
        prefixIcon: Icon(Icons.work_outline_rounded, color: colors.primary),
        errorText: errorText,
        // Variante subrayada — usa el helper del tema para no repetir
        // BorderSide en 6 slots.
        border: AppTheme.underlineBorder(colors.outline),
        enabledBorder: AppTheme.underlineBorder(colors.outline),
        focusedBorder: AppTheme.underlineBorder(colors.primary, width: 1.5),
        disabledBorder: AppTheme.underlineBorder(colors.outline),
        errorBorder: AppTheme.underlineBorder(colors.error),
        focusedErrorBorder: AppTheme.underlineBorder(colors.error, width: 1.5),
      ),
    );
  }
}
