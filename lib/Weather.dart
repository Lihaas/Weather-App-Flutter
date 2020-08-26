import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

var cityname = "Delhi";
var _APIID = "********************";
var weather = "Ok";

Future<void> Weather(city) async {
  cityname = city;
  var url =
      'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$_APIID';

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['name'];
    var temp = jsonResponse['main']['temp'];
    cityname = itemCount;
    double far = ((temp - 273.15));
    weather = far.toStringAsFixed(2) + " C";
    print(temp);
    print(cityname);
    print(weather);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

String getCityName() {
  return cityname;
}

String getWeather() {
  return weather;
}
