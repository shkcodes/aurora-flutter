import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_weather_app/bloc/weather_bloc.dart';
import 'package:my_weather_app/state/weather_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  WeatherBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<WeatherBloc>(context);
    super.initState();
    bloc.dispatch(LoadWeatherEvent());
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<WeatherEvent, WeatherState>(
            bloc: bloc,
            builder: (BuildContext context, WeatherState state) {
              if (state.isLoading || state.weather.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                print(state.weather[0].weatherStateName);
                final weatherInfo = state.weather[0];
                return Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: Container(
                          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: <Widget>[
                          SvgImage.asset(weatherInfo.getIcon(), new Size(100.0, 100.0)),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            weatherInfo.weatherStateName.toUpperCase(),
                            style: TextStyle(
                                fontSize: 32,
                                letterSpacing: 3,
                                fontFamily: 'Rokkitt',
                                color: Colors.white54),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }));
  }
}
