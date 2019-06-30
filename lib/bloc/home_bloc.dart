import 'package:bloc/bloc.dart';
import 'package:my_weather_app/state/home_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  dispose() {
    super.dispose();
  }

  @override
  HomeState get initialState => HomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is PageChangedEvent) {
      yield currentState.rebuild((b) => b..currentPage = event.currentPage);
    }
    if (event is RemoveLocationEvent) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final locationsList = prefs.getStringList('locations') ?? [];
      locationsList.remove(event.locationId);
      prefs.setStringList('locations', locationsList);
      yield currentState.rebuild((b) => b
        ..locations = locationsList);
    }
    if (event is LocationsUpdateEvent) {
      yield currentState.rebuild((b) => b..locations = event.locations);
    }
  }
}

abstract class HomeEvent {}

class PageChangedEvent extends HomeEvent {
  final int currentPage;

  PageChangedEvent(this.currentPage);

  @override
  String toString() => 'PageChangedEvent';
}

class RemoveLocationEvent extends HomeEvent {
  final String locationId;

  RemoveLocationEvent(this.locationId);

  @override
  String toString() => 'RemoveLocationEvent';
}

class LocationsUpdateEvent extends HomeEvent {
  final List<String> locations;

  LocationsUpdateEvent(this.locations);

  @override
  String toString() => 'LocationsUpdateEvent';
}
