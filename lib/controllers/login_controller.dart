import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:src/controllers/user_controller.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  // Function for login
  void login() async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost/unjatoday/login.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': email.value,
          'password': password.value,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> result = json.decode(response.body);

        if (result['status'] == 'success') {
          // Jika login berhasil, set data pengguna di UserController
          Get.find<UserController>().setUser(
            username: result['username'].toString(),
            fullName: result['fullName'].toString(),
            password: password.value,
            avatar: result['avatar'].toString(),
          );

          Get.snackbar('Login Berhasil', 'Selamat!',
              snackPosition: SnackPosition.BOTTOM);
          Get.offAllNamed('/home');
          
        } else {
          Get.snackbar('Login Gagal', result['message'],
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar('Login Gagal', 'Terjadi kesalahan saat login',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
