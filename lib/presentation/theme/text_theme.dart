import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextTheme textTheme = TextTheme(
  // Body Text
  bodySmall: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    height: 16.h / 12.h,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    height: 20.h / 14.h,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    height: 24.h / 16.h,
  ),

  // Title Text
  titleLarge: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    height: 28.h / 22.h,
  ),
  titleMedium: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    height: 24.h / 16.h,
  ),
  titleSmall: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 20.h / 14.h,
  ),

  // Label Text
  labelSmall: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    height: 16.h / 12.h,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 20.h / 14.h,
  ),
  labelLarge: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    height: 24.h / 16.h,
  ),

  // Headline Text
  headlineLarge: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 32.sp,
    fontWeight: FontWeight.normal,
    height: 40.h / 32.h,
  ),
  headlineMedium: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 28.sp,
    fontWeight: FontWeight.normal,
    height: 36.h / 28.h,
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24.sp,
    fontWeight: FontWeight.normal,
    height: 32.h / 24.h,
  ),

  // Display Text
  displayLarge: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 57.sp,
    fontWeight: FontWeight.normal,
    height: 64.h / 57.h,
  ),
  displayMedium: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 45.sp,
    fontWeight: FontWeight.normal,
    height: 52.h / 45.h,
  ),
  displaySmall: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 36.sp,
    fontWeight: FontWeight.normal,
    height: 44.h / 36.h,
  ),
);

class AppTextTheme {
  static TextStyle bodyMedium = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.sp,
    height: 16.h / 14.h,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.normal,
  );
}
