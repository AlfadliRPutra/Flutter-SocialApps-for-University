import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:src/controllers/home_content_controller.dart';
import 'package:src/models/display_cuaca.dart';
import 'package:src/models/news.dart';
import 'package:src/models/news_card.dart';
import 'package:src/screens/detail_screen.dart';

class HomeContent extends StatelessWidget {
  final HomeContentController controller = Get.put(HomeContentController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Obx(() {
            if (controller.cuaca.value == null) {
              return Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF9BCDD2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return DisplayCuaca(cuaca: controller.cuaca.value!);
            }
          });
        }

        final news = newsList[index - 1];
        return NewsCard(
          news: news,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(news: news),
              ),
            );
          },
        );
      },
    );
  }
}
