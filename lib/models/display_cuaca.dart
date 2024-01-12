// WeatherDisplay.dart

import 'package:flutter/material.dart';
import 'package:src/models/color_scheme.dart';
import '/models/cuaca.dart'; // Make sure to import the correct path

class DisplayCuaca extends StatelessWidget {
  final CuacaModel cuaca;

  const DisplayCuaca({super.key, required this.cuaca});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.tertiaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Jambi, Hari ini', // Tambahkan keterangan lokasi
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                CuacaModel.getDayName(cuaca.day),
                style: const TextStyle(
                    fontSize: 21.0, fontWeight: FontWeight.bold),
              ),
              Text(cuaca.date, style: const TextStyle(fontSize: 12.0)),
              Text(cuaca.time, style: const TextStyle(fontSize: 12.0)),
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
                  Text(
                    '${cuaca.temp.toString()}°',
                  ),
                  Text(
                    cuaca.description,
                    style: const TextStyle(
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
