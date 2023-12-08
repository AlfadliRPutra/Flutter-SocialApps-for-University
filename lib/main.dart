import 'package:flutter/material.dart';
import 'package:src/screens/login_screen.dart';
import '/screens/home_screen.dart';
import 'package:src/models/color_scheme.dart';
import 'package:get/get.dart';

void main() => runApp(const Berita());

class Berita extends StatelessWidget {
  const Berita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Berita',
      theme: AppTheme.getTheme(),
      initialRoute: '/login', // Set the initial route to the login page
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()), // Define the login page route
        GetPage(name: '/home', page: () => HomeScreen()), // Define the home screen route
      ],
    );
  }
}
