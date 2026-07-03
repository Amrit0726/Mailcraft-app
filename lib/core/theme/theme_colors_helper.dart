import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Helper class to get colors based on current theme
class ThemeColors {
  static Color getBackground(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  static Color getSurface(BuildContext context) {
    return Theme.of(context).cardColor;
  }

  static Color getTextPrimary(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;
  }

  static Color getTextSecondary(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;
  }

  static Color getBorder(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? AppColors.darkBorder : AppColors.lightBlue;
  }

  static Color getCardBackground(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? AppColors.darkSurface : AppColors.white;
  }

  static Color getInputFill(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? AppColors.darkSurfaceLight : AppColors.white;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
