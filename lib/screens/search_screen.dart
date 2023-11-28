import 'package:flutter/material.dart';
import '/models/news.dart';
import '/models/news_card.dart';
import '/screens/detail_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SearchForm(), 
      ),
    );
  }
}

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController _searchController = TextEditingController();
  List<News> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: _searchController,
            decoration: const InputDecoration(
              labelText: 'Masukkan kata kunci',
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final searchKeyword = _searchController.text;
              setState(() {
                searchResults = performSearch(searchKeyword);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
            ),
            child: const Text('Cari'),
          ),
          if (searchResults.isNotEmpty)
            Column(
              children: searchResults.map((news) {
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
              }).toList(),
            ),
        ],
      ),
    );
  }

  List<News> performSearch(String keyword) {
    return newsList.where((news) {
      return news.title.toLowerCase().contains(keyword.toLowerCase()) ||
          news.contentSnippet.toLowerCase().contains(keyword.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
