import 'package:flutter/material.dart';

class HariIniPage extends StatelessWidget {
  const HariIniPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UNJAnews'),
        actions: [
          IconButton(
            padding: EdgeInsets.all(10),
            onPressed: () {},
            icon: Icon(Icons.account_circle),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          backgroundColor: Colors.amber,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: "Hari Ini",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_line_chart),
              label: "Trending",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Untukmu",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Menu",
            ),
          ]),
    );
  }
}
