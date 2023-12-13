import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/models/news.dart';
import '/models/news_card.dart';
import '/screens/detail_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GetBuilder<SearchController>(
          init: SearchController(),
          builder: (controller) {
            return SearchForm(controller: controller);
          },
        ),
      ),
    );
  }
}

class SearchForm extends StatelessWidget {
  final SearchController controller;

  const SearchForm({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: controller.searchController,
            decoration: const InputDecoration(
              labelText: 'Masukkan kata kunci',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final searchKeyword = controller.searchController.text;
              controller.performSearch(searchKeyword);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
            ),
            child: const Text('Cari'),
          ),
          const SizedBox(height: 10),
          Obx(
            () => controller.searchResults.isNotEmpty
                ? Column(
                    children: controller.searchResults.map((news) {
                      return NewsCard(
                        news: news,
                        onTap: () {
                          Get.to(() => DetailScreen(news: news));
                        },
                      );
                    }).toList(),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

class SearchController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  var searchResults = <News>[].obs;

  void performSearch(String keyword) {
    searchResults.assignAll(newsList.where((news) {
      return news.title.toLowerCase().contains(keyword.toLowerCase()) ||
          news.contentSnippet.toLowerCase().contains(keyword.toLowerCase());
    }).toList());
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
