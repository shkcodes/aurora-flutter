import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather.g.dart';

abstract class WeatherResponse implements Built<WeatherResponse, WeatherResponseBuilder> {
  BuiltList<Weather> get consolidated_weather;

  factory WeatherResponse([void Function(WeatherResponseBuilder) updates]) = _$WeatherResponse;

  static Serializer<WeatherResponse> get serializer => _$weatherResponseSerializer;

  WeatherResponse._();
}

abstract class Weather implements Built<Weather, WeatherBuilder> {
  int get id;

  String get weather_state_name;

  String get weather_state_abbr;

  factory Weather([void Function(WeatherBuilder) updates]) = _$Weather;

  static Serializer<Weather> get serializer => _$weatherSerializer;

  Weather._();
}
