import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFFe1a5),
      onPrimary: Color(0xFF12395F),
    ),
    scaffoldBackgroundColor: const ColorScheme.light().surface,
  );
}
