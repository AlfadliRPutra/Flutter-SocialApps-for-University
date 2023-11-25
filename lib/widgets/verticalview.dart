import 'package:flutter/material.dart';


class VerticalView extends StatelessWidget {
  const VerticalView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          alignment: Alignment.bottomLeft,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(
              image: NetworkImage(
                "https://picsum.photos/id/${778 + index}/200/300",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
