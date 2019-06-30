import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/models/weather.dart';

class WeatherForecastCarousel extends StatelessWidget {
  final List<Weather> weather;

  WeatherForecastCarousel({
    Key key,
    @required this.weather,
  })  : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> dayNames = getDayNames();
    return CarouselSlider(
      enableInfiniteScroll: false,
      items: weather.map((it) {
        return Builder(
          builder: (BuildContext context) {
            return getWeatherCard(it, context, dayNames[weather.indexOf(it)]);
          },
        );
      }).toList(),
    );
  }

  Widget getWeatherCard(Weather weather, BuildContext context, String day) {
    return Card(
      color: Colors.white10,
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              day,
              style: TextStyle(fontSize: 24, fontFamily: 'Rokkitt', color: Colors.white54),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${weather.temperature.toInt()}°",
                  style: TextStyle(fontSize: 64, fontFamily: 'Rokkitt', color: Colors.white54),
                ),
                SvgImage.asset(weather.getIcon(), new Size(64.0, 64.0)),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              weather.weatherStateName.toUpperCase(),
              style: TextStyle(
                  fontSize: 16, letterSpacing: 2, fontFamily: 'Rokkitt', color: Colors.white54),
            )
          ],
        ),
      ),
    );
  }

  List<String> getDayNames() {
    List<String> names = [];
    names.add("TOMORROW");
    var now = DateTime.now();
    for (var i = 1; i < weather.length; i++) {
      now = now.add(Duration(days: 1));
      names.add(DateFormat('EEE, dd MMM').format(now).toUpperCase());
    }
    return names;
  }
}
