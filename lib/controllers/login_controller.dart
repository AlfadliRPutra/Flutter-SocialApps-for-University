import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }
  //function untuk login
  void login() {
    if (email.value == 'alfadli@unja.ac.id' && password.value == 'admin') {
    // if (email.value == 'admin@gmail.com' && password.value == 'admin') {
      Get.snackbar('Login Success', 'Welcome!',
          snackPosition: SnackPosition.BOTTOM);
      Get.offNamed('/home');
    } else {
      Get.snackbar('Login Failed', 'Invalid email or password',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}