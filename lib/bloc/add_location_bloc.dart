import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_weather_app/services/weather_api_service.dart';
import 'package:my_weather_app/state/add_location_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddLocationBloc extends Bloc<AddLocationEvent, AddLocationState> {
  WeatherApiClient apiClient = WeatherApiClient();
  final StreamController<AddLocationEffect> effects = StreamController();

  dispose() {
    effects.close();
    super.dispose();
  }

  @override
  AddLocationState get initialState => AddLocationState();

  @override
  Stream<AddLocationState> mapEventToState(AddLocationEvent event) async* {
    if (event is LocationReceivedEvent) {
      yield currentState.rebuild((b) => b..isLoading = true);
      final location = await apiClient.fetchCitiesForLocation(event.latitude, event.longitude);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final locationsList = prefs.getStringList('locations') ?? [];
      locationsList.add(location.locationId.toString());
      prefs.setStringList('locations', locationsList.toSet().toList());
      effects.sink.add(CloseScreen(locationsList.toSet().toList()));
    }
  }
}

abstract class AddLocationEvent {}

class LocationReceivedEvent extends AddLocationEvent {
  final double latitude;
  final double longitude;

  LocationReceivedEvent({@required this.latitude, this.longitude});

  @override
  String toString() => 'LoadWeatherEvent';
}

abstract class AddLocationEffect {}

class CloseScreen extends AddLocationEffect {
  final List<String> locations;

  CloseScreen(this.locations);

  @override
  String toString() => 'CloseScreen';
}
