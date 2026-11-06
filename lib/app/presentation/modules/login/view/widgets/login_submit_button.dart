import 'package:flutter/material.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({
    required this.enabled,
    required this.loading,
    required this.onPressed,
    super.key,
  });

  final bool enabled;
  final bool loading;
  final VoidCallback onPressed;

  static const double _side = 66;
  static const double _box = 96;
  static const double _angle = 0.7853981633974483; // π/4

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;
    final bool canPress = enabled && !loading;

    final Color fill = (canPress || loading)
        ? colors.primary
        : colors.primary.withValues(alpha: 0.45);
    final Color onFill = colors.onPrimary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'CONTINUAR A CMOVIL',
          style: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: 0.4,
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(width: 6),
        Semantics(
          button: true,
          enabled: canPress,
          label: 'Continuar a CMovil',
          child: SizedBox(
            width: _box,
            height: _box,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Transform.rotate(
                  angle: _angle,
                  child: Material(
                    color: fill,
                    borderRadius: BorderRadius.circular(22),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(22),
                      onTap: canPress ? onPressed : null,
                      child: const SizedBox(width: _side, height: _side),
                    ),
                  ),
                ),
                IgnorePointer(
                  child: loading
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: onFill,
                          ),
                        )
                      : Icon(
                          Icons.arrow_forward_rounded,
                          color: onFill,
                          size: 28,
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
