import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:my_weather_app/models/location.dart';
import 'package:my_weather_app/models/serializers.dart';
import 'package:my_weather_app/models/weather.dart';

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com';
  final httpClient = http.Client();

  Future<int> getLocationId(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await httpClient.get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

  Future<WeatherResponse> fetchWeather(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    print(weatherUrl);
    final weatherResponse = await this.httpClient.get(weatherUrl);

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }
    final weather =
    serializers.deserializeWith(WeatherResponse.serializer, json.decode(weatherResponse.body));
    return weather;
  }

  Future<Location> fetchCitiesForLocation(double lat, double lng) async {
    final url = '$baseUrl/api/location/search/?lattlong=$lat,$lng';
    print(url);
    final locationsResponse = await this.httpClient.get(url);
    if (locationsResponse.statusCode != 200) {
      throw Exception('error getting cities for location');
    }
    final BuiltList<Location> locationsList =
    deserializeListOf<Location>(json.decode(locationsResponse.body));
    return locationsList[0];
  }
}
