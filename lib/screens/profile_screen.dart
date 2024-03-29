import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:src/models/color_scheme.dart';
import 'package:src/controllers/user_controller.dart'; // Menggunakan UserController

class ProfileScreen extends StatelessWidget {
  // Inside any other screen where you need user data
  var userController = Get.find<UserController>();

// Access user data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          if (userController.isLoggedIn.value &&
              userController.username.value.isNotEmpty &&
              userController.fullName.value.isNotEmpty) {
            print('Username: ${userController.username.value}');
            print('Username: ${userController.isLoggedIn.value}');
            print('Full Name: ${userController.fullName.value}');
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
                            // userController.fullName.value,
                            'Alfadli Rahmat Putra',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            // userController.username.value,
                            'Alfadli17',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 120,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.people, color: Colors.white),
                              const SizedBox(height: 5),
                              Text(
                                'Daftar Teman',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.book, color: Colors.white),
                              const SizedBox(height: 5),
                              Text(
                                'Jumlah Bacaan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '123',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                        _showLogoutConfirmationDialog();
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

  void _showLogoutConfirmationDialog() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Apakah anda yakin?',
      textCancel: 'Batal',
      onCancel: () {},
      textConfirm: 'Lanjutkan',
      onConfirm: () {
        // Perform logout action
        Get.offAllNamed('/landing');
      },
    );
  }
}
