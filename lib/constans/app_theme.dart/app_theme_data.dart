import 'package:flutter/material.dart';
import 'package:kyrgyz_tour/constans/app_theme.dart/app_colors.dart';

class AppThemeData {
  static ThemeData appThemeData = ThemeData(
    colorScheme: const ColorScheme(
      background: AppColors.background,
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
      onBackground: AppColors.secondary,
      surface: AppColors.white,
      onSurface: AppColors.secondary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.primary,
      elevation: 0,
    ),
  );
}
