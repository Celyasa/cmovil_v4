import 'dart:math' as math;

import 'package:cmovil_v4/app/presentation/global/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final Color soft = theme.colorScheme.onSurface.withValues(
      alpha: isDark ? 0.06 : 0.04,
    );
    final Color accent = isDark
        ? AppColors.brandCoral
        : theme.colorScheme.primary;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double w = constraints.maxWidth;
        final double h = constraints.maxHeight;

        return Stack(
          children: <Widget>[
            _RoundedShape(
              center: Offset(w, h * 0.43),
              side: w * 0.22,
              lengthFactor: 5,
              angle: math.pi / 4,
              color: soft,
            ),

            _RoundedShape(
              center: Offset(w * 0.17, h * 0.80),
              side: w * 0.22,
              lengthFactor: 1.5,
              angle: math.pi / 4,
              color: soft,
            ),
            _RoundedShape(
              center: Offset(w * 0.95, h * 0.84),
              side: w * 0.22,
              lengthFactor: 1.5,
              angle: math.pi / 4,
              color: soft,
            ),
            _RoundedShape(
              center: Offset(-w * 0.08, h * 0.975),
              side: w * 0.55,
              angle: math.pi / 4,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[accent, accent.withValues(alpha: 0.85)],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _RoundedShape extends StatelessWidget {
  const _RoundedShape({
    required this.center,
    required this.side,
    required this.angle,
    this.lengthFactor = 1.0,
    this.color,
    this.gradient,
  });

  final Offset center;
  final double side;
  final double angle;
  final double lengthFactor;
  final Color? color;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final double height = side * lengthFactor;
    return Positioned(
      left: center.dx - side / 2,
      top: center.dy - height / 2,
      width: side,
      height: height,
      child: Transform.rotate(
        angle: angle,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            gradient: gradient,
            borderRadius: BorderRadius.circular(side * 0.22),
          ),
        ),
      ),
    );
  }
}
