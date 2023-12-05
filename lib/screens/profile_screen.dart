import 'dart:convert';
import '../models/user.dart'; // Replace with the correct path to your UserModel class
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatelessWidget {
  late UserModel user;

  Future<void> getProfile() async {
    try {
      var response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
      Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;

      // Assuming the API response structure matches UserModel
      user = UserModel(
        name: '${data['data']['first_name']} ${data['data']['last_name']}',
        email: data['data']['email'].toString(),
        id: data['data']['id'].toString(),
        avatar: data['data']['avatar'].toString(),
      );

      // You can use 'user' directly instead of 'name', 'mail', and 'avatarUrl'
      print('User: ${user.name}, ${user.email}, ${user.id}, ${user.avatar}');
    } catch (e) {
      // If an error occurs
      print('error ${e}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('Loading...'),
            );
          } else {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    SizedBox(height: 20),
                    Text(
                      user.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      user.email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
