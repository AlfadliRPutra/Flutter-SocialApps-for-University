import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:src/screens/chat_detail.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Define a map to store the last message for each sender
  Map<String, Map<String, dynamic>> lastMessages = {};

  // Fetch data from the server
  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost/unjatoday/chat.php'));

      if (response.statusCode == 200) {
        // Decode the JSON response
        final List<dynamic> decodedData = json.decode(response.body);

        // Process the data to get the last message for each sender
        lastMessages = {};
        for (final item in decodedData) {
          final sender = item['sender']?.toString() ?? '';
          final message = item['message']?.toString() ?? '';
          final time = item['time']?.toString() ?? '';

          // Only include messages where sender is not 'me'
          if (sender != 'me') {
            // Update the last message for each sender
            lastMessages[sender] = {
              'sender': sender,
              'message': message,
              'time': time,
            };
          }
        }
      } else {
        // Handle the error, e.g., show an error message
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other errors
      print('Error: $e');
    }
  }

  // Function to handle refresh
  Future<void> _handleRefresh() async {
    await fetchData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Build the ListView using the last messages
              return ListView.builder(
                itemCount: lastMessages.length,
                itemBuilder: (context, index) {
                  final message = lastMessages.values.elementAt(index);
                  return ListTile(
                    title: Text(
                      message['sender'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      message['message'].length > 30
                          ? '${message['message'].substring(0, 30)}...'
                          : message['message'],
                    ),
                    trailing: Text(_buildTrailing(message['time'])),
                    onTap: () {
                      // Pass the sender as an argument to ChatDetail
                      Get.to(() => ChatDetail(),
                          arguments: {'sender': message['sender'].toString()});
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

String _buildTrailing(String time) {
  DateTime messageTime = DateTime.parse(time);
  DateTime now = DateTime.now();

  if (now.day == messageTime.day &&
      now.month == messageTime.month &&
      now.year == messageTime.year) {
    // Today
    return DateFormat.Hm().format(messageTime).toString();
  } else if (now.day - 1 == messageTime.day &&
      now.month == messageTime.month &&
      now.year == messageTime.year) {
    // Yesterday
    return 'Kemarin';
  } else {
    // More than a day ago, show only the date
    return DateFormat.yMMMd().format(messageTime).toString();
  }
}
