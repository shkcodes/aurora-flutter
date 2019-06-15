import 'package:bloc/bloc.dart';
import 'package:my_weather_app/state/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  dispose() {
    super.dispose();
  }

  @override
  SplashState get initialState => SplashState();

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {}
}

abstract class SplashEvent {}
