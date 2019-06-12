import 'package:flutter/material.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.deepOrange[700],
          accentColor: Colors.cyan,
          brightness: Brightness.dark),
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Aurora'),
        ),
        body: Container(
            child: Center(
          child: Text("Ello may8te"),
        )),
      ),
    );
  }
}
