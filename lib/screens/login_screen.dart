import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: loginC.nimC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'NIM',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller:
                loginC.passwordC, // Use the correct controller for the password
            autocorrect: false,
            textInputAction: TextInputAction.next,
            obscureText: true, // Hide the password input
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Perform login logic here using loginC.nimC.text and loginC.passwordC.text
              loginC.login();
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
