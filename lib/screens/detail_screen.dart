import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/models/news.dart';

class DetailScreen extends StatelessWidget {
  final News news;

  const DetailScreen({Key? key, required this.news}) : super(key: key);

  void copyToClipboard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Teks telah disalin ke clipboard')),
    );
  }

  String _formatDate(String isoDate) {
    final parsedDate = DateTime.parse(isoDate);
    final formattedDate =
        "${parsedDate.day}-${parsedDate.month}-${parsedDate.year}";
    return formattedDate;
  }

  String _formatTime(String isoDate) {
    final parsedDate = DateTime.parse(isoDate);
    final formattedTime = "${parsedDate.hour}:${parsedDate.minute}";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.content_copy),
              onPressed: () {
                copyToClipboard(
                    '${news.title}\n${news.contentSnippet}', context);
              },
            ),
          ],
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: _buildContent(),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.content_copy),
              onPressed: () {
                copyToClipboard(
                    '${news.title}\n${news.contentSnippet}', context);
              },
            ),
          ],
        ),
        body: _buildContent(),
      );
    }
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              news.image['large'] ?? '',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  news.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      _formatDate(news.isoDate),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatTime(news.isoDate),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  news.contentSnippet,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
