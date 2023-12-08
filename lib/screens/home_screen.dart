import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src/controllers/home_controller.dart';
import 'package:src/models/color_scheme.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.notifications,
              color: const Color.fromARGB(255, 66, 66, 66),
            ),
            onPressed: () {
              // Handle notification button press
              // You can navigate to the notification screen or show a notification panel
            },
          ),
        ],
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
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: const Color.fromARGB(255, 66, 66, 66),
            semanticLabel: 'menu',
          ),
          onPressed: () {},
        ),
      ),
      body: Obx(() => controller.pages[controller.currentIndex.value]),
      bottomNavigationBar: ConvexAppBar(
        height: 50,
        items: [
          TabItem(icon: Icons.home, title: 'Beranda'),
          TabItem(icon: Icons.search, title: 'Cari'),
          TabItem(icon: Icons.chat, title: 'Chat'),
          TabItem(icon: Icons.person, title: 'Profil'),
        ],
        onTap: controller.onTabTapped,
        initialActiveIndex: controller.currentIndex.value,
        backgroundColor: AppTheme.primaryColor,
        activeColor: AppTheme.tertiaryColor,
      ),
    );
  }
}
