import 'package:flutter/material.dart';
import './widgets/verticalview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            "data/logo-unja.png",
          ),
          title: Text("UNJAnews"),
          backgroundColor: Colors.orange[200],
          centerTitle: true,
          actions: [
            IconButton(
              padding: EdgeInsets.all(10),
              onPressed: () {},
              icon: Icon(Icons.account_circle),
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 216, 214, 214),
        body: VerticalView(),
      ),
    );
  }
}
