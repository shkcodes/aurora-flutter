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

class AddLocationScreenState extends State<AddLocationScreen> with SingleTickerProviderStateMixin {
  final AddLocationBloc bloc = AddLocationBloc();
  final bool isOnboardingFlow;
  StreamSubscription subscription;
  AnimationController controller;
  Animation<Offset> animateUpOffset;
  Animation<Offset> exitLeftOffset;
  Animation<Offset> exitRightOffset;
  final textFieldController = TextEditingController();
  FocusNode focusNode = new FocusNode();

  AddLocationScreenState({this.isOnboardingFlow});

  @override
  void initState() {
    super.initState();
    subscribeToEffects();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    animateUpOffset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -5.0))
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.5, 1.0)));
    exitLeftOffset = Tween<Offset>(begin: Offset.zero, end: Offset(-5.0, 0.0)).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          bloc.dispatch(SearchClickEvent(true));
          FocusScope.of(context).requestFocus(focusNode);
        } else {
          bloc.dispatch(SearchClickEvent(false));
        }
      });
    exitRightOffset = Tween<Offset>(begin: Offset.zero, end: Offset(5.0, 0.0)).animate(controller);
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
      resizeToAvoidBottomInset: false,
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
                Visibility(
                  visible: state.isSearching,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          textFieldController.text = "";
                          controller.reverse();
                        },
                      )
                    ],
                  ),
                ),
                SlideTransition(
                  position: exitLeftOffset,
                  child: InkWell(
                      onTap: () {
                        controller.forward();
                      },
                      child: SvgImage.asset('assets/images/search.svg', Size(iconSize, iconSize))),
                ),
                SizedBox(
                  height: 24,
                ),
                SlideTransition(
                  position: exitLeftOffset,
                  child: Text(
                    "SEARCH FOR YOUR CITY",
                    style:
                        TextStyle(letterSpacing: 3, fontFamily: 'Rokkitt', color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
                SlideTransition(
                  position: animateUpOffset,
                  child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 64.0, end: 64.0),
                      child: TextField(
                        focusNode: focusNode,
                        controller: textFieldController,
                        enabled: state.isSearching,
                        decoration: InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: 64,
                ),
                SlideTransition(
                  position: exitRightOffset,
                  child: InkWell(
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
                      child:
                          SvgImage.asset('assets/images/location.svg', Size(iconSize, iconSize))),
                ),
                SizedBox(
                  height: 24,
                ),
                SlideTransition(
                  position: exitRightOffset,
                  child: Text(
                    "USE YOUR DEVICE'S LOCATION",
                    style:
                        TextStyle(letterSpacing: 3, fontFamily: 'Rokkitt', color: Colors.black54),
                  ),
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
    bloc.dispatch(LocationReceivedEvent(location.latitude, location.longitude));
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
