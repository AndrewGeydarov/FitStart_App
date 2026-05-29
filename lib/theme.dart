import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF3D2C8D);
  static const Color primaryDark = Color(0xFF2D1F6B);
  static const Color primaryLight = Color(0xFF6B5DC8);

  static const Color accent = Color(0xFFF4845F);

  static const Color background = Color(0xFFF7F5FF);
  static const Color card = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFE9E7F3);

  static const Color textDark = Color(0xFF221E32);
  static const Color textGray = Color(0xFF9992B8);

  static const Color green = Color(0xFF3CC894);
  static const Color red = Color(0xFFE5484D);
  static const Color star = Color(0xFFF7C13B);
}

const LinearGradient kPurpleGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    AppColors.primaryDark,
    AppColors.primary,
    AppColors.primaryLight,
  ],
);

ThemeData buildAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    fontFamily: 'Roboto',
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.accent,
    ),
    useMaterial3: true,
  );
}
