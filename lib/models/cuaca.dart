// Import library Dart
class CuacaModel {
  // Properti untuk data cuaca
  late int day;
  late String date;
  late String description;
  late String time;
  late String icon;
  late double temp;
  late double iconSize;

  // Konstruktor untuk inisialisasi properti
  CuacaModel({
    required this.day,
    required this.date,
    required this.description,
    required this.time,
    required this.icon,
    required this.temp,
    this.iconSize = 32.0,
  });

  // Fungsi untuk mendapatkan nama hari berdasarkan nomor hari
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

  // Fungsi untuk mengkapitalisasi setiap kata dalam sebuah string
  static String capitalizeEveryWord(String input) {
    return input
        .split(' ')
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1)}'
            : '')
        .join(' ');
  }
}
