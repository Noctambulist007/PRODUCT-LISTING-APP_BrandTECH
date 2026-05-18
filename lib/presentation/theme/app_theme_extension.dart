import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.background,
    required this.surface,
    required this.surfaceWarm,
    required this.surfaceDeep,
    required this.border,
    required this.borderLight,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.accent,
    required this.accentSurface,
    required this.accentLight,
    required this.accentDark,
    required this.star,
    required this.starEmpty,
    required this.errorColor,
    required this.errorSurface,
  });

  final Color background;
  final Color surface;
  final Color surfaceWarm;
  final Color surfaceDeep;
  final Color border;
  final Color borderLight;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color accent;
  final Color accentSurface;
  final Color accentLight;
  final Color accentDark;
  final Color star;
  final Color starEmpty;
  final Color errorColor;
  final Color errorSurface;

  @override
  AppThemeExtension copyWith({
    Color? background,
    Color? surface,
    Color? surfaceWarm,
    Color? surfaceDeep,
    Color? border,
    Color? borderLight,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? accent,
    Color? accentSurface,
    Color? accentLight,
    Color? accentDark,
    Color? star,
    Color? starEmpty,
    Color? errorColor,
    Color? errorSurface,
  }) => AppThemeExtension(
    background: background ?? this.background,
    surface: surface ?? this.surface,
    surfaceWarm: surfaceWarm ?? this.surfaceWarm,
    surfaceDeep: surfaceDeep ?? this.surfaceDeep,
    border: border ?? this.border,
    borderLight: borderLight ?? this.borderLight,
    textPrimary: textPrimary ?? this.textPrimary,
    textSecondary: textSecondary ?? this.textSecondary,
    textTertiary: textTertiary ?? this.textTertiary,
    accent: accent ?? this.accent,
    accentSurface: accentSurface ?? this.accentSurface,
    accentLight: accentLight ?? this.accentLight,
    accentDark: accentDark ?? this.accentDark,
    star: star ?? this.star,
    starEmpty: starEmpty ?? this.starEmpty,
    errorColor: errorColor ?? this.errorColor,
    errorSurface: errorSurface ?? this.errorSurface,
  );

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other == null) return this;
    return AppThemeExtension(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceWarm: Color.lerp(surfaceWarm, other.surfaceWarm, t)!,
      surfaceDeep: Color.lerp(surfaceDeep, other.surfaceDeep, t)!,
      border: Color.lerp(border, other.border, t)!,
      borderLight: Color.lerp(borderLight, other.borderLight, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentSurface: Color.lerp(accentSurface, other.accentSurface, t)!,
      accentLight: Color.lerp(accentLight, other.accentLight, t)!,
      accentDark: Color.lerp(accentDark, other.accentDark, t)!,
      star: Color.lerp(star, other.star, t)!,
      starEmpty: Color.lerp(starEmpty, other.starEmpty, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      errorSurface: Color.lerp(errorSurface, other.errorSurface, t)!,
    );
  }
}

extension AppThemeX on BuildContext {
  AppThemeExtension get appTheme =>
      Theme.of(this).extension<AppThemeExtension>()!;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
