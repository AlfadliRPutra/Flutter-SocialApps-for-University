import 'package:flutter/material.dart';
import '/screens/search_screen.dart';
import '/screens/profile_screen.dart';
import '/screens/detail_screen.dart';
import '/models/news.dart';
import '/models/news_card.dart';
import 'package:src/models/cuaca.dart';
import 'dart:core';
import '/models/display_cuaca.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeContent(),
    const SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UNJAtoday'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class HomeContent extends StatelessWidget {
  // const HomeContent({Key? key}) : super(key: key);
  DateTime now = DateTime.now();
  late CuacaModel cuaca;
  Future<CuacaModel> cuacaBuilder() async {
    try {
      // You can use Dart's core functionality to get the current date and time
      cuaca = CuacaModel(
        day: now.weekday,
        date: "${now.day}/${now.month}/${now.year}",
        description: "Your Description", // Replace with your description logic
        time: "${now.hour}:${now.minute}",
        icon: Icons.cloud, // Replace with your icon logic
      );

      return cuaca;
    } catch (e) {
      // If an error occurs
      print('error $e');
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return FutureBuilder(
            future: cuacaBuilder(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return DisplayCuaca(cuaca: cuaca);
              } else {
                return Text('No data available');
              }
            },
          );
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
