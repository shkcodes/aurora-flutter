import 'package:built_value/built_value.dart';
import 'package:my_weather_app/models/weather.dart';

part 'weather_state.g.dart';

abstract class WeatherState implements Built<WeatherState, WeatherStateBuilder> {
  List<Weather> get weather;

  @nullable
  String get location;

  bool get isLoading;

  WeatherState._();

  factory WeatherState([updates(WeatherStateBuilder b)]) => new _$WeatherState((b) => b
    ..isLoading = false
    ..weather = []);
}
