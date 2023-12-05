import 'package:flutter/material.dart';

class CuacaModel {
  late int day;
  late String date;
  late String description;
  late String time;
  late IconData icon;
  late double iconSize;

  CuacaModel({
    required this.day,
    required this.date,
    required this.description,
    required this.time,
    required this.icon,
    this.iconSize = 32.0,
  });
  static String getDayName(int day) {
  switch (day) {
    case 1:
      return 'Senin';
    case 2:
      return 'Selasa';
    case 3:
      return 'Rabu';
    case 4:
      return 'Kamis';
    case 5:
      return 'Jumat';
    case 6:
      return 'Sabtu';
    case 7:
      return 'Minggu';
    default:
      return 'Invalid Day';
  }
}

}
