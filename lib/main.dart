import 'package:flutter/material.dart';
import '/screens/home_screen.dart';

void main() => runApp(const Berita());

class Berita extends StatelessWidget {
  const Berita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Berita',
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
            primary: Color.fromARGB(255, 165, 0, 1),
            secondary: Color.fromARGB(255, 215, 0, 1),
            tertiary: Color.fromARGB(255, 238, 234, 232)),
      ),
      home: const HomeScreen(),
    );
  }
}
