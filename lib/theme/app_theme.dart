import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF0D47A1);
  static const Color secondary = Color(0xFF00897B);
  static const Color accent = Color(0xFF00BCD4);
  static const Color surface = Color(0xFFF5F7FA);
  static const Color dark = Color(0xFF1A1A2E);

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          secondary: secondary,
          surface: surface,
        ),
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w700,
            color: dark,
            height: 1.2,
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: dark,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: dark,
          ),
          bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF444444)),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF666666)),
        ),
      );
}
