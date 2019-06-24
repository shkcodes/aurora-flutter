import 'package:bloc/bloc.dart';
import 'package:my_weather_app/models/weather.dart';
import 'package:my_weather_app/services/weather_api_service.dart';
import 'package:my_weather_app/state/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherApiClient apiClient = WeatherApiClient();

  dispose() {
    super.dispose();
  }

  @override
  WeatherState get initialState => WeatherState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is LoadWeatherEvent) {
      yield currentState.rebuild((b) => b..isLoading = true);
      List<Weather> weather = await apiClient.fetchWeather(44418);
      yield currentState.rebuild((b) => b
        ..isLoading = false
        ..weather = weather);
    }
  }
}

abstract class WeatherEvent {}

class LoadWeatherEvent extends WeatherEvent {
  @override
  String toString() => 'LoadWeatherEvent';
}