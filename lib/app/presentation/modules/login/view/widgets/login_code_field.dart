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
    final ColorScheme colors = Theme.of(context).colorScheme;

    return TextField(
      enabled: enabled,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      style: Theme.of(context).textTheme.titleLarge,
      decoration: InputDecoration(
        hintText: 'Ej. 1024',
        prefixIcon: Icon(Icons.work_outline_rounded, color: colors.primary),
        errorText: errorText,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.outline),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.outline),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.primary, width: 1.5),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.outline),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.error, width: 1.5),
        ),
      ),
    );
  }
}
