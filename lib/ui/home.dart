import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/bloc/weather_bloc.dart';
import 'package:my_weather_app/state/weather_state.dart';
import 'package:my_weather_app/ui/add_location.dart';
import 'package:my_weather_app/ui/weather_forecase_carousel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

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
    loadWeatherForLocations();
  }

  Future loadWeatherForLocations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final locationsList = prefs.getStringList('locations');
    bloc.dispatch(LoadWeatherEvent(int.parse(locationsList[0])));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<WeatherEvent, WeatherState>(
            bloc: bloc,
            builder: (BuildContext context, WeatherState state) {
              if (state.isLoading || state.weather.isEmpty) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
                  ),
                  child: Stack(
                    children: <Widget>[
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: Container(
                          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.2)),
                        ),
                      ),
                      Center(child: CircularProgressIndicator())
                    ],
                  ),
                );
              } else {
                final currentWeather = state.weather[0];
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
                          SizedBox(
                            height: 24.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddLocationScreen()),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32.0,
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
                            height: 64.0,
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
                      ),
                    ),
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
