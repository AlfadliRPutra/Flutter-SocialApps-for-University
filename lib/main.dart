import 'package:flutter/material.dart';
import 'package:newsMan/auth/login.dart';
import 'package:newsMan/home/about.dart';
import 'package:newsMan/home/news.dart';
import 'package:newsMan/home/news_detail.dart';
import 'package:newsMan/profile/profile.dart';
import 'package:newsMan/search/search.dart';

const Color shrinePink50 = Color(0xFFE1F5FE);
const Color shrinePink100 = Color(0xFFB3E5FC);
const Color shrinePink300 = Color(0xFF81D4FA);
const Color shrinePink400 = Color(0xFF29B6F6);

const Color shrineBrown900 = Color(0xFF00B8D4);
const Color shrineBrown600 = Color(0xFF00E5FF);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "News MaaaN",
      theme: _buildShrineTheme(),
      home: HomePage(
        title: "News MaaaN Home",
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String pageTitle = "Beranda";

  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final _listPage = <Widget>[
      ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return NewsCard(
            news: news[index],
            item: news[index],
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewsDetail(news: news[index]))
              );
            },
          );
        },
      ),
      SearchPage(),
      Profile()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage("https://adminlte.io/themes/AdminLTE/dist/img/user2-160x160.jpg"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: FlatButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                icon: Icon(Icons.login),
                label: Text("Login"),
                textColor: Colors.white,
                color: Theme.of(context).cursorColor,
                minWidth: 350,
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About())
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _listPage[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        unselectedLabelStyle: textTheme.caption,
        selectedLabelStyle: textTheme.caption,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            switch (value) {
              case 1:
                pageTitle = "Pencairan";  
                break;
              case 2:
                pageTitle = "Profile";
                break;
              default:
              pageTitle = "Trending";
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Beranda'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Cari'),
            icon: Icon(Icons.search),
          ),
          // BottomNavigationBarItem(
          //   title: Text('Notifikasi'),
          //   icon: Icon(Icons.notifications),
          // ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    textTheme: _buildShrineTextTheme(base.textTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);
