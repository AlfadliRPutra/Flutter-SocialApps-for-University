import 'package:flutter/material.dart';
import 'package:newsMan/home/news.dart';
import 'package:newsMan/home/news_detail.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SearchPage();
  }
}

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);

  final String title;
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _valCategory;
  List _myCategory = ["Hobi", "Musik", "Action Figure", "IT", "Tech"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            child: DropdownButton(
              isExpanded: true,
              hint: Text("Cari berdasarkan kategori"),
              value: _valCategory,
              items: _myCategory.map((value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _valCategory = value;
                });
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 214,
            child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return NewsCard(
                  news: news[index],
                  item: news[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsDetail(news: news[index])));
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
