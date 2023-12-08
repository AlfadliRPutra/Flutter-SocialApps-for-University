import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final nimC = TextEditingController();
  final passwordC = TextEditingController();

  void login() {
    final nim = nimC.text;
    final password = passwordC.text;

    // Check if the entered credentials match the test values
    if (nim == 'admin' && password == 'adminpass') {
      // If match, consider the user as logged in
      print('Login successful!');

      // Navigate to the HomeScreen
      Get.offAllNamed(
          '/home'); // Use the route name or replace it with the appropriate route
    } else {
      // If not match, show an error message
      print('Login failed. Invalid credentials.');
    }
  }
}
