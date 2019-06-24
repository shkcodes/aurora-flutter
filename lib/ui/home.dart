import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text("oh ${state.weather.length}"),
                );
              }
            }));
  }
}
