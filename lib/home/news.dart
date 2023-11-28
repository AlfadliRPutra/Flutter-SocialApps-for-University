import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class News {
  const News({this.title, this.description, this.image});
  final String title;
  final String description;
  final String image;
}

const List<News> news = const <News>[
  const News(
      title: "Ipsum 1",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      image:
          "https://image.freepik.com/free-vector/hot-news_23-2147512787.jpg"),
  const News(
      title: "Ipsum 2",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      image:
          "https://image.freepik.com/free-vector/hot-news_23-2147512787.jpg"),
  const News(
      title: "Ipsum 3",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      image:
          "https://image.freepik.com/free-vector/hot-news_23-2147512787.jpg"),
  const News(
      title: "Ipsum 4",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      image:
          "https://image.freepik.com/free-vector/hot-news_23-2147512787.jpg"),
  const News(
      title: "Ipsum 5",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      image:
          "https://image.freepik.com/free-vector/hot-news_23-2147512787.jpg"),
  const News(
      title: "Ipsum 6",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      image: "https://image.freepik.com/free-vector/hot-news_23-2147512787.jpg")
];

class NewsCard extends StatelessWidget {
  const NewsCard(
      {Key key,
      this.news,
      this.onTap,
      @required this.item,
      this.selected: false})
      : super(key: key);

  final News news;
  final VoidCallback onTap;
  final News item;
  final bool selected;
  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected) {
      textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    }



    return Card(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Row(
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.topLeft,
              child: Image.network(
                news.image,
                height: 150,
                width: 150,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  new Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      news.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 2,
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      news.description,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  )
                ],
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        )
      );
  }
}
