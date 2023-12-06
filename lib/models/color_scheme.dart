// app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(255, 123, 0, 1);
  static const Color secondaryColor = Color.fromARGB(255, 255, 187, 2);
  static const Color tertiaryColor = Color.fromARGB(255, 238, 234, 232);

  static ThemeData getTheme() {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.highContrastLight(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
      ),
    );
  }
}
