import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatelessWidget {
  // const ProfileScreen({Key? key}) : super(key: key);
  var name, mail, avatarUrl;
  Future getProfile() async {
    try {
      var response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
      Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      mail = data['data']['email'].toString();
      name = '${data['data']['firts_name']} ${data['data']['lasts_name']}';
      avatarUrl = data['data']['avatar'].toString();
    } catch (e) {
      //jika terjadi error
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
                        backgroundImage: NetworkImage(avatarUrl),
                      ),
                      SizedBox(height: 20),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        mail,
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
