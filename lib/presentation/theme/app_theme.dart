import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productify/presentation/theme/app_theme_extension.dart';
import 'package:productify/presentation/theme/color.dart';
import 'package:productify/presentation/theme/text_theme.dart';

class AppTheme {
  static ThemeData get light => _build(Brightness.light);

  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    final bg = isDark ? AppColors.darkBackground : AppColors.background;
    final surface = isDark ? AppColors.darkSurface : AppColors.surface;
    final surfaceWarm = isDark
        ? AppColors.darkSurfaceWarm
        : AppColors.surfaceWarm;
    final surfaceDeep = isDark
        ? AppColors.darkSurfaceDeep
        : AppColors.surfaceDeep;
    final border = isDark
        ? AppColors.darkBorderDefault
        : AppColors.borderDefault;
    final borderLight = isDark
        ? AppColors.darkBorderLight
        : AppColors.borderLight;
    final textPri = isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
    final textSec = isDark
        ? AppColors.darkTextSecondary
        : AppColors.textSecondary;
    final textTer = isDark
        ? AppColors.darkTextTertiary
        : AppColors.textTertiary;
    final accent = isDark
        ? AppColors.darkAccentDefault
        : AppColors.accentDefault;
    final accentSurf = isDark
        ? AppColors.darkAccentSurface
        : AppColors.accentSurface;
    final errColor = isDark ? AppColors.darkError : AppColors.error;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: 'Montserrat',
      textTheme: textTheme.apply(bodyColor: textPri, displayColor: textPri),
      scaffoldBackgroundColor: bg,

      colorScheme: ColorScheme(
        brightness: brightness,
        primary: AppColors.primaryDefault,
        onPrimary: AppColors.textInverse,
        secondary: accent,
        onSecondary: isDark ? AppColors.darkTextInverse : AppColors.textInverse,
        surface: surface,
        onSurface: textPri,
        error: errColor,
        onError: AppColors.textInverse,
        surfaceContainerHighest: surfaceDeep,
        outline: border,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: bg,
        foregroundColor: textPri,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
          statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        ),
      ),

      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: border),
        ),
      ),

      dividerTheme: DividerThemeData(color: border, thickness: 1),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: accent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: errColor),
        ),
        hintStyle: TextStyle(color: textTer, fontSize: 14),
        labelStyle: TextStyle(color: textSec),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDefault,
          foregroundColor: AppColors.textInverse,
          elevation: 0,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            fontSize: 15,
            letterSpacing: 0.5,
          ),
        ),
      ),

      iconTheme: IconThemeData(color: textSec, size: 22),

      chipTheme: ChipThemeData(
        backgroundColor: surfaceDeep,
        selectedColor: AppColors.primaryDefault,
        labelStyle: TextStyle(
          color: textSec,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        side: BorderSide(color: border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDark
            ? AppColors.darkSurfaceElevated
            : AppColors.surface,
        selectedItemColor: accent,
        unselectedItemColor: textTer,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),

      extensions: [
        AppThemeExtension(
          background: bg,
          surface: surface,
          surfaceWarm: surfaceWarm,
          surfaceDeep: surfaceDeep,
          border: border,
          borderLight: borderLight,
          textPrimary: textPri,
          textSecondary: textSec,
          textTertiary: textTer,
          accent: accent,
          accentSurface: accentSurf,
          accentLight: isDark
              ? AppColors.darkAccentLight
              : AppColors.accentLight,
          accentDark: isDark ? AppColors.darkAccentDark : AppColors.accentDark,
          star: isDark ? AppColors.darkStar : AppColors.star,
          starEmpty: isDark ? AppColors.darkStarEmpty : AppColors.starEmpty,
          errorColor: errColor,
          errorSurface: isDark
              ? AppColors.darkErrorSurface
              : AppColors.errorSurface,
        ),
      ],
    );
  }
}
