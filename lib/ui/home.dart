import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/bloc/home_bloc.dart';
import 'package:my_weather_app/state/home_state.dart';
import 'package:my_weather_app/ui/weather_page.dart';

import 'add_location.dart';

class HomeScreen extends StatefulWidget {
  final List<String> locations;

  HomeScreen(this.locations);

  @override
  HomeScreenState createState() {
    return HomeScreenState(locations);
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<String> locations;
  final HomeBloc bloc = HomeBloc();

  HomeScreenState(this.locations);
  @override
  void initState() {
    super.initState();
    bloc.dispatch(LocationsUpdateEvent(locations));
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
          bloc: bloc,
          builder: (BuildContext context, HomeState state) {
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
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Opacity(
                          opacity: 0.0,
                          child: IconButton(
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
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: state.locations.map((it) {
                              return Container(
                                child: Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: state.currentPage == state.locations.indexOf(it)
                                          ? Colors.white
                                          : Colors.white24),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              addLocation(context);
                            }),
                      ],
                    ),
                    CarouselSlider(
                      enableInfiniteScroll: false,
                      viewportFraction: 1.0,
                      onPageChanged: (index) {
                        bloc.dispatch(PageChangedEvent(index));
                      },
                      height: MediaQuery.of(context).size.height - 80,
                      items: state.locations.map((it) {
                        return Builder(
                          builder: (BuildContext context) {
                            return WeatherPage(int.parse(it));
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }

  Future addLocation(BuildContext context) async {
    List<String> updatedLocations = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddLocationScreen()),
    );
    bloc.dispatch(LocationsUpdateEvent(updatedLocations));
  }

  String getCurrentDay() {
    var now = new DateTime.now();
    return DateFormat('EEE, dd MMM').format(now).toUpperCase();
  }
}
