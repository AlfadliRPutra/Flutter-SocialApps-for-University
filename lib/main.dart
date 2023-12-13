// Import library untuk pengembangan UI dengan Flutter
import 'package:flutter/material.dart';

// Import rute aplikasi dan skema warna kustom
import 'package:src/models/app_routes.dart';
import 'package:src/models/color_scheme.dart';

// Import GetX untuk manajemen state dan navigasi
import 'package:get/get.dart';

// Fungsi utama untuk menjalankan aplikasi
void main() => runApp(const Unjatoday());

// Kelas utama aplikasi yang merupakan StatelessWidget
class Unjatoday extends StatelessWidget {
  const Unjatoday({super.key});

  // Metode build untuk membuat tampilan aplikasi
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Berita', // Judul aplikasi
      theme: AppTheme.getTheme(), // Tema aplikasi dari kelas AppTheme
      initialRoute: '/landing', // Rute awal aplikasi
      getPages: appPages, // Daftar rute yang akan digunakan
    );
  }
}
