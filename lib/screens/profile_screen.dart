import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:src/models/color_scheme.dart';
import 'package:src/controllers/user_controller.dart'; // Menggunakan UserController

class ProfileScreen extends StatelessWidget {
  final UserController userController =
      Get.find(); // Menggunakan UserController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          if (userController.isLoggedIn.value &&
              userController.username.value.isNotEmpty &&
              userController.fullName.value.isNotEmpty) {
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        color: AppTheme.tertiaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            // Ganti dengan URL atau path ke avatar pengguna

                            backgroundImage: AssetImage('data/alfadli.jpeg'),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            userController.fullName.value,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            userController.username.value,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: const Text('Riwayat Bacaan'),
                      onTap: () {
                        // Handle Riwayat Bacaan click action
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.save_rounded),
                      title: const Text('Tersimpan'),
                      onTap: () {
                        // Handle Riwayat Bacaan click action
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.event),
                      title: const Text('Acara'),
                      onTap: () {
                        // Handle Acara click action
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.help_center),
                      title: const Text('Pusat Bantuan'),
                      onTap: () {
                        // Handle Pusat Bantuan click action
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Pengaturan'),
                      onTap: () {
                        // Handle Pengaturan click action
                      },
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text('Logout'),
                      onTap: () {
                        // Show a confirmation dialog before logging out
                        userController.logout();
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Loading...'),
            );
          }
        }),
      ),
    );
  }
}
