// Import library GetX dan Flutter
import 'package:get/get.dart';
import 'package:src/controllers/user_profile_controller.dart';
import 'package:flutter/material.dart';

// Kelas untuk tampilan halaman profil pengguna
class ProfileScreen extends StatelessWidget {
  // Mendeklarasikan controller untuk manajemen state profil
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Widget Obx digunakan untuk mendengarkan perubahan pada controller.user
      body: Obx(() {
        if (controller.user.value.id.isEmpty) {
          // Menampilkan pesan Loading jika id pada UserModel kosong
          return const Center(
            child: Text('Loading...'),
          );
        } else {
          // Menampilkan data profil jika sudah dimuat
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Menampilkan avatar pengguna
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(controller.user.value.avatar),
                  ),
                  const SizedBox(height: 20),
                  // Menampilkan nama pengguna
                  Text(
                    controller.user.value.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  // Menampilkan email pengguna
                  Text(
                    controller.user.value.email,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
