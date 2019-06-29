import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather.g.dart';

abstract class WeatherResponse implements Built<WeatherResponse, WeatherResponseBuilder> {
  @BuiltValueField(wireName: 'consolidated_weather')
  BuiltList<Weather> get consolidatedWeather;


  @BuiltValueField(wireName: 'title')
  String get location;

  factory WeatherResponse([void Function(WeatherResponseBuilder) updates]) = _$WeatherResponse;

  static Serializer<WeatherResponse> get serializer => _$weatherResponseSerializer;

  WeatherResponse._();
}

abstract class Weather implements Built<Weather, WeatherBuilder> {
  int get id;

  @BuiltValueField(wireName: 'weather_state_name')
  String get weatherStateName;

  @BuiltValueField(wireName: 'weather_state_abbr')
  String get weatherStateAbbr;

  @BuiltValueField(wireName: 'the_temp')
  double get temperature;

  factory Weather([void Function(WeatherBuilder) updates]) = _$Weather;

  static Serializer<Weather> get serializer => _$weatherSerializer;

  Weather._();

  String getIcon() {
    String image;
    switch (weatherStateAbbr) {
      case 'sn':
        image = 'assets/images/snow.svg';
        break;
      case 'sl':
        image = 'assets/images/sleet.svg';
        break;
      case 'h':
        image = 'assets/images/hail.svg';
        break;
      case 't':
        image = 'assets/images/thunderstorm.svg';
        break;
      case 'hr':
        image = 'assets/images/heavyrain.svg';
        break;
      case 'lr':
        image = 'assets/images/lightrain.svg';
        break;
      case 's':
        image = 'assets/images/showers.svg';
        break;
      case 'hc':
        image = 'assets/images/heavycloud.svg';
        break;
      case 'lc':
        image = 'assets/images/lightcloud.svg';
        break;
      default:
        image = 'assets/images/clear.svg';
    }
    return image;
  }
}
