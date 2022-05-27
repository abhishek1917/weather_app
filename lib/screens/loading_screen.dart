import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_geo/services/weather.dart';
import 'package:clima_geo/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherdata = await WeatherModel().getLocationWeather();
    print(weatherdata);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationweather: weatherdata,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: LocationScreen(

          // SpinKitDoubleBounce(
          //   color: Colors.white,
          //   size: 100.0,
          // )
          ),
    ));
  }
}
