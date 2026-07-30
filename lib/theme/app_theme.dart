import 'package:flutter/material.dart';

class AppTheme {
  static const Color nearBlack = Color(0xFF020202);
  static const Color darkBrown = Color(0xFF493D3F);
  static const Color beige = Color(0xFFBDB495);
  static const Color cream = Color(0xFFF8F2CE);
  static const Color olive = Color(0xFFD8D989);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData get light => ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: white,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: nearBlack,
            letterSpacing: -1.5,
            height: 1.1,
          ),
          displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w300,
            color: nearBlack,
            letterSpacing: -0.5,
            height: 1.2,
          ),
          headlineMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: nearBlack,
            letterSpacing: -0.3,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: nearBlack,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: nearBlack,
            height: 1.6,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: darkBrown,
            height: 1.5,
          ),
          labelLarge: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: darkBrown,
            letterSpacing: 1.2,
          ),
        ),
      );
}
