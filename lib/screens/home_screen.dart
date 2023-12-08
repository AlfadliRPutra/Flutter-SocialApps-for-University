import 'package:src/models/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:src/models/home_content.dart';
import '/screens/search_screen.dart';
import '/screens/profile_screen.dart';
import 'dart:core';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _children = [
    HomeContent(),
    const SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft:
                Radius.circular(20.0), // Atur border radius sesuai kebutuhan
            bottomRight: Radius.circular(20.0),
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
            color: const Color.fromARGB(
                255, 66, 66, 66), // Atur warna teks menjadi putih
            fontFamily: 'Open Sans', fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        // Tambahkan ikon menu di sebelah kanan app bar
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: const Color.fromARGB(255, 66, 66, 66),
            semanticLabel: 'menu',
          ),
          onPressed: () {
            // Toggle the drawer visibility
            if (_scaffoldKey.currentState?.isDrawerOpen == true) {
              _scaffoldKey.currentState?.openEndDrawer();
            } else {
              _scaffoldKey.currentState?.openDrawer();
            }
          },
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        height: 46,
        items: [
          TabItem(icon: Icons.home, title: 'Beranda'),
          TabItem(icon: Icons.search, title: 'Cari'),
          TabItem(icon: Icons.person, title: 'Profil'),
        ],
        onTap: onTabTapped,
        initialActiveIndex:
            _currentIndex, // Jika Anda ingin menentukan indeks awal
        backgroundColor: AppTheme
            .primaryColor, // Ganti dengan warna latar belakang yang diinginkan
        activeColor: Colors.white, // Ganti dengan warna ikon yang aktif
        // Ganti dengan warna teks yang tidak aktif
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
