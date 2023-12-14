import 'package:get/get.dart';
import 'package:src/controllers/user_profile_controller.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          if (controller.user.value.id.isEmpty) {
            return const Center(
              child: Text('Loading...'),
            );
          } else {
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('data/alfadli.jpeg'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Alfadi Rahmat Putra',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'alfadli@unja.ac.id',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Jumlah Dibaca',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '100',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Handle Daftar Teman click action
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Daftar Teman',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '50',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Riwayat Bacaan'),
                      onTap: () {
                        // Handle Riwayat Bacaan click action
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.save_rounded),
                      title: Text('Tersimpan'),
                      onTap: () {
                        // Handle Riwayat Bacaan click action
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.event),
                      title: Text('Acara'),
                      onTap: () {
                        // Handle Acara click action
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.help_center),
                      title: Text('Pusat Bantuan'),
                      onTap: () {
                        // Handle Pusat Bantuan click action
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Pengaturan'),
                      onTap: () {
                        // Handle Pengaturan click action
                      },
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Logout'),
                      onTap: () {
                        // Handle Logout click action
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
