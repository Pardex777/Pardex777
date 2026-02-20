import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color gold = Color(0xFFFFC400);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF121212);

  static ThemeData light() {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: white,
      colorScheme: base.colorScheme.copyWith(
        primary: gold,
        secondary: gold,
        surface: white,
      ),
      textTheme: base.textTheme.apply(
        bodyColor: textDark,
        displayColor: textDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: Color(0xFFEAEAEA)),
        ),
      ),
    );
  }
}
