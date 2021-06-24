import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


//This file is loading screen of our page
//It just have to show a animation till the WeatherModel fetch the weather data
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


//to know about asynchronous method check scratch.dart
class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async{ //making this method async to WeatherModel can getLocation the we will show that on screen
    var weatherData =await WeatherModel().getLocationWeather();

    //Navigator only push screen when weatherData is fetched
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData: weatherData);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50,
        ),
    ));
  }
}