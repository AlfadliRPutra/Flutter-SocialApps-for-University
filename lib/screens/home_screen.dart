import 'dart:convert';
import 'package:src/models/color_scheme.dart';
import 'package:flutter/material.dart';
import '/screens/search_screen.dart';
import '/screens/profile_screen.dart';
import '/screens/detail_screen.dart';
import '/models/news.dart';
import '/models/news_card.dart';
import 'package:src/models/cuaca.dart';
import 'dart:core';
import '/models/display_cuaca.dart';
import 'package:http/http.dart' as http;
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _children = [
    HomeContent(),
    const SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Text(
          'UNJAtoday',
          style: TextStyle(
            color: const Color.fromARGB(
                255, 66, 66, 66), // Atur warna teks menjadi putih
            fontFamily: 'Open Sans', fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // Tambahkan ikon menu di sebelah kanan app bar
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: const Color.fromARGB(255, 66, 66, 66),
            semanticLabel: 'menu',
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Use the GlobalKey here
          },
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Beranda'),
          TabItem(icon: Icons.search, title: 'Cari'),
          TabItem(icon: Icons.person, title: 'Profil'),
        ],
        onTap: onTabTapped,
        initialActiveIndex:
            _currentIndex, // Jika Anda ingin menentukan indeks awal
        backgroundColor: AppTheme
            .primaryColor, // Ganti dengan warna latar belakang yang diinginkan
        activeColor: Colors.white, // Ganti dengan warna ikon yang aktif
        // Ganti dengan warna teks yang tidak aktif
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'UNJANews',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
            ListTile(
              title: Text('Semua Berita'),
              onTap: () {
                Navigator.pop(context); // Tutup sidebar

                // Navigasi ke halaman beranda
              },
            ),
            // Tambahkan item untuk kategori berita lainnya
            ListTile(
              title: Text('Kampus'),
              onTap: () {
                // Navigasi ke halaman kategori kampus
              },
            ),
            ListTile(
              title: Text('Akademik'),
              onTap: () {
                // Navigasi ke halaman kategori akademik
              },
            ),
            // ... tambahkan item lainnya
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  // const HomeContent({Key? key}) : super(key: key);
  DateTime now = DateTime.now();
  late CuacaModel cuaca;
  Future<CuacaModel> cuacaBuilder() async {
    try {
      // Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=61e4e224e661060815a317029b134320')
      final queryParameters = {
        'lat':
            '-1.555488', // Tambahkan parameter lat dengan koordinat UNJA Mendalo
        'lon':
            '103.663280', // Tambahkan parameter lon dengan koordinat UNJA Mendalo
        'q': 'jambi',
        'appid': '61e4e224e661060815a317029b134320',
        'units': 'metric',
        'lang': 'id'
      };
      final uriCuaca = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameters);

      var response = await http.get(uriCuaca);
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      // You can use Dart's core functionality to get the current date and time
      cuaca = CuacaModel(
        day: now.weekday,
        date: "${now.day}/${now.month}/${now.year}",
        description:
            CuacaModel.capitalizeEveryWord(data['weather'][0]['description']),
        time: "${now.hour}:${now.minute}",
        temp: data['main']['temp'].toDouble(),
        icon: data['weather'][0]['icon'],
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
                return Center(child: CircularProgressIndicator());
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
