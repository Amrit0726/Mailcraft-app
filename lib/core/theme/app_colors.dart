import 'package:flutter/material.dart';

/// App color palette for both light and dark modes - extracted from Figma
class AppColors {
  AppColors._(); // Private constructor

  // ========================================
  // LIGHT MODE COLORS
  // ========================================
  
  static const Color background = Color(0xFFF9FAFB);
  static const Color primary = Color(0xFF1E40AF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color blackOverlay = Color(0x14000000);
  static const Color darkGray = Color(0xFF0A0A0A);
  static const Color mediumGray = Color(0xFF717182);
  static const Color lightGray = Color(0xFFEFF6FF);
  static const Color backgroundAlt = Color(0xFFF9FAFB);
  static const Color lightBlue = Color(0xFFDBEAFE);

  // Text Colors (Light Mode)
  static const Color textPrimary = Color(0xFF0A0A0A);
  static const Color textSecondary = Color(0xFF717182);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ========================================
  // DARK MODE COLORS (from your Figma design)
  // ========================================
  
  // Backgrounds
  static const Color darkBackground = Color(0xFF0A1628); // Very dark navy from your design
  static const Color darkSurface = Color(0xFF1A2332); // Card/container background
  static const Color darkSurfaceLight = Color(0xFF243447); // Input fields, lighter surfaces
  
  // Text colors
  static const Color darkTextPrimary = Color(0xFFFFFFFF); // Pure white for main text
  static const Color darkTextSecondary = Color(0xFFA1A8B3); // Gray for secondary text
  
  // Borders and dividers
  static const Color darkBorder = Color(0xFF2D3748); // Subtle borders
  
  // Icon backgrounds in dark mode
  static const Color darkIconBg = Color(0xFF334155); // Icon container backgrounds

  // ========================================
  // SEMANTIC COLORS (same in both modes)
  // ========================================
  
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
}