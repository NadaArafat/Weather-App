import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {

  final String _urlBase = 'https://api.weatherapi.com/v1';
  final String _apiKey = '5dd5e26c38f14d2ab48193714242704';

  Future<WeatherModel> getWeatherData({required String cityName}) async {
    var response = await http.get(
      Uri.parse(
          '$_urlBase/forecast.json?key=$_apiKey&q=$cityName&days=1'),
    );
    if(response.statusCode == 200) {
      WeatherModel weatherModel = WeatherModel.fromJson(
          json.decode(response.body));
      print("Success");
      return weatherModel;
    }
    else{
      final String errorMessage = json.decode(response.body)['error']['message']?? 'oops,there was an error,try again';
      print("error occurred: $errorMessage");
      throw Exception('oops,there was an error,try again');
    }
  }
}
