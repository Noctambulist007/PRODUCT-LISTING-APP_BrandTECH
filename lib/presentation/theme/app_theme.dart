import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productify/presentation/theme/color.dart';
import 'package:productify/presentation/theme/text_theme.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Montserrat',
      textTheme: textTheme.apply(
        bodyColor: const Color(0xFF111827),
        displayColor: const Color(0xFF111827),
      ),

      scaffoldBackgroundColor: const Color(0xFFF8FAFC),

      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.colorPrimary,
        onPrimary: Colors.white,

        secondary: AppColors.colorSecondary,
        onSecondary: Colors.white,

        surface: Colors.white,
        onSurface: const Color(0xFF111827),

        surfaceContainerHighest: const Color(0xFFF1F5F9),
        outline: const Color(0xFFE2E8F0),

        error: Colors.red,
        onError: Colors.white,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF111827),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.colorPrimary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.colorPrimary,
        unselectedItemColor: Color(0xFF94A3B8),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),

      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 0,
        shadowColor: Colors.black.withOpacity(0.04),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: Color(0xFFE2E8F0),
        thickness: 1,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.colorPrimary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
        labelStyle: const TextStyle(color: Color(0xFF64748B)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.colorPrimary,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.colorPrimary,
        ),
      ),

      iconTheme: const IconThemeData(color: Color(0xFF475569)),

      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFFF1F5F9),
        selectedColor: AppColors.colorPrimary.withOpacity(0.12),
        disabledColor: const Color(0xFFE2E8F0),
        labelStyle: const TextStyle(
          color: Color(0xFF334155),
          fontWeight: FontWeight.w600,
        ),
        side: const BorderSide(color: Color(0xFFE2E8F0)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Montserrat',
      textTheme: textTheme.apply(
        bodyColor: const Color(0xFFF1F5F9),
        displayColor: const Color(0xFFF1F5F9),
      ),

      scaffoldBackgroundColor: const Color(0xFF0F172A),

      colorScheme: const ColorScheme.dark().copyWith(
        primary: AppColors.colorPrimary,
        onPrimary: Colors.white,

        secondary: AppColors.colorSecondary,
        onSecondary: Colors.white,

        surface: const Color(0xFF1E2937),
        onSurface: const Color(0xFFF1F5F9),

        surfaceContainerHighest: const Color(0xFF334155),
        outline: const Color(0xFF475569),

        error: Colors.red,
        onError: Colors.white,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1E2937),
        foregroundColor: const Color(0xFFF1F5F9),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.colorPrimary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF1E2937),
        selectedItemColor: AppColors.colorPrimary,
        unselectedItemColor: Color(0xFF94A3B8),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),

      cardTheme: CardThemeData(
        color: const Color(0xFF1E2937),
        elevation: 0,
        shadowColor: Colors.black.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFF334155)),
        ),
      ),

      dividerTheme: const DividerThemeData(
        color: Color(0xFF334155),
        thickness: 1,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1E2937),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF475569)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF475569)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.colorPrimary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        hintStyle: const TextStyle(color: Color(0xFF94A3B8)),
        labelStyle: const TextStyle(color: Color(0xFFCBD5E1)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.colorPrimary,
          foregroundColor: Colors.white,
          elevation: 0,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.colorPrimary,
        ),
      ),

      iconTheme: const IconThemeData(color: Color(0xFFCBD5E1)),

      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF334155),
        selectedColor: AppColors.colorPrimary.withOpacity(0.2),
        disabledColor: const Color(0xFF475569),
        labelStyle: const TextStyle(
          color: Color(0xFFF1F5F9),
          fontWeight: FontWeight.w600,
        ),
        side: const BorderSide(color: Color(0xFF475569)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}