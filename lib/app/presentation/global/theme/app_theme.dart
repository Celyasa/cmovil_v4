import 'package:cmovil_v4/app/presentation/global/theme/app_colors.dart';
import 'package:cmovil_v4/app/presentation/global/theme/app_text_styles.dart';
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

    final Color accentColor = isDark ? AppColors.brandPink : AppColors.brandRed;

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

    final TextTheme textTheme = ThemeData(brightness: brightness).textTheme
        .copyWith(
          headlineLarge: AppTextStyles.headlineLarge,
          headlineMedium: AppTextStyles.headlineMedium,
          headlineSmall: AppTextStyles.headlineSmall,
          titleLarge: AppTextStyles.titleLarge,
          titleMedium: AppTextStyles.titleMedium,
          titleSmall: AppTextStyles.titleSmall,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
          labelLarge: AppTextStyles.labelLarge,
          labelMedium: AppTextStyles.labelMedium,
          labelSmall: AppTextStyles.labelSmall,
        )
        .apply(bodyColor: textColor, displayColor: textColor);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      canvasColor: surface,
      dividerColor: borderColor,

      // Tipografía global.
      textTheme: textTheme,

      // Iconos.
      iconTheme: IconThemeData(color: textColor),

      // Barra superior.
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textColor,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.titleLarge.copyWith(color: textColor),
      ),

      // Campos de texto.
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: AppTextStyles.bodyMedium.copyWith(color: mutedColor),
        labelStyle: AppTextStyles.bodyMedium.copyWith(color: mutedColor),
        errorStyle: AppTextStyles.bodySmall.copyWith(color: colorScheme.error),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: OutlineInputBorder(
          borderRadius: inputRadius,
          borderSide: BorderSide(color: accentColor, width: 1.5),
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

      // Botones principales.
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
          textStyle: AppTextStyles.labelLarge.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // Botones de texto.
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: accentColor,
          textStyle: AppTextStyles.labelLarge,
        ),
      ),

      // Botones con borde.
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: accentColor,
          side: BorderSide(color: borderColor),
          minimumSize: const Size(double.infinity, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: AppTextStyles.labelLarge,
        ),
      ),

      // Indicadores de carga.
      progressIndicatorTheme: ProgressIndicatorThemeData(color: accentColor),

      // Navegación inferior.
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        elevation: 0,
        height: 64,
        indicatorColor: accentColor.withValues(alpha: isDark ? 0.22 : 0.12),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          final bool selected = states.contains(WidgetState.selected);

          return IconThemeData(color: selected ? accentColor : mutedColor);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          final bool selected = states.contains(WidgetState.selected);

          return AppTextStyles.labelMedium.copyWith(
            color: selected ? accentColor : mutedColor,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          );
        }),
      ),
    );
  }
}
