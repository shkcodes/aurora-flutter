import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_weather_app/services/weather_api_service.dart';
import 'package:my_weather_app/state/add_location_state.dart';

class AddLocationBloc extends Bloc<AddLocationEvent, AddLocationState> {
  WeatherApiClient apiClient = WeatherApiClient();

  dispose() {
    super.dispose();
  }

  @override
  AddLocationState get initialState => AddLocationState();

  @override
  Stream<AddLocationState> mapEventToState(AddLocationEvent event) async* {
    if (event is LocationReceivedEvent) {
      yield currentState.rebuild((b) => b..isLoading = true);
      final location = await apiClient.fetchCitiesForLocation(event.latitude, event.longitude);
      yield currentState.rebuild((b) => b
        ..isLoading = false
        ..locationId = location.locationId);
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
