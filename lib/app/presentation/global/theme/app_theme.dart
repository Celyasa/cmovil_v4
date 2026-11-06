import 'package:cmovil_v4/app/presentation/global/theme/app_colors.dart';
import 'package:cmovil_v4/app/presentation/global/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final ThemeData light = _buildTheme(Brightness.light);
  static final ThemeData dark = _buildTheme(Brightness.dark);
  static UnderlineInputBorder underlineBorder(
    Color color, {
    double width = 1,
  }) => UnderlineInputBorder(
    borderSide: BorderSide(color: color, width: width),
  );
  static ThemeData _buildTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    // ── Paleta base ────────────────────────────────────────────
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

    // ── Accent = primary (varía por modo) ──────────────────────
    final Color primary = isDark ? AppColors.brandPink : AppColors.brandRed;
    final Color onPrimary = isDark ? Colors.black : Colors.white;
    final Color secondary = isDark ? AppColors.brandRed : AppColors.brandPink;
    final Color onSecondary = isDark ? Colors.white : Colors.black;

    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.brandRed,
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      surface: surface,
      onSurface: textColor,
      onSurfaceVariant: mutedColor,
      outline: borderColor,
      outlineVariant: borderColor,
      error: const Color(0xFFDC3545),
      onError: Colors.white,
      surfaceContainerHighest: isDark
          ? const Color(0xFF2C313D)
          : const Color(0xFFF0F1F4),
    );

    // ── Inputs ─────────────────────────────────────────────────
    final BorderRadius inputRadius = BorderRadius.circular(12);
    final OutlineInputBorder inputBorder = OutlineInputBorder(
      borderRadius: inputRadius,
      borderSide: BorderSide(color: borderColor),
    );

    final TextTheme textTheme = ThemeData(brightness: brightness).textTheme
        .copyWith(
          // displayLarge: AppTextStyles.displayLarge,
          // displayMedium: AppTextStyles.displayMedium,
          // displaySmall: AppTextStyles.displaySmall,
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
    // ── Dialog ─────────────────────────────────────────────────
    final DialogThemeData dialogTheme = DialogThemeData(
      backgroundColor: surface,
      surfaceTintColor: Colors.transparent,
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: isDark ? 0.35 : 0.15),
      iconColor: primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: borderColor),
      ),
      titleTextStyle: AppTextStyles.titleLarge.copyWith(
        color: textColor,
        fontWeight: FontWeight.w700,
      ),
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: mutedColor,
        height: 1.45,
      ),
      actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      clipBehavior: Clip.antiAlias,
      constraints: const BoxConstraints(minWidth: 280, maxWidth: 440),
    );

    // ── ThemeData ──────────────────────────────────────────────
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      canvasColor: surface,
      dividerColor: borderColor,

      // Tipografía global.
      textTheme: textTheme,
      dialogTheme: dialogTheme,

      // Iconos.
      iconTheme: IconThemeData(color: textColor),

      // AppBar.
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textColor,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.titleLarge.copyWith(color: textColor),
      ),

      // Inputs.
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
          borderSide: BorderSide(color: primary, width: 1.5),
        ),
        disabledBorder: inputBorder,
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

      // ElevatedButton.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.primary.withValues(alpha: 0.4),
          disabledForegroundColor: colorScheme.onPrimary.withValues(alpha: 0.7),
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

      // TextButton.
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: AppTextStyles.labelLarge,
        ),
      ),

      // OutlinedButton.
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: borderColor),
          minimumSize: const Size(double.infinity, 54),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: AppTextStyles.labelLarge,
        ),
      ),

      // Progress.
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
      ),

      // NavigationBar.
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        elevation: 0,
        height: 64,
        indicatorColor: colorScheme.primary.withValues(
          alpha: isDark ? 0.22 : 0.12,
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
          final bool selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? colorScheme.primary : mutedColor,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          final bool selected = states.contains(WidgetState.selected);
          return AppTextStyles.labelMedium.copyWith(
            color: selected ? colorScheme.primary : mutedColor,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          );
        }),
      ),

      // SnackBar (sin esto hereda `inverseSurface` de la seed).
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: surface, // fallback
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: borderColor),
        ),
        insetPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(color: textColor),
        actionTextColor: primary,
        dismissDirection: DismissDirection.horizontal,
        closeIconColor: mutedColor,
      ),
    );
  }
}
