import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src/models/color_scheme.dart';
import 'package:http/http.dart' as http;

class ChatDetail extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Receive the argument
    final Map<String, dynamic> arguments = Get.arguments ?? {};
    final String chatName = arguments['sender'] ?? 'Chat Detail';

    // Call the method to initialize chat messages for the selected sender and receiver
    chatController.initChatMessages('me', arguments['sender']);

    return Scaffold(
      appBar: AppBar(
        title: Text(chatName), // Set the title dynamically
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle the selected action
              if (value == 'delete') {
                // Assuming 'arguments['sender']' is the receiver
                final receiver = arguments['sender'];
                chatController.deleteMessages(receiver);
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'delete',
                child: Text('Delete Messages'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: chatController.chatMessages.length,
                itemBuilder: (context, index) {
                  final chat = chatController.chatMessages[index];
                  return ChatBubble(
                    message: chat.message,
                    isSentByMe: chat.sender == 'me',
                  );
                },
              ),
            ),
          ),
          _buildChatInput(context, arguments),
        ],
      ),
    );
  }

  Widget _buildChatInput(BuildContext context, Map<String, dynamic> arguments) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Set a background color
                borderRadius:
                    BorderRadius.circular(25.0), // Add rounded corners
              ),
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  hintText: 'Type your message...',
                  border: InputBorder.none, // Hide the default border
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: () {
              final message = messageController.text;
              final receiver =
                  arguments['sender']; // Assuming sender is the receiver
              if (message.isNotEmpty) {
                chatController.addMessage(message, receiver);
                messageController.clear();
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(25.0), // Add rounded corners
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatController extends GetxController {
  void initChatMessages(String sender, String receiver) async {
    // Clear existing chat messages
    chatMessages.clear();

    try {
      // Fetch messages from the server or database based on sender and receiver
      final response = await http.post(
        Uri.parse('http://localhost/unjatoday/fetch_messages.php'),
        body: {
          'sender': sender,
          'receiver': receiver,
        },
      );

      if (response.statusCode == 200) {
        // Parse the response and add messages to chatMessages
        final List<dynamic> messages = jsonDecode(response.body);
        for (var message in messages) {
          chatMessages.add(ChatMessage(
            sender: message['sender'],
            message: message['message'],
          ));
        }
      } else {
        print('Failed to fetch messages: ${response.statusCode}');
        // Handle the failure here
      }
    } catch (e) {
      print('Error fetching messages: $e');
      // Handle the error here
    }
  }

  Future<void> deleteMessages(String receiver) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost/unjatoday/delete_messages.php'),
        body: {'receiver': receiver},
      );

      if (response.statusCode == 200) {
        // Clear local chat messages
        chatMessages.clear();
        print('Messages deleted successfully');
      } else {
        print('Failed to delete messages: ${response.statusCode}');
        // Handle the failure here
      }
    } catch (e) {
      print('Error deleting messages: $e');
      // Handle the error here
    }
  }

  var chatMessages = <ChatMessage>[].obs;

  Future<void> addMessage(String message, String receiver) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost/unjatoday/send_message.php'),
        body: jsonEncode({
          'sender': 'me',
          'receiver': receiver.toString(),
          'message': message.toString(),
          'time': DateTime.now().toString(),
        }),
        headers: {'Content-Type': 'application/json'},
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        // Parse the response, if needed
        final responseData = jsonDecode(response.body);
        // Handle the response data

        // Add the message locally only if http.post is successful
        chatMessages.add(ChatMessage(sender: 'me', message: message));

        print('Message sent successfully');
      } else {
        print('Failed to send message: ${response.statusCode}');
        print('Response body: ${response.body}');
        // You can handle the failure here
      }
    } catch (e) {
      print('Error sending message: $e');
      // Handle the error here
    }
  }
}

class ChatMessage {
  final String sender;
  final String message;

  ChatMessage({required this.sender, required this.message});
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const ChatBubble({required this.message, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isSentByMe ? AppTheme.secondaryColor : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSentByMe ? 20.0 : 0),
            topRight: Radius.circular(isSentByMe ? 0 : 20.0),
            bottomLeft: const Radius.circular(20.0),
            bottomRight: const Radius.circular(20.0),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: isSentByMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
