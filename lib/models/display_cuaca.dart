// WeatherDisplay.dart

import 'package:flutter/material.dart';
import '/models/cuaca.dart'; // Make sure to import the correct path

class DisplayCuaca extends StatelessWidget {
  final CuacaModel cuaca;

  const DisplayCuaca({required this.cuaca});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                CuacaModel.getDayName(cuaca.day),
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Text(cuaca.date, style: TextStyle(fontSize: 14.0)),
              Text(cuaca.description, style: TextStyle(fontSize: 14.0)),
              Text(cuaca.time),
            ],
          ),
          Row(
            children: [
              Icon(cuaca.icon, size: 32.0),
            ],
          ),
        ],
      ),
    );
  }
}
