// WeatherDisplay.dart

import 'package:flutter/material.dart';
import '/models/cuaca.dart'; // Make sure to import the correct path

class DisplayCuaca extends StatelessWidget {
  final CuacaModel cuaca;

  const DisplayCuaca({required this.cuaca});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange[900],
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
                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
              ),
              Text(cuaca.date, style: TextStyle(fontSize: 12.0)),
              Text(cuaca.time, style: TextStyle(fontSize: 12.0)),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    'https://openweathermap.org/img/wn/${cuaca.icon}@2x.png',
                  ),
                  Text(cuaca.temp.toString()),
                  Text(
                    cuaca.description,
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
