import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src/models/color_scheme.dart';

class ChatDetail extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Receive the argument
    final String chatName = Get.arguments ?? 'Chat Detail';

    return Scaffold(
      appBar: AppBar(
        title: Text(chatName), // Set the title dynamically
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
          _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildChatInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Set a background color
                borderRadius:
                    BorderRadius.circular(25.0), // Add rounded corners
              ),
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  border: InputBorder.none, // Hide the default border
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: () {
              final message = messageController.text;
              if (message.isNotEmpty) {
                chatController.addMessage(message);
                messageController.clear();
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(25.0), // Add rounded corners
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatController extends GetxController {
  var chatMessages = [
    ChatMessage(sender: 'me', message: 'Hello, Hari ini kuliah?'),
    ChatMessage(
        sender: 'Nurrohman', message: 'Hi, Fadli. ga, bukannya hujan ya?'),
    ChatMessage(sender: 'me', message: 'Oke, Mas. Thx!'),
    // Add more initial dummy chat messages as needed
  ].obs;

  void addMessage(String message) {
    chatMessages.add(ChatMessage(sender: 'me', message: message));
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
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isSentByMe ? AppTheme.secondaryColor : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSentByMe ? 20.0 : 0),
            topRight: Radius.circular(isSentByMe ? 0 : 20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
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
