// Import library Flutter
import 'package:flutter/material.dart';

// Kelas untuk konfigurasi skema warna aplikasi
class AppTheme {
  // Warna primer, sekunder, dan tersier
  static const Color primaryColor = Color.fromRGBO(255, 123, 0, 1);
  static const Color secondaryColor = Color.fromARGB(255, 255, 187, 2);
  static const Color tertiaryColor = Color.fromARGB(255, 238, 234, 232);

  // Mendapatkan tema aplikasi
  static ThemeData getTheme() {
    return ThemeData.light().copyWith(
      // Mengkonfigurasi skema warna
      colorScheme: const ColorScheme.highContrastLight(
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
      ),
      // Mengkonfigurasi tema app bar
      appBarTheme: const AppBarTheme(
        backgroundColor: tertiaryColor,
      ),
    );
  }
}
