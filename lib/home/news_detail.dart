import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newsMan/home/news.dart';

class NewsDetail extends StatelessWidget {
  final News news;

  NewsDetail({
    Key key, @required this.news
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NewsDetailPage(
      key: key,
      title: news.title,
      news: news,
    );
  }
}

class NewsDetailPage extends StatefulWidget {
  NewsDetailPage({
    Key key,
    this.title,
    this.news
  });
  final News news;
  final String title;
  _NewsDetailState createState() => _NewsDetailState(image: news.image, title: news.title, description: news.description);
}

class _NewsDetailState extends State<NewsDetailPage> {
  final String title;
  final String image;
  final String description;
  _NewsDetailState({
    this.title,
    this.image,
    this.description
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        )
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Image.network(image, height: 225, width: 225,)
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
                alignment: Alignment.topLeft,
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 25, 10, 25),
                child: TextFormField(
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    icon: Icon(Icons.post_add), labelText: "Komentar"),
                  ),
              ),
            ],
          )
        ),
      )
    );
  }
}