import 'dart:convert';
import 'package:get/get.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var user = UserModel(
    name: 'Default Name',
    email: 'default@example.com',
    id: '0',
    avatar: 'https://example.com/default-avatar.jpg',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    // Call getProfile when the controller is initialized
    getProfile();
  }

  Future<void> getProfile() async {
    try {
      var response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
      Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;

      user(UserModel(
        name: '${data['data']['first_name']} ${data['data']['last_name']}',
        email: data['data']['email'].toString(),
        id: data['data']['id'].toString(),
        avatar: data['data']['avatar'].toString(),
      ));

      print(
          'User: ${user.value.name}, ${user.value.email}, ${user.value.id}, ${user.value.avatar}');
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}
