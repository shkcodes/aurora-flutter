import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/ui/add_location/add_location.dart';
import 'package:my_weather_app/ui/home.dart';
import 'package:my_weather_app/ui/splash.dart';

import 'bloc/add_location_bloc.dart';
import 'bloc/splash_bloc.dart';
import 'bloc/weather_bloc.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  final SplashBloc splashBloc = SplashBloc();
  final WeatherBloc weatherBloc = WeatherBloc();
  final AddLocationBloc addLocationBloc = AddLocationBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<SplashBloc>(bloc: splashBloc),
        BlocProvider<WeatherBloc>(bloc: weatherBloc),
        BlocProvider<AddLocationBloc>(bloc: addLocationBloc),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.deepOrange[700], accentColor: Colors.cyan, fontFamily: 'Rokkitt'),
        home: BlocProvider<SplashBloc>(
          bloc: splashBloc,
          child: SplashScreen(),
        ),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeScreen(),
          '/add_location': (BuildContext context) => AddLocationScreen(),
        },
      ),
    );
  }
}
