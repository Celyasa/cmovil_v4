import 'package:cmovil_v4/app/presentation/global/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final ThemeData light = _buildTheme(Brightness.light);
  static final ThemeData dark = _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final Color background = isDark
        ? AppColors.darkBackground
        : AppColors.lightBackground;
    final Color surface = isDark
        ? AppColors.darkSurface
        : AppColors.lightSurface;
    final Color borderColor = isDark
        ? AppColors.darkBorder
        : AppColors.lightBorder;
    final Color textColor = isDark ? AppColors.darkText : AppColors.lightText;
    final Color mutedColor = isDark
        ? AppColors.darkMuted
        : AppColors.lightMuted;

    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.brandRed,
      brightness: brightness,
      primary: AppColors.brandRed,
      onPrimary: Colors.white,
      secondary: AppColors.brandPink,
      onSecondary: Colors.black,
      surface: surface,
      onSurface: textColor,
      error: const Color(0xFFDC3545),
      onError: Colors.white,
      surfaceContainerHighest: isDark
          ? const Color(0xFF2C313D)
          : const Color(0xFFF0F1F4),
    );

    final BorderRadius inputRadius = BorderRadius.circular(12);
    final OutlineInputBorder inputBorder = OutlineInputBorder(
      borderRadius: inputRadius,
      borderSide: BorderSide(color: borderColor),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      canvasColor: surface,
      dividerColor: borderColor,
      textTheme: ThemeData(brightness: brightness).textTheme
          .apply(bodyColor: textColor, displayColor: textColor),
      iconTheme: IconThemeData(color: textColor),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textColor,
        elevation: 0,
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: TextStyle(color: mutedColor),
        labelStyle: TextStyle(color: mutedColor),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: OutlineInputBorder(
          borderRadius: inputRadius,
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: inputRadius,
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: inputRadius,
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 17,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.primary.withValues(alpha: 0.4),
          disabledForegroundColor: Colors.white70,
          minimumSize: const Size(double.infinity, 54),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
      ),
    );
  }
}
