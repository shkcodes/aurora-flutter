import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather_app/bloc/add_location_bloc.dart';
import 'package:my_weather_app/state/add_location_state.dart';
import 'package:my_weather_app/ui/home.dart';
import 'package:permission_handler/permission_handler.dart';

class AddLocationScreen extends StatefulWidget {
  final bool isOnboardingFlow;

  AddLocationScreen({this.isOnboardingFlow});

  @override
  State<StatefulWidget> createState() {
    return AddLocationScreenState(isOnboardingFlow: isOnboardingFlow);
  }
}

class AddLocationScreenState extends State<AddLocationScreen> {
  final AddLocationBloc bloc = AddLocationBloc();
  final bool isOnboardingFlow;
  StreamSubscription subscription;

  AddLocationScreenState({this.isOnboardingFlow});

  @override
  void initState() {
    subscribeToEffects();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const iconSize = 75.0;
    return Scaffold(
      body: BlocBuilder<AddLocationEvent, AddLocationState>(
        bloc: bloc,
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgImage.asset('assets/images/search.svg', Size(iconSize, iconSize)),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "SEARCH FOR YOUR CITY",
                  style: TextStyle(letterSpacing: 3, fontFamily: 'Rokkitt', color: Colors.black54),
                ),
                SizedBox(
                  height: 64,
                ),
                Container(
                  height: 1.5,
                  margin: EdgeInsetsDirectional.only(start: 64.0, end: 64.0),
                  color: Colors.black12,
                ),
                SizedBox(
                  height: 64,
                ),
                InkWell(
                    onTap: () {
                      PermissionHandler()
                          .requestPermissions([PermissionGroup.locationWhenInUse]).then(
                        (statuses) {
                          var status = statuses[PermissionGroup.locationWhenInUse];
                          if (status == PermissionStatus.granted) {
                            getUserLocation();
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: new Text("Please grant the location permission"),
                            ));
                          }
                        },
                      );
                    },
                    child: SvgImage.asset('assets/images/location.svg', Size(iconSize, iconSize))),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "USE YOUR DEVICE'S LOCATION",
                  style: TextStyle(letterSpacing: 3, fontFamily: 'Rokkitt', color: Colors.black54),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void getUserLocation() async {
    Position location =
        await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    bloc.dispatch(
        LocationReceivedEvent(latitude: location.latitude, longitude: location.longitude));
  }

  void subscribeToEffects() {
    subscription = bloc.effects.stream.listen((effect) async {
      if (effect is CloseScreen) {
        if (isOnboardingFlow != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(effect.locations)),
          );
        } else {
          Navigator.pop(context, effect.locations);
        }
      }
    });
  }
}
