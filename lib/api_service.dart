import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  final String apiKey = '2470e784852f27394e63af93458f913f';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Gagal memuat data cuaca');
    }
  }
}