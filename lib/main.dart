import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "data/logo-unja.png",
                height: 30,
              ),
              SizedBox(width: 8),
              Text('UNJAnews'),
            ],
          ),
          backgroundColor: Colors.orange[200],
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 216, 214, 214),
        body: ListView(
          children: [
            Container(
              child: Image.asset(
                "data/logo-unja.png",
                height: 50,
              ),
            ),
            Row(
              children: [
                Container(
                  child: Center(child: Text("Header")),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Excepturi porro aliquam corrupti eligendi dicta voluptate voluptas atque possimus earum molestias dignissimos, nisi architecto, temporibus itaque doloribus officiis laborum tenetur illum tempore dolores. Et eum, ipsum accusamus necessitatibus blanditiis, sequi dolores soluta sint nobis cumque dolore eos rerum eius, saepe laudantium optio molestiae fuga consequatur sed asperiores fugit distinctio quisquam voluptas! Porro voluptatibus sunt ratione ea earum quos voluptatem ut quae nulla quas digniti",
                      // Add additional text as needed
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
