
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextTheme getTextTheme({required bool isDark}) {
    final textColor = isDark
        ? AppColors.darkText
        : AppColors.lightText;

    return TextTheme(
      // Large headings
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),

      headlineLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),

      headlineMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),

      // Titles
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),

      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),

      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),

      // Body
      bodyLarge: TextStyle(
        fontSize: 16,
        color: textColor,
      ),

      bodyMedium: TextStyle(
        fontSize: 14,
        color: textColor,
      ),

      bodySmall: TextStyle(
        fontSize: 12,
        color: textColor,
      ),

      // Labels
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),

      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    );
  }
}
