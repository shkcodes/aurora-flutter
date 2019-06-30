import 'package:bloc/bloc.dart';
import 'package:my_weather_app/state/home_state.dart';

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

class LocationsUpdateEvent extends HomeEvent {
  final List<String> locations;

  LocationsUpdateEvent(this.locations);

  @override
  String toString() => 'LocationsUpdateEvent';
}
