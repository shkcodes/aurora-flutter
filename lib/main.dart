import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/ui/home.dart';
import 'package:my_weather_app/ui/splash.dart';

import 'bloc/splash_bloc.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  final SplashBloc splashBloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [BlocProvider<SplashBloc>(bloc: splashBloc)],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.deepOrange[700],
            accentColor: Colors.cyan,
            brightness: Brightness.dark,
            fontFamily: 'Rokkitt'),
        home: BlocProvider<SplashBloc>(
          bloc: splashBloc,
          child: SplashScreen(),
        ),
        routes: <String, WidgetBuilder>{'/home': (BuildContext context) => HomeScreen()},
      ),
    );
  }
}
