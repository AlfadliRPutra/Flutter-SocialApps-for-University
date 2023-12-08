import 'dart:convert';
import 'package:get/get.dart';
import 'package:src/controllers/user_profile_controller.dart';

import '../models/user.dart'; // Replace with the correct path to your UserModel class
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.user.value.id.isEmpty) {
          // Assuming id is a non-null property in UserModel
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
                    backgroundImage: NetworkImage(controller.user.value.avatar),
                  ),
                  SizedBox(height: 20),
                  Text(
                    controller.user.value.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    controller.user.value.email,
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
      }),
    );
  }
}
