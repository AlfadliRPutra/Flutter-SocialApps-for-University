import 'package:flutter/material.dart';
import '/models/news.dart';

class NewsCard extends StatelessWidget {
  final News news;
  final VoidCallback onTap;

  const NewsCard({Key? key, required this.news, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar di sebelah kiri
            Container(
              margin: const EdgeInsets.all(8.0),
              width: 150,
              height: 150,
              child: Image.network(
                news.image['large'] ?? '',
                fit: BoxFit.cover,
              ),
            ),
            // Teks dan informasi di sebelah kanan dengan jarak vertikal
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                        height: 8), // Jarak antara judul dan ringkasan
                    Text(
                      news.contentSnippet,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                        height: 8), // Jarak antara ringkasan dan tanggal
                    // Tampilkan tanggal dan waktu di dalam Column
                    Row(
                      children: [
                        Text(
                          _formatDate(news.isoDate),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                            width:
                                8), // Jarak horizontal antara tanggal dan waktu
                        Text(
                          _formatTime(news.isoDate),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
}
