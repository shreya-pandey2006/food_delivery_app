import 'package:flutter/material.dart';

class AppTheme {
  // Brand Colors
  static const Color primaryRed = Color(0xFFE53935);
  static const Color primaryDarkRed = Color(0xFFB71C1C);
  static const Color burntOrange = Color(0xFFE04328);
  static const Color accentGreen = Color(0xFF10B981);
  static const Color lightGreenBg = Color(0xFFECFDF5);
  static const Color greenBorder = Color(0xFFA7F3D0);
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color chipBg = Color(0xFFF3F4F6);
  static const Color iconBgLight = Color(0xFFFDE8E4);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      primaryColor: primaryRed,
      colorScheme: ColorScheme.light(
        primary: primaryRed,
        secondary: accentGreen,
        surface: surface,
        background: background,
      ),
      fontFamily: 'Roboto',
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
