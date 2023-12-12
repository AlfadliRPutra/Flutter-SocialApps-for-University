// Import library Flutter dan GetX
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import controller dan skema warna kustom
import 'package:src/controllers/home_controller.dart';
import 'package:src/models/color_scheme.dart';

// Import widget bottom navigation bar dari ConvexAppBar
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

// Kelas untuk tampilan halaman utama (home)
class HomeScreen extends StatelessWidget {
  // Mendeklarasikan controller untuk manajemen state halaman utama
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengatur bentuk batas bawah app bar dengan sudut melengkung
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        actions: [
          // Tombol notifikasi di sebelah kanan app bar
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.notifications,
              color: const Color.fromARGB(255, 66, 66, 66),
            ),
            onPressed: () {
              // Tangani ketika tombol notifikasi ditekan
              // Anda dapat melakukan navigasi ke halaman notifikasi atau menampilkan panel notifikasi
            },
          ),
        ],
        // Warna latar belakang dan judul app bar
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          'UNJAtoday',
          style: TextStyle(
            color: const Color.fromARGB(255, 66, 66, 66),
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        // Tombol menu di sebelah kiri app bar
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: const Color.fromARGB(255, 66, 66, 66),
            semanticLabel: 'menu',
          ),
          onPressed: () {},
        ),
      ),
      // Tampilan utama berdasarkan halaman yang dipilih di controller
      body: Obx(() => controller.pages[controller.currentIndex.value]),
      // Bottom navigation bar menggunakan ConvexAppBar
      bottomNavigationBar: ConvexAppBar(
        height: 50,
        // Item tab berisi ikon dan judul
        items: [
          TabItem(icon: Icons.home, title: 'Beranda'),
          TabItem(icon: Icons.search, title: 'Cari'),
          TabItem(icon: Icons.chat, title: 'Chat'),
          TabItem(icon: Icons.person, title: 'Profil'),
        ],
        // Fungsi yang dipanggil saat tab ditekan
        onTap: controller.onTabTapped,
        // Indeks tab awal
        initialActiveIndex: controller.currentIndex.value,
        // Warna latar belakang dan warna aktif tab
        backgroundColor: AppTheme.primaryColor,
        activeColor: AppTheme.tertiaryColor,
      ),
    );
  }
}
