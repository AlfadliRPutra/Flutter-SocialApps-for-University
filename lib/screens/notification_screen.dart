import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: List.generate(
          10,
          (index) => NotificationCard(
            username: 'User $index',
            message: 'Lorem ipsum dolor sit amet.',
            time: '${index + 1}h ago',
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String username;
  final String message;
  final String time;

  const NotificationCard({
    required this.username,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          // You can customize the avatar based on the user or notification type
          child: Icon(Icons.notifications),
        ),
        title: Text(
          '$username: $message',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(time),
        onTap: () {
          // Handle notification tap if needed
        },
      ),
    );
  }
}
