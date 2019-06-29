import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather_app/bloc/add_location_bloc.dart';
import 'package:my_weather_app/state/add_location_state.dart';
import 'package:my_weather_app/ui/home.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddLocationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddLocationScreenState();
  }
}

class AddLocationScreenState extends State<AddLocationScreen> {
  AddLocationBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<AddLocationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const iconSize = 75.0;
    return BlocListener<AddLocationEvent, AddLocationState>(
      bloc: bloc,
      listener: (context, state) async {
        if (state.locationId != 0) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          final locationsList = prefs.getStringList('locations') ?? [];
          locationsList.add(state.locationId.toString());
          prefs.setStringList('locations', locationsList);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      },
      child: Scaffold(
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
      )),
    );
  }

  void getUserLocation() async {
    Position location =
        await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    bloc.dispatch(
        LocationReceivedEvent(latitude: location.latitude, longitude: location.longitude));
  }
}
