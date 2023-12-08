import 'dart:convert';

import 'package:get/get.dart';
import 'package:src/models/cuaca.dart';
import 'package:http/http.dart' as http;

class HomeContentController extends GetxController {
  final Rx<CuacaModel?> cuaca = Rx(null);

  @override
  void onInit() {
    super.onInit();
    fetchCuaca();
  }

  Future<void> fetchCuaca() async {
    try {
      final queryParameters = {
        'lat': '-1.555488',
        'lon': '103.663280',
        'q': 'jambi',
        'appid': '61e4e224e661060815a317029b134320',
        'units': 'metric',
        'lang': 'id'
      };
      final uriCuaca = Uri.https(
          'api.openweathermap.org', '/data/2.5/weather', queryParameters);

      final response = await http.get(uriCuaca);
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;

      cuaca.value = CuacaModel(
        day: DateTime.now().weekday,
        date: "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
        description: CuacaModel.capitalizeEveryWord(data['weather'][0]['description']),
        time: "${DateTime.now().hour}:${DateTime.now().minute}",
        temp: data['main']['temp'].toDouble(),
        icon: data['weather'][0]['icon'],
      );
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }
}
