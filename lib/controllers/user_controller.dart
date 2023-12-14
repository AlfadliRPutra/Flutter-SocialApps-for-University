import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoggedIn = false.obs;
  var username = ''.obs;
  var fullName = ''.obs;
  var password = ''.obs;
  var avatar = ''.obs;

  void setUser({
    required String username,
    required String fullName,
    required String password,
    required String avatar,
  }) {
    this.username.value = username;
    this.fullName.value = fullName;
    this.password.value = password;
    this.avatar.value = avatar;
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
    username.value = '';
    fullName.value = '';
    password.value = '';
    avatar.value = '';
  }
}
