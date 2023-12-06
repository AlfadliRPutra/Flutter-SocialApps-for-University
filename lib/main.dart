import 'package:flutter/material.dart';
import '/screens/home_screen.dart';
import 'package:src/models/color_scheme.dart';

void main() => runApp(const Berita());

class Berita extends StatelessWidget {
  const Berita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Berita',
      theme: AppTheme.getTheme(),
      home: const HomeScreen(),
    );
  }
}
