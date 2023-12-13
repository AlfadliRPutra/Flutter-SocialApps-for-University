import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src/screens/chat_detail.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);

  // Dummy data
  final List<Map<String, dynamic>> dummyChats = [
    {
      'name': 'Nurrohman',
      'avatarUrl': 'https://example.com/avatar1.png',
      'lastChat': 'Mang eak?',
      'time': '10:30 AM',
    },
    {
      'name': 'Regina',
      'avatarUrl': 'https://example.com/avatar2.png',
      'lastChat': 'How are you?',
      'time': '11:45 AM',
    },
    {
      'name': 'Nabil',
      'avatarUrl': 'https://example.com/avatar3.png',
      'lastChat': 'Good morning!',
      'time': '9:15 AM',
    },
    {
      'name': 'Shela',
      'avatarUrl': 'https://example.com/avatar4.png',
      'lastChat': 'Hi!',
      'time': '2:20 PM',
    },
    {
      'name': 'Aounur',
      'avatarUrl': 'https://example.com/avatar5.png',
      'lastChat': 'Hey!',
      'time': '4:55 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyChats.length,
      itemBuilder: (context, index) {
        final chat = dummyChats[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(chat['avatarUrl']),
          ),
          title: Text(chat['name']),
          subtitle: Text(chat['lastChat']),
          trailing: Text(chat['time']),
          onTap: () {
            print('Tapped on chat item: ${chat['name']}');
            Get.toNamed('/chatDetail', arguments: chat['name']);
          },
        );
      },
    );
  }
}
