import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStatusName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStatusName});

  factory WeatherModel.fromjson(dynamic data) {
    var jasonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jasonData['avgtemp_c'],
        maxTemp: jasonData['maxtemp_c'],
        minTemp: jasonData['mintemp_c'],
        weatherStatusName: jasonData['condition']['text']);
  }

  String getImage() {
    if (weatherStatusName == 'Clear' || weatherStatusName == 'Light Cloud ') {
      return 'assets/images/clear.png';
    } else if (weatherStatusName == 'Sleet' ||
        weatherStatusName == 'Snow' ||
        weatherStatusName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStatusName == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStatusName == 'Light Rain' ||
        weatherStatusName == 'Heavy Rain' ||
        weatherStatusName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStatusName == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStatusName == 'Clear' || weatherStatusName == 'Light Cloud ') {
      return Colors.orange;
    } else if (weatherStatusName == 'Sleet' ||
        weatherStatusName == 'Snow' ||
        weatherStatusName == 'Hail') {
      return Colors.blue;
    } else if (weatherStatusName == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherStatusName == 'Light Rain' ||
        weatherStatusName == 'Heavy Rain' ||
        weatherStatusName == 'Showers') {
      return Colors.lightBlue;
    } else if (weatherStatusName == 'Sunny') {
      return Colors.red;
    } else {
      return Colors.deepPurple;
    }
  }
}
