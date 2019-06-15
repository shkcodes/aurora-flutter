import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:my_weather_app/models/serializers.dart';
import 'package:my_weather_app/models/weather.dart';

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com';
  final Dio _dio = Dio();

  Future<int> getLocationId(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await _dio.get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final locationJson = jsonDecode(locationResponse.data) as List;
    return (locationJson.first)['woeid'];
  }

  Future<List<Weather>> fetchWeather(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final weatherResponse = await _dio.get(weatherUrl);

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }
    final WeatherResponse response =
        serializers.deserializeWith(WeatherResponse.serializer, json.decode(weatherResponse.data));
    return response.consolidated_weather.toList();
  }
}
