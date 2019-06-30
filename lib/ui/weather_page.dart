import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/bloc/weather_bloc.dart';
import 'package:my_weather_app/state/weather_state.dart';
import 'package:my_weather_app/ui/weather_forecase_carousel.dart';

class WeatherPage extends StatefulWidget {
  final int locationId;

  WeatherPage(this.locationId);

  @override
  State<StatefulWidget> createState() {
    return WeatherPageState(locationId);
  }
}

class WeatherPageState extends State<WeatherPage> {
  final WeatherBloc bloc = WeatherBloc();

  final int locationId;

  WeatherPageState(this.locationId);

  @override
  void initState() {
    super.initState();
    bloc.dispatch(LoadWeatherEvent(locationId));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<WeatherEvent, WeatherState>(
            bloc: bloc,
            builder: (BuildContext context, WeatherState state) {
              if (state.isLoading || state.weather.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                final currentWeather = state.weather[0];
                return Column(
                  children: <Widget>[
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      state.location.toUpperCase(),
                      style: TextStyle(
                          fontSize: 32,
                          letterSpacing: 10,
                          fontFamily: 'Rokkitt',
                          color: Colors.white),
                    ),
                    Text(
                      getTodayDate(),
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 56.0,
                    ),
                    Text(
                      currentWeather.weatherStateName.toUpperCase(),
                      style: TextStyle(
                          fontSize: 32,
                          letterSpacing: 2,
                          fontFamily: 'Rokkitt',
                          color: Colors.white54),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    SvgImage.asset(currentWeather.getIcon(), new Size(150.0, 150.0)),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "${currentWeather.temperature.toInt()}°",
                      style: TextStyle(
                          fontSize: 64,
                          letterSpacing: 3,
                          fontFamily: 'Rokkitt',
                          color: Colors.white54),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    WeatherForecastCarousel(
                      weather: state.weather.sublist(1),
                    )
                  ],
                );
              }
            }));
  }

  String getTodayDate() {
    var now = new DateTime.now();
    return DateFormat('EEE, dd MMM').format(now).toUpperCase();
  }
}
