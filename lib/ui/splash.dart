import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  Future navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final locationsList = prefs.getStringList('locations') ?? [];
    if (locationsList.isEmpty) {
      Navigator.of(context).pushReplacementNamed('/add_location');
    } else {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(48),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/app_icon.png'),
              SizedBox(
                height: 16,
              ),
              Text(
                'AURORA WEATHER',
                style: TextStyle(fontSize: 24, letterSpacing: 1.2, fontFamily: 'Rokkitt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
